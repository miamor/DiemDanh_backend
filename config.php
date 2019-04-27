<?php
session_start();
error_reporting(E_ERROR | E_PARSE);

$__pattern = '/DiemDanh';

define('MAIN_PATH', './');

define('HOST_URL', '//localhost'.$__pattern);
define('MAIN_URL', 'http:'.HOST_URL);

$__page = str_replace($__pattern.'/', '', $_SERVER['REQUEST_URI']);


// Start config
$config = new Config();

if (check($__page, '?') > 0) $__page = $__page.'&';
else $__page = $__page;


$__pageAr = array_values(array_filter(explode('/', explode('?', rtrim($__page))[0])));
$subpage = null;
if ($__pageAr) {
	$page = $__pageAr[0];
	$subpage = (array_key_exists(1, $__pageAr) && $__pageAr[1]) ? $__pageAr[1] : null;
	$requestAr = explode('?', $__page);
	$config->request = isset($requestAr[1]) ? $requestAr[1] : null;
//	if ($__pageAr[1]) $subpage = $__pageAr[1];
} else if (check($__page, '?')) $config->request = explode('?', $__page)[1];

$v = $config->get('v');
$temp = $config->get('temp');
$type = $config->get('type');
$do = $config->get('do');
$mode = $config->get('mode');
if (check($__page, 'requests')) {
	$config->__request = explode('.', end(explode('/', $__page)))[0];
}

//header('Content-Type: application/json; charset=utf-8');
// End config


/*if (isset($_SERVER['HTTP_ORIGIN'])) {
	header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
	header('Access-Control-Allow-Credentials: true');
	header('Access-Control-Max-Age: 86400');// cache for 1 day
}*/

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
		header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
		header("Access-Control-Allow-Headers:{$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

	exit(0);
}



if ($_SERVER['REQUEST_METHOD'] == 'POST' && empty($_POST)) {
    $_POST = json_decode(file_get_contents('php://input'), true);
}

define('FB_APP_ID', '227904834368737');
define('FB_APP_SECRET', '7a2ea311a4ca8f5263a71cf326763d38');

/*
require_once 'Facebook/autoload.php';
use Facebook\FacebookSession;
use Facebook\FacebookRedirectLoginHelper;
use Facebook\FacebookRequest;
use Facebook\FacebookResponse;
use Facebook\FacebookSDKException;
use Facebook\FacebookRequestException;
use Facebook\FacebookAuthorizationException;
use Facebook\GraphObject;
use Facebook\Entities\AccessToken;
use Facebook\HttpClients\FacebookCurlHttpClient;
use Facebook\HttpClients\FacebookHttpable;
*/

class Config {

	// specify your own database credentials
	private $host = "localhost";
	private $db_name = "DiemDanh";
	private $username = "root";
	private $password = ""; // 123456
	private $port = "3306";
	protected $conn;
	public $u;
	public $me;
	public $request;
	public $JS;

	public function __construct () {
		$this->JS = '';
/*		$this->FB = new Facebook\Facebook([
			'app_id' => FB_APP_ID, // Replace {app-id} with your app id
			'app_secret' => FB_APP_SECRET,
			'default_graph_version' => 'v2.2',
		]);
*/		$this->currentURL = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		$this->u = (isset($_SESSION['taxi'])) ? (int)$_SESSION['taxi'] : null;
		if ($this->getConnection()) {
			$this->me = $this->getUserInfo();
			return true;
		}
		else return false;
	}

	// get the database connection
	public function getConnection() {

		$this->conn = null;

		try {
			$this->conn = new PDO("mysql: host=" . $this->host . ";port=".$this->port.";dbname=" . $this->db_name, $this->username, $this->password);
			$this->conn->exec("set names utf8");
		} catch (PDOException $exception) {
			echo "Connection error: " . $exception->getMessage();
		}

		return $this->conn;
	}

	// used for the 'created' field when creating a product
	function getTimestamp() {
		date_default_timezone_set('Asia/Manila');
		$this->timestamp = date('Y-m-d H:i:s');
	}

	public function getUserInfo ($u = '', $fields = '') {
		if (!$u) $u = $this->u;
/*		$defaultFields = 'id,type,oauth_id,oauth_token,title,avatar,username,first_name,last_name,online,rank,coins,is_mod,is_admin';
		if (!$fields) $fields = $defaultFields;
		else $fields .= ','.$defaultFields;
*/
		$defaultFields = '*';
		$query = "SELECT
					*
				FROM
					members
				WHERE
					id = ?
				LIMIT
					0,1";

		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $u);
		$stmt->execute();

		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		if (isset($row['id']) && $row['id']) {
			$row['is_mod'] = (int)$row['is_mod'];
			$row['is_admin'] = (int)$row['is_admin'];
			if (isset($row['type']) && $row['type'] == 1) $row['name'] = $row['title'];
			else $row['name'] = ($row['last_name']) ? ($row['last_name'].' '.$row['first_name']) : $row['first_name'];
//			$thelink = (isset($row['type']) && $row['type'] == 1) ? $this->pLink : $this->uLink;
			$thelink = $this->uLink;
//			$row['username'] = $row['oauth_uid'];
			$row['link'] = $thelink.'/'.$row['username'];

			// my pages
			$row['myPage'] = $this->getPages();
			$row['reviews'] = $this->getUserReviewsNum();

			// followers, following
			$row['followers_txt'] = $row['followers'];
			$row['followings_txt'] = $row['followings'];
			if ($row['followers']) {
				preg_match_all("/\[(.*?)\]/", $row['followers'], $matches);
				$row['followers'] = $matches[1];
			} else $row['followers'] = array();
			if ($row['followings']) {
				preg_match_all("/\[(.*?)\]/", $row['followings'], $matches);
				$row['followings'] = $matches[1];
			} else $row['followings'] = array();
			$row['followersNum'] = count($row['followers']);
			$row['followingsNum'] = count($row['followings']);
		}
		return $row;
	}

	function getUserReviewsNum ($u = null) {
		if (!$u) $u = $this->u;
		$query = "SELECT id FROM books_reviews WHERE uid = ?";
		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $u);
		$stmt->execute();
		return $stmt->rowCount();
	}

	function sGetUserInfo ($u = null) {
		if (!$u) $u = $this->u;
		$query = "SELECT
					id,username,first_name,last_name,avatar,type,title,online
				FROM
					members
				WHERE
					id = ?
				LIMIT
					0,1";

		$stmt = $this->conn->prepare( $query );
		$stmt->bindParam(1, $u);
		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		if ($row['id']) {
			if ($row['type'] == 1) $row['name'] = $row['title'];
			else $row['name'] = ($row['last_name']) ? ($row['last_name'].' '.$row['first_name']) : $row['first_name'];
			$thelink = $this->uLink;
//			$row['username'] = $row['oauth_uid'];
			$row['link'] = $thelink.'/'.$row['username'];
			return $row;
		}
		return false;
	}

	function getPages ($u = null) {
		if (!$u) $u = $this->u;
		$query = "SELECT * FROM members WHERE uid = ?";
		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $u);
		$stmt->execute();
		$page = array();
		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
			$page[] = $row;
		}
		return $page;
	}

	function getUserCoins ($u = null) {
		if (!$u) $u = $this->u;
		$query = "SELECT coins FROM members WHERE id = ? LIMIT 0,1";
		$stmt = $this->conn->prepare( $query );
		$stmt->bindParam(1, $u);
		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		return $row['coins'];
	}

	function addCoin ($coin, $u = null) {
		if ($u) {
			// get coin
			$old_coins = $this->getUserCoins($u);
		}
		else {
			$u = $this->u;
			$old_coins = $this->me['coins'];
		}
		$new_coins = $old_coins + $coin;
		$query = "UPDATE members SET coins = :coins WHERE id = :id";
		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(':coins', $new_coins);
		$stmt->bindParam(':id', $u);
		if ($stmt->execute()) {
			return true;
		}
		else return false;
	}

	function sGetUserInfo_FB ($fb_uid) {
		$query = "SELECT
					id,username,first_name,last_name,avatar,followers
				FROM
					members
				WHERE
					oauth_uid = ?
				LIMIT
					0,1";

		$stmt = $this->conn->prepare( $query );
		$stmt->bindParam(1, $fb_uid);
		$stmt->execute();

		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		$row['name'] = ($row['last_name']) ? ($row['last_name'].' '.$row['first_name']) : $row['first_name'];
		$row['link'] = $this->uLink.'/'.$row['username'];
		if ($row['followers']) {
			preg_match_all("/\[(.*?)\]/", $row['followers'], $matches);
			$row['followers'] = $matches[1];
		} else $row['followers'] = array();
		return $row;
	}

	function getFollowers ($u) {
		$query = "SELECT followers FROM members WHERE id = ? LIMIT 0,1";
		$stmt = $this->conn->prepare( $query );
		$stmt->bindParam(1, $u);
		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		return (isset($row['followers_txt'])) ? $row['followers_txt'] : '';
	}

	function addFollower ($u, $followerID = null) {
		if (!$followerID) $followerID = $this->u;
		$uFollowers = $this->getFollowers($u).' ['.$followerID.']';
		$uFollowers = str_replace(' ', ',', trim($uFollowers));

		$query = "UPDATE members SET followers = :followers WHERE id = :id";
		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(':followers', $uFollowers);
		$stmt->bindParam(':id', $u);
		if ($stmt->execute()) {
			return true;
		}
		else return false;
	}

	function follow ($friendID) {
		if (!in_array($friendID, $this->me['followings'])) {
			$followings = $this->me['followings_txt'].' ['.$friendID.']';
			$followings = str_replace(' ', ',', trim($followings));
			$query = "UPDATE members SET followings = :followings WHERE id = :id";
			$stmt = $this->conn->prepare($query);
			$stmt->bindParam(':followings', $followings);
			$stmt->bindParam(':id', $this->u);
			if ($stmt->execute()) {
				if ($this->addFollower($friendID)) {
					return true;
				} else return false;
			}
			else return false;
		} else return false;
	}

	function follow_FB ($friend_fb_ID) {
		$query = "SELECT id FROM members WHERE oauth_uid = ? LIMIT 0,1";
		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $friend_fb_ID);
		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		if (isset($row['id'])) {
			if ($this->follow($row['id'])) return true;
			else return false;
		} else return false;
	}

	function _getRatings ($query, $valAr, $isRate = true) {
		if ($query) {
			$num = 0;
			if ($this->isFeed == true) $num = 3;
			if ($num > 0) $lim = 'LIMIT 0, '.$num;
			else $lim = '';

			$query .= " ORDER BY modified DESC, created DESC, id DESC ";
//			echo $query;

			$stmt = $this->conn->prepare($query);
			if ($valAr) {
				foreach ($valAr as $k => $oV) {
					$stmt->bindParam($k+1, $valAr[$k]);
				}
			}
			$stmt->execute();

			$ratingsList = array();
				$totalReview = 0;
			if ($isRate) {
				$totalRates = 0;
				$this->rCoins = 0;
			}
			$k = 0;
			while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
					$totalReview++;
				if ($isRate) {
					$totalRates += $row['rate'];
					// set coins for review got rated
					if (check($query, 'reviews')) $coinsDefault = COINS_RATE_USER_WRITE_REVIEW;
					else if (check($query, 'chapters')) $coinsDefault = COINS_RATE_USER_WRITE_CHAPTER;
					$row['coins'] = $coinsDefault*$row['rate']/5;
					$this->rCoins += $row['coins'];
				}

				if (!$this->isFeed || ($this->isFeed && $k < 2)) {
					$k++;
					$row['author'] = $this->getUserInfo($row['uid']);
//					$row['content'] = content($row['content']);
					$row['content'] = htmlspecialchars($row['content']);
					$cLen = strlen($row['content']);
	/*				if ($cLen > 400) $row['content_feed'] = content(substr($row['content'], 0, 400)).'<span class="text-more-dots">...</span><span class="text-more-hidden hide">'.substr($row['content'], 401, $cLen).' <a href="'.$row['link'].'" id="'.$row['id'].'" class="stt-read gensmall">See more</a>';
					else $row['content_feed'] = $row['content'];
	*/
					$row['content_feed'] = $row['content'];
					$ratingsList[] = $row;
				}
			}

			if ($isRate) {
				if ($totalReview == 0) $averageRate = 0;
				else $averageRate = $totalRates/$totalReview;
				if (($averageRate - floor($averageRate)) >= 0.5) $averageRate = floor($averageRate) + 0.5;
				else $averageRate = floor($averageRate);

				$this->rAverage = number_format($averageRate, 1);
			}
			$this->rTotal = $totalReview;

			$ratingsList = array_reverse($ratingsList);

			return $ratingsList;
		}
		return false;
	}

/*	function _countRatings ($query = '', $valAr = array()) {
		$query = str_replace('*', "id,rate", $query);
		if ($query && $valAr) {
			$stmt = $this->conn->prepare($query);
			foreach ($valAr as $k => $oV) {
				$stmt->bindParam($k+1, $valAr[$k]);
			}
			$stmt->execute();
			return $stmt->rowCount();
		}
		return false;
	}
*/
	function checkThisNoti ($valueAr, $u) {
		foreach ($valueAr as $vK => $oneField) {
			$condAr[] = "{$vK} = '{$oneField}'";
		}
		$condAr[] = "uid = '{$u}'";
		$cond = implode(' AND ', $condAr);
		$query = "SELECT id FROM
					notification
				WHERE
					{$cond}
				LIMIT 0,1";
		$stmt = $this->conn->prepare($query);
		$stmt->execute();
		return $stmt->rowCount();
	}

	function removeNoti ($valueAr, $u) {
		foreach ($valueAr as $vK => $oneField) {
			$condAr[] = "{$vK} = '{$oneField}'";
		}
		$condAr[] = "uid = '{$u}'";
		$cond = implode(' AND ', $condAr);
		$query = "DELETE FROM notification WHERE {$cond}";
		$stmt = $this->conn->prepare($query);
		if ($stmt->execute()) return true;
		else return false;
	}

	function addNoti ($valueAr, $u = null) {
		if (!$u) $u = $this->u;
		$fromUID = (isset($valueAr['from_uid'])) ? $valueAr['from_uid'] : 0;
	if ($fromUID != $u) {
		$condAr = array();
		$remove = false;

		$content = $valueAr['content'];
		if ($valueAr['type'] == 'like-post') {
			unset($valueAr['content']);
			// check if have noti of liking this post, then delete this noti, not insert
			if ($this->checkThisNoti($valueAr, $u)) $remove = true;
		}
		if ($remove == true) return $this->removeNoti($valueAr, $u);

		$valueAr['content'] = $content;
		foreach ($valueAr as $vK => $oneField) {
//			$oneField = htmlspecialchars(strip_tags($oneField));
			$oneField = str_replace("'", "\'", $oneField);
			$condAr[] = "{$vK} = '{$oneField}'";
		}
		$condAr[] = "uid = '{$u}'";
		$cond = implode(', ', $condAr);
		$query = "INSERT INTO
					notification
				SET {$cond}";
		$stmt = $this->conn->prepare($query);
		if ($stmt->execute()) {
			return true;
		}
		else return false;
	} // end if
		return true;
	}

	function getDetails ($u) {
		if (!$u) $u = $this->u;
		$query = "SELECT compile_details,iid,score FROM submissions WHERE uid = ?";

		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $u);
		$stmt->execute();

		$probAr = array();
		$division = $score = $aScore = 0;
		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
			$ar = explode('|', $row['compile_details']);
			$iid = $row['iid'];
			if (!in_array($iid, $probAr)) $probAr[$iid] = 1;
			else $probAr[$iid]++;
			$resultsChart = array_count_values($ar);
			$division++;
			$score += $row['score'];
		}
		if ($score != 0) $aScore = round($score/$division);
		$results = array('score' => $aScore, 'totalProb' => count($probAr), 'totalSub' => count($stmt->rowCount()), 'chart' => $resultsChart);
		return $results;
	}

	function get ($char) {
		$request = $this->request;
		if ($request && check($request, $char) > 0) {
			$ca = explode($char.'=', $request);
			if (isset($ca[1])) {
				$c = $ca[1];
				$c = explode('&', $c)[0];
				$request = str_replace("{$char}={$c}&", "", $request);
				return $c;
			}
		}
		return null;
	}


	// show errors
	function E ($errorCode) {
		$config->errors[] = $errorCode;
	}
	function E_show () {
		foreach ($config->errors as $errorCode) {
			switch ($errorCode) {
				case "1": // no item found
					$eHTML = 'No item found!';
					break;
			}
			echo '<div class="alerts alert-error">'.$eHTML.'</div>';
		}
	}

	// emoticons
/*	function emoTextareaDropdown () {
		$emoTextareaDefault = $emoTextareaMore = array();
		// read dir
		$eDir = MAIN_PATH."assets/emoticons/";
		$eDirScan = scandir($eDir);
		foreach ($eDirScan as $oneEmoDir) {
			$emoDir = $eDir.$oneEmoDir;
			if (is_dir($emoDir) && $oneEmoDir != "." && $oneEmoDir != "..") {
				$emos = scandir($emoDir);
				foreach ($emos as $_k => $emo) {
					if (is_file($emoDir.'/'.$emo)) {
						$key = explode('.', $emo)[0];
						if ($oneEmoDir != 'default') $key = ':'.$key.':';
						$path = $oneEmoDir.'/'.$emo;
						if ($oneEmoDir == 'default') {
							$emoTextareaDefault[] = $emoTextareaMore[] = '"'.$key.'":"'.$path.'"';
						} else {
							$emoTextareaMore[] = '"'.$key.'":"'.$path.'"';
						}
					}
				}
			}
		}
		$this->emoTextareaDefault = implode(',', $emoTextareaDefault);
		$this->emoTextareaMore = implode(',', $emoTextareaMore);
	}
*/

	function addJS ($type, $link) {
		if ($type == -1) {
			$this->JS .= $link.'|';
		}
		else {
			if ($type == 'dist') {
				$type = 'dist/js';
			}
			$this->JS .= ASSETS.'/'.$type.'/'.$link.'|';
		}
	}
	function echoJS () {
		$exJS = explode('|', $this->JS);
		foreach ($exJS as $exjs) {
			if ($exjs) echo '<script src="'.$exjs.'"></script>';
		}
	}

}


function mb_ucfirst ($string, $encoding = "UTF-8") {
	$strlen = mb_strlen($string, $encoding);
	$firstChar = mb_substr($string, 0, 1, $encoding);
	$then = mb_substr($string, 1, $strlen - 1, $encoding);
	return mb_strtoupper($firstChar, $encoding) . $then;
}

function checkInternet ($sCheckHost = 'www.google.com')  {
 $connected = @fsockopen($sCheckHost, 80);
 return (bool) $connected;
}

	function ggsearch ($query, $cx) {
		$key = GG_API_KEY;
		$cx = urlencode($cx);
		$query = urlencode($query);
		$url = "https://www.googleapis.com/customsearch/v1?cx={$cx}&key={$key}&q={$query}";
//		echo $url;
		$google_search = file_get_contents($url);
		return ($google_search);
	}

	function check ($haystack, $needle) {
	//	return strlen(strstr($string, $word)); // Find $word in $string
		return substr_count($haystack, $needle); // Find $word in $string
	}

	function checkURL ($word) {
		return check($_SERVER['REQUEST_URI'], $word);
	}

	function strip_comments ($str) {
		$str = preg_replace('!/\*.*?\*/!s', '', $str);
		$str = preg_replace('/\n\s*\n/', "\n", $str);
		$str = preg_replace('![ \t]*//.*[ \t]*[\r\n]!', '', $str);
		return $str;
	}

function str_insert_after ($str, $search, $insert) {
 $index = strpos($str, $search);
 if ($index === false) {
  return $str;
 }
 return substr_replace($str, $search.$insert, $index, strlen($search));
}

function str_insert_before ($str, $search, $insert) {
 $index = strpos($str, $search);
 if ($index === false) {
  return $str;
 }
 return substr_replace($str, $insert.$search, $index, strlen($search));
}

function content ($content) {
	$content = nl2br($content);
	$content = str_replace('<br><br>', '<br/>', $content);
//	$content = preg_replace("/(#(\w+))/", '<a href="'.MAIN_URL.'/hashtag/$2">$1</a>', $content);
	//$content = preg_replace('/(^|\s)#(\w*[a-zA-Z_]+\w*)/', '\1#<a href="'.$config->hashtagLink.'\2">\2</a>', $content);
//	return nl2br($content);
	return $content;
}

function random_color_part() {
 return str_pad( dechex( mt_rand( 0, 255 ) ), 2, '0', STR_PAD_LEFT);
}

function random_color() {
 return random_color_part() . random_color_part() . random_color_part();
}

function generateRandomString ($length = 6) {
 $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
 $charactersLength = strlen($characters);
 $randomString = '';
 for ($i = 0; $i < $length; $i++) {
  $randomString .= $characters[rand(0, $charactersLength - 1)];
 }
 return $randomString;
}

function isVn ($str) {
//	$uni = 'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ|đ|é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ|í|ì|ỉ|ĩ|ị|ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ|ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự|ý|ỳ|ỷ|ỹ|ỵ|Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ|Đ|É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ|Í|Ì|Ỉ|Ĩ|Ị|Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ|Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự|Ý|Ỳ|Ỷ|Ỹ|Ỵ';
	$uni = 'ả|ạ|ắ|ặ|ằ|ẳ|ẵ|ấ|ầ|ẩ|ẫ|ậ|ẻ|ẽ|ẹ|ế|ề|ể|ễ|ệ|ỉ|ĩ|ị|ỏ|ố|ồ|ổ|ỗ|ộ|ớ|ờ|ở|ỡ|ợ|ủ|cũng|ụ|ứ|ừ|ử|ữ|ự|ỷ|ỹ';
	$chars = explode('|', $uni);
	if (preg_match_all("/($uni)/i", $str, $matches)) { // if match
		return true;
	}
	return false;
}

function vn_str_filter ($str) {
	$unicode = array(
		'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
		'd'=>'đ',
		'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
		'i'=>'í|ì|ỉ|ĩ|ị',
		'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
		'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
		'y'=>'ý|ỳ|ỷ|ỹ|ỵ',
		'A'=>'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
		'D'=>'Đ',
		'E'=>'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
		'I'=>'Í|Ì|Ỉ|Ĩ|Ị',
		'O'=>'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
		'U'=>'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
		'Y'=>'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
	);
	foreach ($unicode as $nonUnicode=>$uni) {
		$str = preg_replace("/($uni)/i", $nonUnicode, $str);
	}
	return $str;
}
function encodeURL ($string, $special = null) {
	if (!$special) $special = '-';
	$string = strtolower(str_replace(' ', $special, vn_str_filter($string)));
	return preg_replace('/[^A-Za-z0-9\-]/', '', $string);
}


define('ENCRYPTION_KEY', 'd0a7e7997b6d5fcd55f4b5c32611b87cd923e88837b63bf2941ef819dc8ca282');
// Encrypt Function
function mc_encrypt ($encrypt, $key) {
	$encrypt = serialize($encrypt);
	$iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC), MCRYPT_DEV_URANDOM);
	$key = pack('H*', $key);
	$mac = hash_hmac('sha256', $encrypt, substr(bin2hex($key), -32));
	$passcrypt = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, $encrypt.$mac, MCRYPT_MODE_CBC, $iv);
	$encoded = base64_encode($passcrypt).'|'.base64_encode($iv);
	return $encoded;
}
// Decrypt Function
function mc_decrypt ($decrypt, $key) {
	$decrypt = explode('|', $decrypt.'|');
	$decoded = base64_decode($decrypt[0]);
	$iv = base64_decode($decrypt[1]);
	if(strlen($iv)!==mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC)){
		return false;
	}
	$key = pack('H*', $key);
	$decrypted = trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $key, $decoded, MCRYPT_MODE_CBC, $iv));
	$mac = substr($decrypted, -64);
	$decrypted = substr($decrypted, 0, -64);
	$calcmac = hash_hmac('sha256', $decrypted, substr(bin2hex($key), -32));
	if($calcmac!==$mac){ return false; }
	$decrypted = unserialize($decrypted);
	return $decrypted;
}

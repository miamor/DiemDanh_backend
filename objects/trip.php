<?php
class Trip extends Config {

    private $table_name = "Trip";

    public function __construct() {
		parent::__construct();
	}


    public function create () {
        //write query
			$query = "INSERT INTO
					" . $this->table_name . "
				SET
					name = ?, phone = ?, addressfrom = ?, addressto = ?, PNR = ?, time = ?, seat = ?, is_round = ?, details = ?, num_guess = ?, price = ?, taxi_sell = ?";

		$stmt = $this->conn->prepare($query);

		// posted values
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->phone = htmlspecialchars(strip_tags($this->phone));
        $this->from = htmlspecialchars(strip_tags($this->from));
        $this->to = htmlspecialchars(strip_tags($this->to));
        $this->PNR = htmlspecialchars(strip_tags($this->PNR));
        $this->time = htmlspecialchars(strip_tags($this->time));
        $this->seat = htmlspecialchars(strip_tags($this->seat));
        $this->is_round = htmlspecialchars(strip_tags($this->is_round));
        $this->num_guess = htmlspecialchars(strip_tags($this->num_guess));
		$this->details = content($this->details);
        $this->taxi_sell = htmlspecialchars(strip_tags($this->taxi_sell));

        // bind parameters
		$stmt->bindParam(1, $this->name);
        $stmt->bindParam(2, $this->phone);
        $stmt->bindParam(3, $this->from);
        $stmt->bindParam(4, $this->to);
        $stmt->bindParam(5, $this->PNR);
        $stmt->bindParam(6, $this->time);
        $stmt->bindParam(7, $this->seat);
        $stmt->bindParam(8, $this->is_round);
        $stmt->bindParam(9, $this->details);
        $stmt->bindParam(10, $this->num_guess);
        $stmt->bindParam(11, $this->price);
        $stmt->bindParam(12, $this->taxi_sell);

        // execute the query
		if ($stmt->execute()) {
			return true;
		} else
			return false;
    }


    public function update () {

		$query = "UPDATE
					" . $this->table_name . "
				SET
					name = :name,
					des = :des
				WHERE
					id = :id";

		$stmt = $this->conn->prepare($query);

		// posted values
		$this->name = htmlspecialchars(strip_tags($this->name));
		$this->description = content($this->description);
		$this->id = htmlspecialchars(strip_tags($this->id));

		// bind parameters
		$stmt->bindParam(':name', $this->name);
		$stmt->bindParam(':des', $this->des);
		$stmt->bindParam(':id', $this->id);

		// execute the query
		if ($stmt->execute()) return true;
		else return false;
	}

    public function changeTripToSell () {

		$query = "UPDATE
					" . $this->table_name . "
				SET
					taxi_sell = :taxi_sell,
                    status = 0,
                    taxiid = NULL,
                    prioritize = NULL,
                    approve = 0
				WHERE
					id = :id";

		$stmt = $this->conn->prepare($query);

		// bind parameters
        $stmt->bindParam(':taxi_sell', $this->taxi_sell);
		$stmt->bindParam(':id', $this->id);

		// execute the query
		if ($stmt->execute()) return true;
		else return false;
	}


	public function delete () {

		$query = "DELETE FROM " . $this->table_name . " WHERE id = ?";

		$stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $this->id);

        // execute the query
		if ($result = $stmt->execute()) return true;
		else return false;
	}


    public function readAll_myPriority () {
        $now = date('Y-m-d');
        $query = "SELECT
					*
				FROM
					" . $this->table_name . "
				WHERE
                    approve = 1 AND status = 0 AND prioritize = ?
                ORDER BY
                    status ASC, time ASC, id ASC";

		$stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->taxiID);
		$stmt->execute();

		$all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : null);
            $row['is_one_round'] = ($row['is_round'] ? 0 : 1);
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $all_list[] = $row;
        }
        return $all_list;
    }

    public function readAll_today () {
        $now = date('Y-m-d');

        $query = "SELECT
					*
			FROM
				" . $this->table_name . "
			WHERE
                approve = 1
                AND status = 0
                AND time LIKE '{$now}%' AND
                prioritize IS NULL
            ORDER BY
                status ASC, time ASC, id ASC";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();

		$all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : null);
            $row['is_one_round'] = ($row['is_round'] ? 0 : 1);
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $all_list[] = $row;
        }
        return $all_list;
    }

    public function readAll ($withPri = 1) {
        $now = date('Y-m-d');
        $todayList = $this->readAll_today();

        $myPriority = $this->readAll_myPriority();
        $query = "SELECT
    					*
    				FROM
    					" . $this->table_name . "
    				WHERE
                        approve = 1
                        AND status = 0
                        AND time NOT LIKE '{$now}%' AND
                        prioritize IS NULL
                    ORDER BY
                        status ASC, time ASC, id ASC";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();

		$all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : null);
            $row['is_one_round'] = ($row['is_round'] ? 0 : 1);
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $all_list[] = $row;
        }

        $total = count($myPriority) + count($todayList) + count($all_list);
        $this->all_list = array('total'=> $total, 'myPriority'=>$myPriority, 'today'=>$todayList,
         'others'=>$all_list);
        return $this->all_list;
    }


    public function count_priority () {
        $now = date('Y-m-d');
        $query = "SELECT
					id,status,prioritize
				FROM
					" . $this->table_name . "
				WHERE
                    approve = 1 AND status = 0 AND prioritize = ?";

		$stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->taxiID);
		$stmt->execute();
        return $stmt->rowCount();
    }

    public function count_today () {
        $now = date('Y-m-d');

        $query = "SELECT
					id,status,time,prioritize
			FROM
				" . $this->table_name . "
			WHERE
                approve = 1
                AND status = 0
                AND time LIKE '{$now}%' AND
                prioritize IS NULL";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();
        return $stmt->rowCount();
    }

    public function countAll () {
        $now = date('Y-m-d');
        $today = $this->count_today();
        $myPriority = $this->count_priority();

        $query = "SELECT
					id,status,`time`,prioritize
				FROM
					" . $this->table_name . "
                WHERE
                    approve = 1
                    AND status = 0
                    AND time NOT LIKE '{$now}%'
                    AND prioritize IS NULL";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();
        $all = $stmt->rowCount()+$today+$myPriority;
        return $all;
    }

    public function readOne () {
        $query = "SELECT
					*
				FROM
					" . $this->table_name . "
				WHERE id = ? AND (approve = 1 OR taxi_sell = {$this->taxiid}) ";
        $stmt = $this->conn->prepare($query);
		$stmt->bindParam(1, $this->id);

		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row['id']) {
            if ($row['taxiid'] == $this->taxiid || $row['taxi_sell'] == $this->taxiid) {
                $row['addressfrom_full'] = $row['addressfrom'];
                $row['addressto_full'] = $row['addressto'];
            } else {
                unset($row['phone']);
            }

            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : '1 chiều');
            $row['is_one_round'] = ($row['is_round'] ? "0" : "1");
        }

        // set values
		$this->id = $row['id'];
        $this->taxiID = $row['taxiid'];
        $this->time = $row['time'];

        return ($row['id'] ? $row : null);
    }


    public function readOneFull () {
        $query = "SELECT
    				*
    			FROM
    				" . $this->table_name . "
    			WHERE id = ? AND (approve = 1 OR taxi_sell = {$this->taxiid}) ";
        $stmt = $this->conn->prepare($query);
    	$stmt->bindParam(1, $this->id);

    	$stmt->execute();
    	$row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row['id']) {
            $row['addressfrom_full'] = $row['addressfrom'];
            $row['addressto_full'] = $row['addressto'];
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : '1 chiều');
            $row['is_one_round'] = ($row['is_round'] ? "0" : "1");
        }

        // set values
    	$this->id = $row['id'];
        $this->taxiID = $row['taxiid'];
        $this->coin = $row['coin'];
        $this->time = $row['time'];

        return ($row['id'] ? $row : null);
    }


    public function readAllBuy_today () {
        $now = date('Y-m-d');

        $query = "SELECT
    				*
    			FROM
    				" . $this->table_name . "
    			WHERE
                    taxiid = {$this->taxiID}
                    AND time LIKE '{$now}%'
                    AND taxi_sell IS NULL
                ORDER BY
                    status ASC, time ASC, id ASC";

    	$stmt = $this->conn->prepare($query);
    	$stmt->execute();

    	$all_list = array();

    	while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : null);
            $row['is_one_round'] = ($row['is_round'] ? 0 : 1);
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $all_list[] = $row;
        }
        return $all_list;
    }

    public function readAllBuy () {
        $now = date('Y-m-d');
        $todayList = $this->readAllBuy_today();

        $query = "SELECT
    					*
    				FROM
    					" . $this->table_name . "
    				WHERE
                        taxiid = {$this->taxiID}
                        AND time NOT LIKE '{$now}%'
                        AND taxi_sell IS NULL
                    ORDER BY
                        status ASC, time ASC, id ASC";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();

		$all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : null);
            $row['is_one_round'] = ($row['is_round'] ? 0 : 1);
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $all_list[] = $row;
        }

        $this->all_list = array('today'=>$todayList,
         'others'=>$all_list);
        return $this->all_list;
    }


    public function readAllSell_today () {
        $now = date('Y-m-d');

        $query = "SELECT
    				*
    			FROM
    				" . $this->table_name . "
    			WHERE
                    time LIKE '{$now}%'
                    AND taxi_sell = {$this->taxiID}
                ORDER BY
                    status ASC, time ASC, id ASC";

    	$stmt = $this->conn->prepare($query);
    	$stmt->execute();

    	$all_list = array();

    	while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : null);
            $row['is_one_round'] = ($row['is_round'] ? 0 : 1);
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $all_list[] = $row;
        }
        return $all_list;
    }

    public function readAllSell () {
        $now = date('Y-m-d');
        $todayList = $this->readAllSell_today();

        $query = "SELECT
    					*
    				FROM
    					" . $this->table_name . "
    				WHERE
                        time NOT LIKE '{$now}%'
                        AND taxi_sell = {$this->taxiID}
                    ORDER BY
                        status ASC, time ASC, id ASC";

		$stmt = $this->conn->prepare($query);
		$stmt->execute();

		$all_list = array();

		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['is_round_txt'] = ($row['is_round'] ? '2 chiều' : null);
            $row['is_one_round'] = ($row['is_round'] ? 0 : 1);
            $fromAr = array_values(array_filter(explode(',', $row['addressfrom'])));
            $toAr = array_values(array_filter(explode(',', $row['addressto'])));
            $row['addressfrom'] = trim(implode(',', array_slice($fromAr, -2, 2, true)));
            $row['addressto'] = trim(implode(',', array_slice($toAr, -2, 2, true)));
            $all_list[] = $row;
        }

        $this->all_list = array('today'=>$todayList,
         'others'=>$all_list);
        return $this->all_list;
    }


    public function changeStt ($stt) {
        $query = "UPDATE
        			" . $this->table_name . "
        		SET
        			status = 1, taxiid = ?
        		WHERE
        			id = ?";

    	$stmt = $this->conn->prepare($query);

    	// posted values
        $stmt->bindParam(1, $this->taxiID);
        $stmt->bindParam(2, $this->id);

        // execute the query
    	if ($stmt->execute()) return true;
    	else return false;
    }

    public function buy ($coin) {
        $this->changeStt(1);
        $now = date("Y-m-d H:i:s");
        $query = "INSERT INTO PayCoin SET taxiID = ?, tripID = ?, coin = ?, time = ?";
        $stmt = $this->conn->prepare($query);
        // bind parameters
    	$stmt->bindParam(1, $this->taxiID);
        $stmt->bindParam(2, $this->id);
        $stmt->bindParam(3, $coin);
        $stmt->bindParam(4, $now);

    	if ($stmt->execute()) {
            return 1;
        } else return 0;
    }

}

 ?>

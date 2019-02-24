SELECT * FROM tbl_lopmonhoc WHERE MaGVC=1 and TrangThai =1 ;
Select * from tbl_chitietlopmonhoc where MaLMH = 1231211;
select * from tbl_lichhoc where MaLMH=1231211;
select * from tbl_diemdanh where MaLichHoc=1;
select * from tbl_chitietdiemdanh where MaDiemDanh=1;
insert into tbl_diemdanh (MaLichHoc, NgayDiemdanh,MaGV) values(1,'2015-1-15',1);
select * from tbl_diemdanh;
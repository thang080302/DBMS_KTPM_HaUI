--1;
create proc insert_Khoa1(@makhoa nvarchar(20),
						@tenkhoa nvarchar(30),
						@dienthoai nchar(20),
						@check int)
as
begin
 declare
 if(exists (select * from Khoa where Tenkhoa = @tenkhoa))
	@check = 0
 else insert into Khoa values(@makhoa,@tenkhoa,@dienthoai)
 return @check
end
-- test
declare @check int
execute insert_Khoa1 '8','CNTTASAS','12356',@check output
						  @tenlop nvarchar(30),
						  @Khoa nchar(20),
						  @Hedt nchar(20),
						  @Namnhaphoc int,
						  @makhoa nvarchar(20),
						  @check int 
						 )
as
begin
	if(exists (select * from Lop where Tenlop = @tenlop))
		set @check = 0
	else if(not exists (select * from Lop where MaKhoa = @makhoa))
			set @check = 1
		else 
			set @check = 2
	return @check
end
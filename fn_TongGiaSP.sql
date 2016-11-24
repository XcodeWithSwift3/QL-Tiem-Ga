if object_id('fn_TongGiaSP','FN') is not null
drop function fn_TongGiaSP
go
--Tính tổng giá các sản phẩm khi chưa ở trong combo
Create function fn_TongGiaSP (@IDCombo int)
Returns int
As
Begin
	Declare @TongGia int
	select @TongGia = sum(C.GiaSP)
	from giaCombo C
	where C.IDCombo=@IDCombo
	group by C.IDCombo
return @TongGia
end
go
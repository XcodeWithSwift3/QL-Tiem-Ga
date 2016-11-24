alter trigger checkGiaCombo on Combo
for update
as
BEGIN
	declare @TongGiaSP int, @giaCb int
	select @TongGiaSP = sum(C.GiaSP)
	from giaCombo C, inserted I
	where C.IDCombo = I.IDCombo
	group by I.IDCombo
	select @giaCb=I.Gia
	from inserted I
	if(@giaCb > @TongGiaSP )
	BEGIN
		raiserror('Gia Combo phai <= tong gia SP',10,12)
		update Combo set Gia = @TongGiaSP
	END
END

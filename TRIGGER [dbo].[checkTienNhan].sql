USE [QL_TiemGa]
GO
/****** Object:  Trigger [dbo].[checkTienNhan]    Script Date: 2016-11-23 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[checkTienNhan] on [dbo].[HoaDon]
for INSERT, UPDATE

as
BEGIN
	declare @tienNhan int, @tienThanhToan int
	select @tienNhan = I.TienNhan, @tienThanhToan =I.ThanhTien
	from inserted I
	if(@tienNhan < @tienThanhToan)
	BEGIN
		raiserror ('error',10,12)
		print 'Tien nhan khong duoc be hon tong tien'
		rollback tran
		update HoaDon set TienNhan = 0
	END ELSE
	BEGIN
		exec dbo.HoaDon_insert_TienTra @tienNhan,@tienThanhToan
	END
END
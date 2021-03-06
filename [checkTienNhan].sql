USE [QL_TiemGa]
GO
/****** Object:  Trigger [dbo].[checkTienNhan]    Script Date: 2016-11-22 10:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[checkTienNhan] on [dbo].[HoaDon]
for INSERT, UPDATE

as
BEGIN
	declare @tienNhan int, @thanhTien int
	select @tienNhan = I.TienNhan, @thanhTien =I.ThanhTien
	from inserted I
	if(@tienNhan < @thanhTien)
	BEGIN
		raiserror ('error',10,12)
		print 'Tien nhan khong duoc be hon tong tien'
		rollback tran
		update HoaDon set TienNhan = 0
	END

END
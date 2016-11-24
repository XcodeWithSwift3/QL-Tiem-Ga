
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE HoaDon_insert_Tientra 
--Tính tiền trả lại cho khách
	@tienNhan int,	--Tiền nhận của khách
	@tienThanhToan int --Tiền khánh hàng cần thanh toán
AS
BEGIN
	UPDATE HoaDon set TienNhan = (@tienNhan-@tienThanhToan)
END
GO

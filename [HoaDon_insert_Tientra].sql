USE [QL_TiemGa]
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_insert_Tientra]    Script Date: 2016-11-23 1:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[HoaDon_insert_Tientra]
	@tienNhan int,
	@tienThanhToan int
AS
BEGIN
	UPDATE HoaDon set TienTra = (select dbo.fn_TienTraLai(@tienNhan,@tienThanhToan) )
END

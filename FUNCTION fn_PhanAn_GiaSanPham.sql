-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

--Tính bảng giá của các sản phẩm trong phần ăn
CREATE FUNCTION fn_PhanAn_GiaSanPham()
RETURNS TABLE
AS
	RETURN (	select IDPhanAn,PhanAn_SP.IDSP,GiaSP
				from PhanAn_SP, SanPham
				where PhanAn_SP.IDSP=SanPham.IDSP)
GO
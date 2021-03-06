USE [QL_TiemGa]
GO
/****** Object:  Trigger [dbo].[checkGiaCombo]    Script Date: 2016-11-22 10:17:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[checkGiaCombo] on [dbo].[Combo]
for update, insert
as
BEGIN
	declare @TongGiaSP int, @giaCb int, @mes char(100)

	select @TongGiaSP = dbo.fn_TongGiaSP(I.IDCombo)
	from inserted I

	select @giaCb=I.Gia
	from inserted I
	if(@giaCb > @TongGiaSP )
	BEGIN 
		set @mes = 'gia combo phai nho hon ' + CONVERT(CHAR(12),@TongGiaSP)
		raiserror(@mes,12,10)
	END
END

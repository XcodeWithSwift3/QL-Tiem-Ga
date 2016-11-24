alter view giaCombo as 
select IDCombo,TenSP, GiaSP
from Combo_SP, SanPham
where Combo_SP.IDSP=SanPham.IDSP
go
select sum(GiaSP)
from giaCombo
group by giaCombo.IDCombo
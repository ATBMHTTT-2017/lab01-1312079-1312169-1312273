--Câu 8:
create or replace view chitieu_phongban
as
select machitieu, tenchitieu, sotien, duan, truongphong
from (ChiTieu join DuAn on (ChiTieu.duAn = DuAn.maDA))
join PhongBan on DuAn.phongChuTri = PhongBan.maPhong;

grant select on chitieu_phongban to truongPhong_role;

create or replace function xem_sotien(
p_schema varchar2, p_obj varchar2)
return varchar2
as
  user varchar2(100);
begin
  user := sys_context('userenv', 'session_user');
  return 'truongphong = lower('''||user||''')';
end;

begin
dbms_rls.add_policy (
  object_schema => 'system',
  object_name => 'chitieu_phongban',
  policy_name => 'xem_sotien_phg',
  function_schema => 'system',
  policy_function => 'xem_sotien',
  sec_relevant_cols => 'SOTIEN', sec_relevant_cols_opt => dbms_rls.ALL_ROWS);
end;

create or replace view thongTinChiTieu
as
select maChiTieu, tenChiTieu, soTien, duAn, truongDA
from ChiTieu c, DuAn d
where c.duAn = d.maDA;

grant select, insert on jb.thongTinChiTieu to truongDuAn_role;


create or replace function truong_du_an (p_schema in varchar2 default null, p_obj in varchar2 default null)
return varchar2
as
  user varchar2(100);
begin
    user := sys_context('userenv', 'session_user');
    return 'truongda = lower('''||user||''')';
end;

begin
  dbms_rls.add_policy (
  object_schema => 'jb',
  object_name => 'thongTinChiTieu',
  policy_name => 'chitieu_trgduan',
  function_schema => null,
  policy_function => 'truong_du_an',
  statement_types => 'select, insert',
  update_check => TRUE
  );
end;

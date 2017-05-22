-- Câu 6
create or replace view NhanVienBT 
as
select* from NhanVien;

grant select on NhanVienBT to nhanVien_role;

create or replace function nvbinhthuong_function(p_schema varchar2, p_obj varchar2)
Return varchar2
As
user varchar2(100);
Begin
  user := SYS_CONTEXT('userenv', 'SESSION_USER');
  return 'maPhong = (select maPhong from NhanVien where maNV = ' || q'[']' || user || q'[']';
  end if;
End;

begin
dbms_rls.add_policy (object_schema => 'sys',
                    object_name => 'sys.NhanVien',
                    policy_name => 'nvbinhthuong_policy',
                    function_schema => 'sys',
                    policy_function => 'nvbinhthuong_function',
                    sec_relevant_cols => 'luong',
                    sec_relevant_cols_opt => dbms_rls.ALL_ROWS);
end;

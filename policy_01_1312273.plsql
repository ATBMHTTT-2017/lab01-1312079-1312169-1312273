# sample policy 1
declare
  cursor c_nhanvien is select * from NhanVien;
  v_nhanvien c_nhanvien%rowtype;
begin
  open c_nhanvien;
  loop
    fetch c_nhanvien into v_nhanvien; 
    exit when c_nhanvien%notfound;
    execute immediate 'create user ' || v_nhanvien.manv || ' identified by 123456';
    execute immediate 'grant create session to ' || v_nhanvien.manv;
  end loop;
  close c_nhanvien;
end;

--Câu 5: 
create or replace PROCEDURE sp_capnhatphongban 
    ( p_MaPhong in nchar := 10, p_TenPhong in nvarchar2 := 100, p_TruongPhong in nchar := 10, p_NgayNhanChuc in date, p_SoNhanVien in int, p_ChiNhanh in nchar := 10,p_Error out varchar2)
IS
  user_exp Exception;
  tam varchar2(100);
BEGIN
    select user into tam from dual;
    if (p_TruongPhong = '') then
        raise user_exp;
    end if;
    if (tam = 'SYSTEM') then
        UPDATE PhongBan
        set tenPhong = p_TenPhong, truongPhong = p_TruongPhong, ngayNhanChuc = to_date(p_NgayNhanChuc, 'DD/MM/YYYY'), soNhanVien = p_SoNhanVien, chiNhanh = p_ChiNhanh
        where maPhong = p_MaPhong ;
    elsif (tam = p_TruongPhong ) then
        UPDATE PhongBan
        SET tenPhong = p_TenPhong, ngayNhanChuc = to_date(p_NgayNhanChuc, 'DD/MM/YYYY'), soNhanVien = p_SoNhanVien, chiNhanh = p_ChiNhanh
        WHERE maPhong = p_MaPhong ;
    else 
       UPDATE PhongBan
        SET tenPhong = p_TenPhong, truongPhong = p_TruongPhong, ngayNhanChuc = to_date(p_NgayNhanChuc, 'DD/MM/YYYY'), soNhanVien = p_SoNhanVien
        WHERE maPhong = p_MaPhong; 
    end if;
 EXCEPTION
    when user_exp then
        p_Error := 'Khong duoc phep thuc hien!';
    return;
    when others then
        p_Error := 'Loi: ' || SQLERRM;
END;

grant execute on sp_capnhatphongban to truongPhong_role, truongChiNhanh_role;

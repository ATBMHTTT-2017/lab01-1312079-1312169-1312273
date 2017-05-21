create or replace view thongTinDuAn
as (select DA.maDA, DA.tenDA, DA.kinhPhi, PB.tenPhong as TenPhongChuTri, 
    CN.tenCN tenChiNhanhChuTri, NV.hoTen as tenTruongDuAn, 
    sum (CT.soTien) as TongChiTieu
    from DuAn DA, ChiNhanh CN, PhongBan PB, NhanVien NV, ChiTieu CT
    where DA.phongChuTri = PB.maPhong and PB.chiNhanh = CN .maCN
    group by DA.maDA, DA.tenDA, DA.kinhPhi, PB.tenPhong, CN.tenCN,  NV.hoTen
    );
grant select on duAn_giamDoc to giamDoc_role;

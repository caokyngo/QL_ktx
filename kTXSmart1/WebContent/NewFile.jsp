<%@page import="kTXCore.model.TaiKhoanSinhVien"%>
<%@page import="kTXCore.modelDao.DAO_SinhVien"%>
<%@page import="kTXCore.model.SinhVien"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="kTXCore.modelDao.DAO_ChucNang"%>
<%@page import="kTXCore.model.ChucNang"%>
<%@page import="kTXCore.modelDao.DAO_NhomPhanQuyen"%>
<%@page import="kTXCore.model.NhomPhanQuyen"%>
<%@page import="kTXCore.util.Util_MD5"%>
<%@page import="kTXCore.modelDao.DAO_TaiKhoan"%>
<%@page import="kTXCore.model.TaiKhoanNhanVien"%>
<%@page import="kTXCore.model.TaiKhoan"%>
<%@page import="kTXCore.modelDao.DAO_NhanVien"%>
<%@page import="kTXCore.modelDao.DAO_DonVi"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@page import="kTXCore.model.DonVi"%>
<%@page import="kTXCore.model.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		DonVi dv = new DonVi();
		dv.setMaDonVi("DV01");
		dv.setTenDonVi("Bo mon CNTT");
		dv.setDonViCha(null);
		ObjectDAO dao1 = new DAO_DonVi();
		dao1.saveOrUpdate(dv);

		NhanVien admin = new NhanVien();
		admin.setMaNhanVien("001");
		admin.setTenNhanVien("Lê Nhật Tùng");
		admin.setEmail("tungit07@gmail.com");
		admin.setDonVi(dv);
		ObjectDAO dao2 = new DAO_NhanVien();
		dao2.saveOrUpdate(admin);

		NhanVien giangVien = new NhanVien();
		giangVien.setMaNhanVien("002");
		giangVien.setTenNhanVien("Nguyễn Xuân Thiện");
		giangVien.setEmail("xuanthien@gmail.com");
		giangVien.setDonVi(dv);
		dao2.saveOrUpdate(giangVien);

		SinhVien sinhVien = new SinhVien();
		sinhVien.setMaSinhVien("5551074004");
		sinhVien.setHoDem("Hồ Văn");
		sinhVien.setTen("Bi");
		sinhVien.setEmail("hobi2908@gmail.com");
		ObjectDAO dao_sinhVien = new DAO_SinhVien();
		dao_sinhVien.saveOrUpdate(sinhVien);

		ObjectDAO daochucnang = new DAO_ChucNang();

		ChucNang CN_QuanLyThongTinCoBan = new ChucNang();
		CN_QuanLyThongTinCoBan.setMaChucNang("kTXCore_0_0_CN_QuanLyThongTinCoBan");
		CN_QuanLyThongTinCoBan.setDuongDan("");
		CN_QuanLyThongTinCoBan.setHinhAnh("fa fa-wrench");
		CN_QuanLyThongTinCoBan.setTenHienThi("Thông tin cơ bản");
		CN_QuanLyThongTinCoBan.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinCoBan);

		ChucNang CN_QuanLyNoiTru = new ChucNang();
		CN_QuanLyNoiTru.setMaChucNang("kTXSm1_0_0_CN_QuanLyNoiTru");
		CN_QuanLyNoiTru.setDuongDan("null");
		CN_QuanLyNoiTru.setHinhAnh("fa fa-university");
		CN_QuanLyNoiTru.setTenHienThi("Quản lý nội trú");
		CN_QuanLyNoiTru.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyNoiTru);

		ChucNang CN_QuanLyDotKeKhaiThongTinNoiTru = new ChucNang();
		CN_QuanLyDotKeKhaiThongTinNoiTru.setMaChucNang("kTXSm1_0_1_CN_QuanLyDotKeKhaiThongTinNoiTru");
		CN_QuanLyDotKeKhaiThongTinNoiTru.setDuongDan("kTXSm1/pages/dotkekhaithongtinnoitrus.jsp");
		CN_QuanLyDotKeKhaiThongTinNoiTru.setHinhAnh("fa fa-list-ol");
		CN_QuanLyDotKeKhaiThongTinNoiTru.setTenHienThi("Quản lý đợt kê khai thông tin nội trú");
		CN_QuanLyDotKeKhaiThongTinNoiTru.setChucNangCha(CN_QuanLyNoiTru);
		daochucnang.saveOrUpdate(CN_QuanLyDotKeKhaiThongTinNoiTru);

		ChucNang CN_QuanLyThongTinNoiTru = new ChucNang();
		CN_QuanLyThongTinNoiTru.setMaChucNang("kTXSm1_0_2_CN_QuanLyThongTinNoiTru");
		CN_QuanLyThongTinNoiTru.setDuongDan("kTXSm1/pages/thongtinnoitrus.jsp");
		CN_QuanLyThongTinNoiTru.setHinhAnh("fa fa-institution");
		CN_QuanLyThongTinNoiTru.setTenHienThi("Thông tin nội trú");
		CN_QuanLyThongTinNoiTru.setChucNangCha(CN_QuanLyNoiTru);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinNoiTru);

		ChucNang CN_KeKhaiThongTinNoiTru = new ChucNang();
		CN_KeKhaiThongTinNoiTru.setMaChucNang("kTXSm1_0_3_CN_KeKhaiThongTinNgoaiTru");
		CN_KeKhaiThongTinNoiTru.setDuongDan("kTXSm1/pages/thongtinnoitru.jsp");
		CN_KeKhaiThongTinNoiTru.setHinhAnh("fa fa-paperclip");
		CN_KeKhaiThongTinNoiTru.setTenHienThi("Kê khai thông tin nội trú");
		CN_KeKhaiThongTinNoiTru.setChucNangCha(CN_QuanLyNoiTru);
		daochucnang.saveOrUpdate(CN_KeKhaiThongTinNoiTru);

		ChucNang CN_BaoCaoThongKeNoiTru = new ChucNang();
		CN_BaoCaoThongKeNoiTru.setMaChucNang("kTXSm1_0_4_CN_BaoCaoThongKeNoiTru");
		CN_BaoCaoThongKeNoiTru.setDuongDan("kTXSm1/pages/baocaothongke.jsp");
		CN_BaoCaoThongKeNoiTru.setHinhAnh("fa fa-spinner");
		CN_BaoCaoThongKeNoiTru.setTenHienThi("Báo cáo thống kê");
		CN_BaoCaoThongKeNoiTru.setChucNangCha(CN_QuanLyNoiTru);
		daochucnang.saveOrUpdate(CN_BaoCaoThongKeNoiTru);

		ChucNang CN_QuanLyDonVi = new ChucNang();
		CN_QuanLyDonVi.setMaChucNang("kTXCore_0_1_CN_QuanLyDonVi");
		CN_QuanLyDonVi.setDuongDan("kTXCore/pages/donvis.jsp");
		CN_QuanLyDonVi.setHinhAnh("fa fa-sitemap");
		CN_QuanLyDonVi.setTenHienThi("Quản lý đơn vị");
		CN_QuanLyDonVi.setChucNangCha(CN_QuanLyThongTinCoBan);
		daochucnang.saveOrUpdate(CN_QuanLyDonVi);

		ChucNang CN_QuanLyLop = new ChucNang();
		CN_QuanLyLop.setMaChucNang("kTXCore_0_2_CN_QuanLyLop");
		CN_QuanLyLop.setDuongDan("kTXCore/pages/lops.jsp");
		CN_QuanLyLop.setHinhAnh("fa fa-book");
		CN_QuanLyLop.setTenHienThi("Quản lý lớp");
		CN_QuanLyLop.setChucNangCha(CN_QuanLyThongTinCoBan);
		daochucnang.saveOrUpdate(CN_QuanLyLop);

		ChucNang CN_QuanLyNamHoc = new ChucNang();
		CN_QuanLyNamHoc.setMaChucNang("kTXCore_0_3_CN_QuanLyNamHoc");
		CN_QuanLyNamHoc.setDuongDan("kTXCore/pages/namhocs.jsp");
		CN_QuanLyNamHoc.setHinhAnh("fa fa-calendar-o");
		CN_QuanLyNamHoc.setTenHienThi("Quản lý năm học");
		CN_QuanLyNamHoc.setChucNangCha(CN_QuanLyThongTinCoBan);
		daochucnang.saveOrUpdate(CN_QuanLyNamHoc);

		ChucNang CN_QuanLyHocKy = new ChucNang();
		CN_QuanLyHocKy.setMaChucNang("kTXCore_0_4_CN_QuanLyHocKy");
		CN_QuanLyHocKy.setDuongDan("kTXCore/pages/hockys.jsp");
		CN_QuanLyHocKy.setHinhAnh("fa fa-calendar");
		CN_QuanLyHocKy.setTenHienThi("Quản lý học kỳ");
		CN_QuanLyHocKy.setChucNangCha(CN_QuanLyThongTinCoBan);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinCoBan);

		ChucNang CN_QuanLyNhanVien = new ChucNang();
		CN_QuanLyNhanVien.setMaChucNang("kTXCore_0_5_CN_QuanLyNhanVien");
		CN_QuanLyNhanVien.setDuongDan("kTXCore/pages/nhanviens.jsp");
		CN_QuanLyNhanVien.setHinhAnh("fa fa-user");
		CN_QuanLyNhanVien.setTenHienThi("Quản lý nhân viên");
		CN_QuanLyNhanVien.setChucNangCha(CN_QuanLyThongTinCoBan);
		daochucnang.saveOrUpdate(CN_QuanLyNhanVien);

		ChucNang CN_QuanLySinhVien = new ChucNang();
		CN_QuanLySinhVien.setMaChucNang("kTXCore_0_6_CN_QuanLySinhVien");
		CN_QuanLySinhVien.setDuongDan("kTXCore/pages/sinhviens.jsp");
		CN_QuanLySinhVien.setHinhAnh("fa fa-users");
		CN_QuanLySinhVien.setTenHienThi("Quản lý sinh viên");
		CN_QuanLySinhVien.setChucNangCha(CN_QuanLyThongTinCoBan);
		daochucnang.saveOrUpdate(CN_QuanLySinhVien);

		ChucNang CN_QuanLyChucNangVaTaiKhoan = new ChucNang();
		CN_QuanLyChucNangVaTaiKhoan.setMaChucNang("kTXCore_1_0_CN_QuanLyChucNangVaTaiKhoan");
		CN_QuanLyChucNangVaTaiKhoan.setDuongDan("null");
		CN_QuanLyChucNangVaTaiKhoan.setHinhAnh("fa fa-filter");
		CN_QuanLyChucNangVaTaiKhoan.setTenHienThi("Chức năng và tài khoản");
		CN_QuanLyChucNangVaTaiKhoan.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyChucNangVaTaiKhoan);

		ChucNang CN_QuanLyTaiKhoanNhanVien = new ChucNang();
		CN_QuanLyTaiKhoanNhanVien.setMaChucNang("kTXCore_1_1_CN_QuanLyTaiKhoanNhanVien");
		CN_QuanLyTaiKhoanNhanVien.setDuongDan("kTXCore/pages/taikhoannhanviens.jsp");
		CN_QuanLyTaiKhoanNhanVien.setHinhAnh("fa fa-users");
		CN_QuanLyTaiKhoanNhanVien.setTenHienThi("Quản lý tài khoản nhân viên");
		CN_QuanLyTaiKhoanNhanVien.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyTaiKhoanNhanVien);

		ChucNang CN_QuanLyTaiKhoanSinhVien = new ChucNang();
		CN_QuanLyTaiKhoanSinhVien.setMaChucNang("kTXCore_1_1_CN_QuanLyTaiKhoanSinhVien");
		CN_QuanLyTaiKhoanSinhVien.setDuongDan("kTXCore/pages/taikhoansinhviens.jsp");
		CN_QuanLyTaiKhoanSinhVien.setHinhAnh("fa fa-users");
		CN_QuanLyTaiKhoanSinhVien.setTenHienThi("Quản lý tài khoản sinh viên");
		CN_QuanLyTaiKhoanSinhVien.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyTaiKhoanSinhVien);

		ChucNang CN_QuanLyChucNang = new ChucNang();
		CN_QuanLyChucNang.setMaChucNang("kTXCore_1_2_CN_QuanLyChucNang");
		CN_QuanLyChucNang.setDuongDan("kTXCore/pages/chucnangs.jsp");
		CN_QuanLyChucNang.setHinhAnh("fa fa-share-alt");
		CN_QuanLyChucNang.setTenHienThi("Quản lý chức năng");
		CN_QuanLyChucNang.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyChucNang);

		ChucNang CN_QuanLyPhanQuyen = new ChucNang();
		CN_QuanLyPhanQuyen.setMaChucNang("kTXCore_1_3_CN_QuanLyPhanQuyen");
		CN_QuanLyPhanQuyen.setDuongDan("kTXCore/pages/nhomphanquyens.jsp");
		CN_QuanLyPhanQuyen.setHinhAnh("fa fa-shield");
		CN_QuanLyPhanQuyen.setTenHienThi("Quản lý phân quyền");
		CN_QuanLyPhanQuyen.setChucNangCha(CN_QuanLyChucNangVaTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyPhanQuyen);

		ChucNang CN_QuanLyCoSoVatChat = new ChucNang();
		CN_QuanLyCoSoVatChat.setMaChucNang("kTXSm1_1_0_CN_QuanLyCoSoVatChat");
		CN_QuanLyCoSoVatChat.setDuongDan("null");
		CN_QuanLyCoSoVatChat.setHinhAnh("fa fa-university");
		CN_QuanLyCoSoVatChat.setTenHienThi("Quản lý cơ sở vật chất");
		CN_QuanLyCoSoVatChat.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyCoSoVatChat);

		ChucNang CN_QuanLyPhong = new ChucNang();
		CN_QuanLyPhong.setMaChucNang("kTXSm1_1_2_CN_QuanLyPhong");
		CN_QuanLyPhong.setDuongDan("kTXSm1/pages/phongs.jsp");
		CN_QuanLyPhong.setHinhAnh("null");
		CN_QuanLyPhong.setTenHienThi("Quản lý phòng");
		CN_QuanLyPhong.setChucNangCha(CN_QuanLyCoSoVatChat);
		daochucnang.saveOrUpdate(CN_QuanLyPhong);

		ChucNang CN_ThemThongTinPhong = new ChucNang();
		CN_ThemThongTinPhong.setMaChucNang("kTXSm1_1_3_CN_ThemThongTinPhong");
		CN_ThemThongTinPhong.setDuongDan("kTXSm1/pages/phong.jsp");
		CN_ThemThongTinPhong.setHinhAnh("null");
		CN_ThemThongTinPhong.setTenHienThi("Thêm thông tin phòng");
		CN_ThemThongTinPhong.setChucNangCha(CN_QuanLyCoSoVatChat);
		daochucnang.saveOrUpdate(CN_ThemThongTinPhong);

		ChucNang CN_QuanLyMatHang = new ChucNang();
		CN_QuanLyMatHang.setMaChucNang("kTXSm2_2_0_CN_QuanLyMatHang");
		CN_QuanLyMatHang.setDuongDan("null");
		CN_QuanLyMatHang.setHinhAnh("fa fa-university");
		CN_QuanLyMatHang.setTenHienThi("Quản lý dịch vụ");
		CN_QuanLyMatHang.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyMatHang);

		ChucNang CN_ThemThongTinMatHang = new ChucNang();
		CN_ThemThongTinMatHang.setMaChucNang("kTXSm2_2_1_CN_ThemThongTinMatHang");
		CN_ThemThongTinMatHang.setDuongDan("kTXSm2/pages/mathang.jsp");
		CN_ThemThongTinMatHang.setHinhAnh("null");
		CN_ThemThongTinMatHang.setTenHienThi("Thêm thông tin mặt hàng");
		CN_ThemThongTinMatHang.setChucNangCha(CN_QuanLyMatHang);
		daochucnang.saveOrUpdate(CN_ThemThongTinMatHang);

		ChucNang CN_QuanLyThongTinMatHang = new ChucNang();
		CN_QuanLyThongTinMatHang.setMaChucNang("kTXSm2_2_2_CN_QuanLyMatHang");
		CN_QuanLyThongTinMatHang.setDuongDan("kTXSm2/pages/mathangs.jsp");
		CN_QuanLyThongTinMatHang.setHinhAnh("null");
		CN_QuanLyThongTinMatHang.setTenHienThi("Quản lý thông tin mặt hàng");
		CN_QuanLyThongTinMatHang.setChucNangCha(CN_QuanLyMatHang);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinMatHang);

		ChucNang CN_QuanLyDonHang = new ChucNang();
		CN_QuanLyDonHang.setMaChucNang("kTXSm2_3_0_CN_QuanLyDonHang");
		CN_QuanLyDonHang.setDuongDan("null");
		CN_QuanLyDonHang.setHinhAnh("null");
		CN_QuanLyDonHang.setTenHienThi("Quản lý đơn hàng");
		CN_QuanLyDonHang.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyDonHang);

		ChucNang CN_QuanLyThongTinDonHang = new ChucNang();
		CN_QuanLyThongTinDonHang.setMaChucNang("kTXSm2_3_1_CN_QuanLyDonHang");
		CN_QuanLyThongTinDonHang.setDuongDan("kTXSm2/pages/donhangs.jsp");
		CN_QuanLyThongTinDonHang.setHinhAnh("null");
		CN_QuanLyThongTinDonHang.setTenHienThi("Quản lý thông tin đơn hàng");
		CN_QuanLyThongTinDonHang.setChucNangCha(CN_QuanLyDonHang);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinDonHang);

		ChucNang CN_ThemDonHang = new ChucNang();
		CN_ThemDonHang.setMaChucNang("kTXSm2_3_2_CN_ThongTinDonHang");
		CN_ThemDonHang.setDuongDan("kTXSm2/pages/donhang.jsp");
		CN_ThemDonHang.setHinhAnh("null");
		CN_ThemDonHang.setTenHienThi("thông tin đơn hàng");
		CN_ThemDonHang.setChucNangCha(CN_QuanLyDonHang);
		daochucnang.saveOrUpdate(CN_ThemDonHang);

		ChucNang CN_QuanLyNhaCungCap = new ChucNang();
		CN_QuanLyNhaCungCap.setMaChucNang("kTXSm2_4_0_CN_QuanLyNhaCungCap");
		CN_QuanLyNhaCungCap.setDuongDan("null");
		CN_QuanLyNhaCungCap.setHinhAnh("null");
		CN_QuanLyNhaCungCap.setTenHienThi("Quản lý nhà cung cấp");
		CN_QuanLyNhaCungCap.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyNhaCungCap);

		ChucNang CN_QuanLyThongTinNhaCungCap = new ChucNang();
		CN_QuanLyThongTinNhaCungCap.setMaChucNang("kTXSm2_4_1_CN_QuanLyThongTinNhaCungCap");
		CN_QuanLyThongTinNhaCungCap.setDuongDan("kTXSm2/pages/nhacungcaps.jsp");
		CN_QuanLyThongTinNhaCungCap.setHinhAnh("null");
		CN_QuanLyThongTinNhaCungCap.setTenHienThi("Quản lý nhà cung cấp");
		CN_QuanLyThongTinNhaCungCap.setChucNangCha(CN_QuanLyNhaCungCap);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinNhaCungCap);

		ChucNang CN_ThemNhaCungCap = new ChucNang();
		CN_ThemNhaCungCap.setMaChucNang("kTXSm2_4_2_CN_ThemNhaCungCap");
		CN_ThemNhaCungCap.setDuongDan("kTXSm2/pages/nhacungcap.jsp");
		CN_ThemNhaCungCap.setHinhAnh("null");
		CN_ThemNhaCungCap.setTenHienThi("Thêm thông tin nhà cung cấp");
		CN_ThemNhaCungCap.setChucNangCha(CN_QuanLyNhaCungCap);
		daochucnang.saveOrUpdate(CN_ThemNhaCungCap);

		ChucNang CN_QuanLyLoaiDonHang = new ChucNang();
		CN_QuanLyLoaiDonHang.setMaChucNang("kTXSm2_3_3_CN_QuanLyLoaiDonHang");
		CN_QuanLyLoaiDonHang.setDuongDan("kTXSm2/pages/loaidonhangs.jsp");
		CN_QuanLyLoaiDonHang.setHinhAnh("null");
		CN_QuanLyLoaiDonHang.setTenHienThi("Quản lý loại đơn hàng");
		CN_QuanLyLoaiDonHang.setChucNangCha(CN_QuanLyDonHang);
		daochucnang.saveOrUpdate(CN_QuanLyLoaiDonHang);

		ChucNang CN_QuanLyTinhTrangDonHang = new ChucNang();
		CN_QuanLyTinhTrangDonHang.setMaChucNang("kTXSm2_3_4_CN_QuanLyTinhTrangDonHang");
		CN_QuanLyTinhTrangDonHang.setDuongDan("kTXSm2/pages/tinhtrangdonhangs.jsp");
		CN_QuanLyTinhTrangDonHang.setHinhAnh("null");
		CN_QuanLyTinhTrangDonHang.setTenHienThi("Quản lý tình trạng đơn hàng");
		CN_QuanLyTinhTrangDonHang.setChucNangCha(CN_QuanLyDonHang);
		daochucnang.saveOrUpdate(CN_QuanLyTinhTrangDonHang);

		ChucNang CN_QuanLyChiTietDonHang = new ChucNang();
		CN_QuanLyChiTietDonHang.setMaChucNang("kTXSm2_3_5_CN_QuanLyChiTietDonHang");
		CN_QuanLyChiTietDonHang.setDuongDan("kTXSm2/pages/chitietdonhangs.jsp");
		CN_QuanLyChiTietDonHang.setHinhAnh("null");
		CN_QuanLyChiTietDonHang.setTenHienThi("Quản lý chi tiết đơn hàng");
		CN_QuanLyChiTietDonHang.setChucNangCha(CN_QuanLyDonHang);
		daochucnang.saveOrUpdate(CN_QuanLyChiTietDonHang);

		ChucNang CN_QuanLyDichVuGTGT = new ChucNang();
		CN_QuanLyDichVuGTGT.setMaChucNang("kTXSm2_5_0_CN_QuanLyDichVuGTGT");
		CN_QuanLyDichVuGTGT.setDuongDan("null");
		CN_QuanLyDichVuGTGT.setHinhAnh("fa fa-university");
		CN_QuanLyDichVuGTGT.setTenHienThi("Quản lý dịch vụ");
		CN_QuanLyDichVuGTGT.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyDichVuGTGT);

		ChucNang CN_QuanLyThongTinDichVu = new ChucNang();
		CN_QuanLyThongTinDichVu.setMaChucNang("kTXSm3_5_1_CN_QuanLyThongTinDichVu");
		CN_QuanLyThongTinDichVu.setDuongDan("kTXSm3/pages/dichvus.jsp");
		CN_QuanLyThongTinDichVu.setHinhAnh("fa fa-university");
		CN_QuanLyThongTinDichVu.setTenHienThi("Quản lý thông tin dịch vụ");
		CN_QuanLyThongTinDichVu.setChucNangCha(CN_QuanLyDichVuGTGT);
		daochucnang.saveOrUpdate(CN_QuanLyThongTinDichVu);

		ChucNang CN_ThemDichVu = new ChucNang();
		CN_ThemDichVu.setMaChucNang("kTXSm3_5_2_CN_ThemTinDichVu");
		CN_ThemDichVu.setDuongDan("kTXSm3/pages/dichvu.jsp");
		CN_ThemDichVu.setHinhAnh("fa fa-university");
		CN_ThemDichVu.setTenHienThi("Thêm thông tin dịch vụ");
		CN_ThemDichVu.setChucNangCha(CN_QuanLyDichVuGTGT);
		daochucnang.saveOrUpdate(CN_ThemDichVu);

		ChucNang CN_QuanLyChuongTrinhKhuyenMai = new ChucNang();
		CN_QuanLyChuongTrinhKhuyenMai.setMaChucNang("kTXSm2_5_3_CN_QuanLyChuongTrinhKhuyenMai");
		CN_QuanLyChuongTrinhKhuyenMai.setDuongDan("kTXSm2/pages/khuyenmais.jsp");
		CN_QuanLyChuongTrinhKhuyenMai.setHinhAnh("null");
		CN_QuanLyChuongTrinhKhuyenMai.setTenHienThi("Quản lý chương trình khuyến mãi");
		CN_QuanLyChuongTrinhKhuyenMai.setChucNangCha(CN_QuanLyDichVuGTGT);
		daochucnang.saveOrUpdate(CN_QuanLyChuongTrinhKhuyenMai);

		ChucNang CN_XemThongTinChuongTrinhKhuyenMai = new ChucNang();
		CN_XemThongTinChuongTrinhKhuyenMai.setMaChucNang("kTXSm2_5_4_ThongTinChuongTrinhKhuyenMai");
		CN_XemThongTinChuongTrinhKhuyenMai.setDuongDan("kTXSm2/pages/khuyenmai.jsp");
		CN_XemThongTinChuongTrinhKhuyenMai.setHinhAnh("null");
		CN_XemThongTinChuongTrinhKhuyenMai.setTenHienThi("Thông tin chương trình khuyến mãi");
		CN_XemThongTinChuongTrinhKhuyenMai.setChucNangCha(CN_QuanLyDichVuGTGT);
		daochucnang.saveOrUpdate(CN_XemThongTinChuongTrinhKhuyenMai);

		ChucNang CN_QuanLyPhanHoi = new ChucNang();
		CN_QuanLyPhanHoi.setMaChucNang("kTXSm4_6_0_CN_QuanLyPhanHoi");
		CN_QuanLyPhanHoi.setDuongDan("kTXSm4/pages/phanhois.jsp");
		CN_QuanLyPhanHoi.setHinhAnh("fa fa-university");
		CN_QuanLyPhanHoi.setTenHienThi("Quản lý thông tin phản hồi");
		CN_QuanLyPhanHoi.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyPhanHoi);

		ChucNang CN_PhanHoi = new ChucNang();
		CN_PhanHoi.setMaChucNang("kTXSm4_6_1_CN_PhanHoi");
		CN_PhanHoi.setDuongDan("kTXSm4/pages/phanhoi.jsp");
		CN_PhanHoi.setHinhAnh("fa fa-university");
		CN_PhanHoi.setTenHienThi(" thông tin phản hồi");
		CN_PhanHoi.setChucNangCha(CN_QuanLyPhanHoi);
		daochucnang.saveOrUpdate(CN_PhanHoi);

		/////////////////////////////////////////////////////////////////////////
		// admin
		/////////////////////////////////////////////////////////////////////////
		NhomPhanQuyen nhomPhanQuyenAdmin = new NhomPhanQuyen();
		nhomPhanQuyenAdmin.setMaNhomPhanQuyen("admin");
		nhomPhanQuyenAdmin.setTenNhomPhanQuyen("Admin");
		Set<ChucNang> chs1 = new HashSet<ChucNang>();

		chs1.add(CN_QuanLyThongTinCoBan);
		chs1.add(CN_QuanLyDonVi);
		chs1.add(CN_QuanLyLop);
		chs1.add(CN_QuanLyNamHoc);
		chs1.add(CN_QuanLyHocKy);
		chs1.add(CN_QuanLyNhanVien);
		chs1.add(CN_QuanLySinhVien);

		chs1.add(CN_QuanLyChucNangVaTaiKhoan);
		chs1.add(CN_QuanLyTaiKhoanNhanVien);
		chs1.add(CN_QuanLyTaiKhoanSinhVien);
		chs1.add(CN_QuanLyChucNang);
		chs1.add(CN_QuanLyPhanQuyen);

		chs1.add(CN_QuanLyNoiTru);
		chs1.add(CN_QuanLyDotKeKhaiThongTinNoiTru);
		chs1.add(CN_KeKhaiThongTinNoiTru);
		chs1.add(CN_QuanLyThongTinNoiTru);
		chs1.add(CN_BaoCaoThongKeNoiTru);

		chs1.add(CN_QuanLyDichVuGTGT);
		chs1.add(CN_ThemDichVu);
		chs1.add(CN_QuanLyThongTinDichVu);
		chs1.add(CN_QuanLyChuongTrinhKhuyenMai);
		chs1.add(CN_XemThongTinChuongTrinhKhuyenMai);

		chs1.add(CN_QuanLyNhaCungCap);
		chs1.add(CN_ThemNhaCungCap);
		chs1.add(CN_QuanLyThongTinNhaCungCap);

		chs1.add(CN_QuanLyDonHang);
		chs1.add(CN_QuanLyThongTinDonHang);
		chs1.add(CN_QuanLyChiTietDonHang);
		chs1.add(CN_QuanLyTinhTrangDonHang);
		chs1.add(CN_QuanLyLoaiDonHang);
		chs1.add(CN_ThemDonHang);

		chs1.add(CN_QuanLyCoSoVatChat);
		chs1.add(CN_ThemThongTinPhong);
		chs1.add(CN_QuanLyPhong);

		chs1.add(CN_QuanLyMatHang);
		chs1.add(CN_ThemThongTinMatHang);
		chs1.add(CN_QuanLyThongTinMatHang);

		chs1.add(CN_QuanLyPhanHoi);

		nhomPhanQuyenAdmin.setChucNangs(chs1);
		ObjectDAO daonpq = new DAO_NhomPhanQuyen();
		daonpq.saveOrUpdate(nhomPhanQuyenAdmin);
		//////////////////////////////////////////////////////
		// giang vien binh thuong, khong duoc phan cong thuc hien cac nhiem vu quan ly
		/////////////////////////////////////////////////////
		NhomPhanQuyen nhomPhanQuyenGiangVien = new NhomPhanQuyen();
		nhomPhanQuyenGiangVien.setMaNhomPhanQuyen("giangvien");
		nhomPhanQuyenGiangVien.setTenNhomPhanQuyen("Giảng viên");
		Set<ChucNang> chs2 = new HashSet<ChucNang>();

		chs2.add(CN_QuanLyNoiTru);
		chs2.add(CN_KeKhaiThongTinNoiTru);
		chs2.add(CN_QuanLyThongTinNoiTru);

		chs2.add(CN_QuanLyDichVuGTGT);
		chs2.add(CN_QuanLyThongTinMatHang);

		chs2.add(CN_QuanLyDonHang);
		chs2.add(CN_QuanLyThongTinDonHang);
		chs2.add(CN_QuanLyChiTietDonHang);
		chs2.add(CN_QuanLyTinhTrangDonHang);
		chs2.add(CN_QuanLyLoaiDonHang);

		chs2.add(CN_QuanLyDichVuGTGT);
		chs2.add(CN_QuanLyThongTinDichVu);
		chs2.add(CN_QuanLyChuongTrinhKhuyenMai);

		chs2.add(CN_QuanLyPhanHoi);

		chs2.add(CN_QuanLyCoSoVatChat);
		chs2.add(CN_QuanLyPhong);

		nhomPhanQuyenGiangVien.setChucNangs(chs2);
		ObjectDAO daonpq1 = new DAO_NhomPhanQuyen();
		daonpq1.saveOrUpdate(nhomPhanQuyenGiangVien);
		//////////////////////////////////////////////////////////

		//////////////////////////////////////////////////////
		// giang vien duoc phan cong quan ly thong tin dich vu
		/////////////////////////////////////////////////////
		NhomPhanQuyen nhomPhanQuyenGiangVienQuanLyDVGTGT = new NhomPhanQuyen();
		nhomPhanQuyenGiangVienQuanLyDVGTGT.setMaNhomPhanQuyen("giangvienquanly");
		nhomPhanQuyenGiangVienQuanLyDVGTGT.setTenNhomPhanQuyen("Giảng viên quản lý dịch vụ GTGT");
		Set<ChucNang> chs3 = new HashSet<ChucNang>();

		chs3.add(CN_QuanLyDichVuGTGT);
		chs3.add(CN_ThemDichVu);
		chs3.add(CN_QuanLyThongTinDichVu);
		chs3.add(CN_QuanLyChuongTrinhKhuyenMai);
		chs3.add(CN_XemThongTinChuongTrinhKhuyenMai);

		chs3.add(CN_QuanLyNhaCungCap);
		chs3.add(CN_ThemNhaCungCap);
		chs3.add(CN_QuanLyThongTinNhaCungCap);

		chs3.add(CN_QuanLyDonHang);
		chs3.add(CN_QuanLyThongTinDonHang);
		chs3.add(CN_QuanLyChiTietDonHang);
		chs3.add(CN_QuanLyTinhTrangDonHang);
		chs3.add(CN_QuanLyLoaiDonHang);
		chs3.add(CN_QuanLyPhanHoi);

		nhomPhanQuyenGiangVienQuanLyDVGTGT.setChucNangs(chs3);
		ObjectDAO daonpq2 = new DAO_NhomPhanQuyen();
		daonpq2.saveOrUpdate(nhomPhanQuyenGiangVienQuanLyDVGTGT);
		//////////////////////////////////////////////////////////

		//////////////////////////////////////////////////////
		// giang vien duoc phan cong quan ly thong tin ngoai tru
		/////////////////////////////////////////////////////
		NhomPhanQuyen nhomPhanQuyenGiangVienQuanLyNoiTru = new NhomPhanQuyen();
		nhomPhanQuyenGiangVienQuanLyNoiTru.setMaNhomPhanQuyen("giangvienquanlynoitru");
		nhomPhanQuyenGiangVienQuanLyNoiTru.setTenNhomPhanQuyen("Giảng viên quản lý nội trú");
		Set<ChucNang> chs4 = new HashSet<ChucNang>();

		chs4.add(CN_QuanLyNoiTru);
		chs4.add(CN_QuanLyDotKeKhaiThongTinNoiTru);
		chs4.add(CN_KeKhaiThongTinNoiTru);
		chs4.add(CN_QuanLyThongTinNoiTru);
		chs4.add(CN_BaoCaoThongKeNoiTru);

		chs4.add(CN_QuanLyPhanHoi);

		nhomPhanQuyenGiangVienQuanLyNoiTru.setChucNangs(chs4);
		ObjectDAO daonpq3 = new DAO_NhomPhanQuyen();
		daonpq3.saveOrUpdate(nhomPhanQuyenGiangVienQuanLyNoiTru);
		//////////////////////////////////////////////////////////

		//////////////////////////////////////////////////////
		// sinh vien
		/////////////////////////////////////////////////////
		NhomPhanQuyen nhomPhanQuyenSinhVien = new NhomPhanQuyen();
		nhomPhanQuyenSinhVien.setMaNhomPhanQuyen("sinhvien");
		nhomPhanQuyenSinhVien.setTenNhomPhanQuyen("Sinh viên");
		Set<ChucNang> chs6 = new HashSet<ChucNang>();

		chs6.add(CN_QuanLyNoiTru);
		chs6.add(CN_KeKhaiThongTinNoiTru);
		chs6.add(CN_QuanLyThongTinNoiTru);

		chs6.add(CN_QuanLyDonHang);
		chs6.add(CN_QuanLyThongTinDonHang);
		chs6.add(CN_QuanLyChiTietDonHang);
		chs6.add(CN_QuanLyTinhTrangDonHang);
		chs6.add(CN_QuanLyLoaiDonHang);
		chs6.add(CN_ThemDonHang);

		chs6.add(CN_QuanLyPhanHoi);
		chs6.add(CN_PhanHoi);

		nhomPhanQuyenSinhVien.setChucNangs(chs6);
		ObjectDAO daonpq5 = new DAO_NhomPhanQuyen();
		daonpq5.saveOrUpdate(nhomPhanQuyenSinhVien);
		//////////////////////////////////////////////////////////

		TaiKhoanNhanVien tk = new TaiKhoanNhanVien();
		tk.setMaDangNhap(admin.getEmail());
		tk.setEmail(admin.getEmail());
		tk.setMatKhau(Util_MD5.md5("123456"));
		tk.setNhanVien(admin);
		tk.setNhomPhanQuyen(nhomPhanQuyenAdmin);
		ObjectDAO dao3 = new DAO_TaiKhoan();
		dao3.saveOrUpdate(tk);

		TaiKhoanNhanVien tkGiangVien = new TaiKhoanNhanVien();
		tkGiangVien.setMaDangNhap(giangVien.getEmail());
		tkGiangVien.setEmail(giangVien.getEmail());
		tkGiangVien.setMatKhau(Util_MD5.md5("123456"));
		tkGiangVien.setNhanVien(giangVien);
		tkGiangVien.setNhomPhanQuyen(nhomPhanQuyenGiangVien);
		dao3.saveOrUpdate(tkGiangVien);

		TaiKhoanSinhVien tkSinhVien = new TaiKhoanSinhVien();
		tkSinhVien.setMaDangNhap(sinhVien.getEmail());
		tkSinhVien.setEmail(sinhVien.getEmail());
		tkSinhVien.setMatKhau(Util_MD5.md5("123456"));
		tkSinhVien.setSinhVien(sinhVien);
		tkSinhVien.setNhomPhanQuyen(nhomPhanQuyenSinhVien);
		ObjectDAO dao4 = new DAO_TaiKhoan();
		dao3.saveOrUpdate(tkSinhVien);
	%>
</body>
</html>
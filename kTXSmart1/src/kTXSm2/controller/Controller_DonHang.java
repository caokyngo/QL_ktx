package kTXSm2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kTXCore.controller.ZEController;
import kTXCore.dao.ObjectDAO;
import kTXCore.model.NhanVien;
import kTXCore.model.SinhVien;
import kTXCore.model.TaiKhoan;
import kTXCore.model.TaiKhoanSinhVien;
import kTXCore.modelDao.DAO_NhanVien;
import kTXCore.modelDao.DAO_SinhVien;
import kTXCore.modelDao.DAO_TaiKhoan;
import kTXCore.util.Util_Date;
import kTXSm2.model.DonHang;

import kTXSm2.model.MatHang;
import kTXSm2.model.TinhTrangDonHang;
import kTXSm2.modelDao.DAO_DonHang;

import kTXSm2.modelDao.DAO_MatHang;
import kTXSm2.modelDao.DAO_TinhTrangDonHang;

public class Controller_DonHang extends DonHang implements ZEController {
	ObjectDAO dao = new DAO_DonHang();
	ObjectDAO dao_mh = new DAO_MatHang();
	ObjectDAO objdao_TaiKhoan = new DAO_TaiKhoan();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "kTXSm2/pages/donhangs.jsp";
	String duongDanTrangView = "kTXSm2/pages/chitietdonhang.jsp";
	String tenCotTimDoiTuong = "maDonHang";
	String tenCotTimDoiTuongMatHang = "maMatHang";
	
	String maObj;
	String maMatHang;
	String maSinhVien;
	String maNhanVien;
	String maTinhTrangDonHang;
	String maLoai;
	String s_ngayDat;
	String s_tongTien;
	String s_thoiGianCapNhat;
	String s_soDiemDuocTich;

	public String getMaTinhTrangDonHang() {
		return maTinhTrangDonHang;
	}

	public void setMaTinhTrangDonHang(String maTinhTrangDonHang) {
		this.maTinhTrangDonHang = maTinhTrangDonHang;
	}

	@Override
	public TinhTrangDonHang getTinhTrangDonHang() {
		ObjectDAO<TinhTrangDonHang> dao_tinhtrangdonhang = new DAO_TinhTrangDonHang();
		ArrayList<TinhTrangDonHang> ls_tinhtrangdonhang = dao_tinhtrangdonhang.listByColumns("maTinhTrangDonHang",
				getMaTinhTrangDonHang());
		if (ls_tinhtrangdonhang.size() > 0)
			return ls_tinhtrangdonhang.get(0);
		else
			return null;
	}

	public String getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}

	

	public String getS_soDiemDuocTich() {

		return s_soDiemDuocTich;
	}

	public void setS_soDiemDuocTich(String s_soDiemDuocTich) {
		this.s_soDiemDuocTich = s_soDiemDuocTich;
	}

	@Override
	public String getSoDiemDuocTich() {
		String sodiemtich = "";
		if (getTongTien() > 5000) {
			sodiemtich = "1";

		}
		if (getTongTien() > 10000) {
			sodiemtich = "3";
		}
		if (getTongTien() > 20000) {
			sodiemtich = "4";
		}
		return sodiemtich;

	}

	public String getTimKiemTheo() {
		return timKiemTheo;
	}

	public void setTimKiemTheo(String timKiemTheo) {
		this.timKiemTheo = timKiemTheo;
	}

	public String getTuKhoa() {
		return tuKhoa;
	}

	public void setTuKhoa(String tuKhoa) {
		this.tuKhoa = tuKhoa;
	}

	public String getDuongDanTrang() {
		return duongDanTrang;
	}

	public void setDuongDanTrang(String duongDanTrang) {
		this.duongDanTrang = duongDanTrang;
	}

	public String getDuongDanTrangView() {
		return duongDanTrangView;
	}

	public void setDuongDanTrangView(String duongDanTrangView) {
		this.duongDanTrangView = duongDanTrangView;
	}

	public String getTenCotTimDoiTuong() {
		return tenCotTimDoiTuong;
	}

	public void setTenCotTimDoiTuong(String tenCotTimDoiTuong) {
		this.tenCotTimDoiTuong = tenCotTimDoiTuong;
	}

	public String getMaObj() {
		return maObj;
	}

	public void setMaObj(String maObj) {
		this.maObj = maObj;
	}

	public String getMaMatHang() {
		return maMatHang;
	}

	public void setMaMatHang(String maMatHang) {
		this.maMatHang = maMatHang;
	}

	public Set<MatHang> getMatHang() {
		System.out.println(getMaMatHang());
		ObjectDAO<MatHang> obj_MatHang = new DAO_MatHang();
		Set<MatHang> matHangSet = new HashSet<>();

		String[] arrMaMatHang = getMaMatHang().split(",");
		for (int i = 0; i < arrMaMatHang.length; i++)
			matHangSet.addAll(obj_MatHang.listByColumns("maMatHang", arrMaMatHang[i]));

		return matHangSet;

	}

	public String getMaSinhVien() {
		return maSinhVien;
	}

	public void setMaSinhVien(String maSinhVien) {
		this.maSinhVien = maSinhVien;
	}

	@Override
	public SinhVien getSinhVien() {
		ObjectDAO<SinhVien> dao_sinhvien = new DAO_SinhVien();
		ArrayList<SinhVien> ls_sinhvien = dao_sinhvien.listByColumns("maSinhVien", getMaSinhVien());
		if (ls_sinhvien.size() > 0)
			return ls_sinhvien.get(0);
		else
			return null;
	}

	public String getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	@Override
	public NhanVien getNhanVien() {
		ObjectDAO<NhanVien> dao_nv = new DAO_NhanVien();
		ArrayList<NhanVien> ls_nv = dao_nv.listByColumns("maNhanVien", getMaNhanVien());
		if (ls_nv.size() > 0)
			return ls_nv.get(0);
		else
			return null;
	}

	public String getS_ngayDat() {
		return s_ngayDat;
	}

	public void setS_ngayDat(String s_ngayDat) {
		this.s_ngayDat = s_ngayDat;
	}

	@Override
	public Date getNgayDat() {
		return Util_Date.stringToDate(getS_ngayDat());
	}

	public String getS_tongTien() {
		return s_tongTien;
	}

	public void setS_tongTien(String s_tongTien) {
		this.s_tongTien = s_tongTien;
	}

	@Override
	public Double getTongTien() {
		return Double.parseDouble(getS_tongTien());
	}

	public String getS_thoiGianCapNhat() {
		return s_thoiGianCapNhat;
	}

	public void setS_thoiGianCapNhat(String s_thoiGianCapNhat) {
		this.s_thoiGianCapNhat = s_thoiGianCapNhat;
	}

	@Override
	public Date getThoiGianCapNhat() {
		return Util_Date.stringToDate(getS_thoiGianCapNhat());
	}

	@Override
	public String addNew() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String maobj_mathang = request.getParameter("maobj_mathang");
		ArrayList<DonHang> arr = dao_mh.listByColumnLike(tenCotTimDoiTuongMatHang, maobj_mathang);
		
		session.setAttribute("mode", "addNew");
		session.setAttribute("p", duongDanTrangView);
		session.setAttribute("msg", null);
		session.setAttribute("obj", null);
		if (arr.size() > 0 ) {
			session.setAttribute("obj_mathang", arr.get(0));
			
			return "SUCCESS";
		} else {
			return "FAIL";
		}

		
		
		

	}

	@Override
	public String viewDetail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String maobj = request.getParameter("maobj");

		session.setAttribute("mode", "viewDetail");

		ArrayList<DonHang> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String viewDetailAndEdit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("msg", null);

		String maobj = request.getParameter("maobj");
		session.setAttribute("mode", "viewDetailAndEdit");
		ArrayList<DonHang> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String saveOrUpdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		DonHang obj = new DonHang();
		obj.maDonHang = getMaDonHang();
		obj.mathangs = getMatHang();
		obj.sinhVien = getSinhVien();
		obj.nhanVien = getNhanVien();
		
		obj.diaChi = getDiaChi();
		obj.tinhTrangDonHang = getTinhTrangDonHang();
		
		obj.soDienThoai = getSoDienThoai();
		obj.ngayDat = getNgayDat();
		obj.soLuong = getSoLuong();
		obj.tongTien = getTongTien();
		obj.soDiemDuocTich = getSoDiemDuocTich();
		obj.ghiChu = getGhiChu();
		obj.thoiGianCapNhat = new Date();
		if (dao.saveOrUpdate(obj)) {
			session.setAttribute("msg", "Cập nhật dữ liệu thành công");
			session.setAttribute("obj", obj);
			session.setAttribute("mode", "viewDetailAndEdit");
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maobj = request.getParameter("maobj");
		DonHang obj = new DonHang();
		obj.setMaDonHang(maobj);
		if (dao.delete(obj)) {
			session.setAttribute("msg", "Xóa dữ liệu thành công");
			session.setAttribute("p", duongDanTrang);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String search() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String column = getTimKiemTheo();
		String key = getTuKhoa();
		ArrayList<DonHang> arr = dao.listByColumnLike(column, key);
		session.setAttribute("arr", arr);
		session.setAttribute("checkTimKiem", "true");
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String refresh() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("arr", null);
		session.setAttribute("msg", null);
		session.setAttribute("checkTimKiem", null);
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String importData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String exportData() throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
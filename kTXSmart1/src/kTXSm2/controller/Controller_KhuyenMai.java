package kTXSm2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kTXCore.controller.ZEController;
import kTXCore.dao.ObjectDAO;
import kTXCore.util.Util_Date;
import kTXSm2.model.KhuyenMai;

import kTXSm2.model.TinhTrangDonHang;
import kTXSm2.modelDao.DAO_KhuyenMai;

public class Controller_KhuyenMai extends KhuyenMai implements ZEController {
	ObjectDAO dao = new DAO_KhuyenMai();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "kTXSm2/pages/khuyenmais.jsp";
	String duongDanTrangView = "kTXSm2/pages/khuyenmai.jsp";
	String tenCotTimDoiTuong = "maKhuyenMai";
	String maObj;
	String s_thoiGianBatDau;
	String s_thoiGianKetThuc;
	String s_mucKhuyenMai;
	
	
	public Double getMucKhuyenMai() {
		return Double.parseDouble(getS_mucKhuyenMai());
	}

	public String getS_mucKhuyenMai() {
		return s_mucKhuyenMai;
	}

	public void setS_mucKhuyenMai(String s_mucKhuyenMai) {
		this.s_mucKhuyenMai = s_mucKhuyenMai;
	}

	public String getS_thoiGianBatDau() {
		return s_thoiGianBatDau;
	}

	public void setS_thoiGianBatDau(String s_thoiGianBatDau) {
		this.s_thoiGianBatDau = s_thoiGianBatDau;
	}

	public String getS_thoiGianKetThuc() {
		return s_thoiGianKetThuc;
	}

	public void setS_thoiGianKetThuc(String s_thoiGianKetThuc) {
		this.s_thoiGianKetThuc = s_thoiGianKetThuc;
	}
	
	public Date getThoiGianBatDau() {
		return Util_Date.stringToDate(getS_thoiGianBatDau());
	}
	
	public Date getThoiGianKetThuc() {
		return Util_Date.stringToDate(getS_thoiGianKetThuc());
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

	@Override
	public String addNew() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("mode", "addNew");
		session.setAttribute("p", duongDanTrangView);
		session.setAttribute("msg", null);
		session.setAttribute("obj", null);
		return "SUCCESS";
	}

	@Override
	public String viewDetail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String maobj = request.getParameter("maobj");

		session.setAttribute("mode", "viewDetail");

		ArrayList<KhuyenMai> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<KhuyenMai> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		KhuyenMai obj = new KhuyenMai();
		obj.maKhuyenMai = getMaKhuyenMai();
		obj.tenKhuyenMai = getTenKhuyenMai();
		obj.thoiGianBatDau = getThoiGianBatDau();
		obj.thoiGianKetThuc = getThoiGianKetThuc();
		obj.mucKhuyenMai = getMucKhuyenMai();
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
		KhuyenMai obj = new KhuyenMai();
		obj.setMaKhuyenMai(maobj);
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
		ArrayList<KhuyenMai> arr = dao.listByColumnLike(column, key);
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

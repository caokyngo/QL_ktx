package kTXCore.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kTXCore.dao.ObjectDAO;
import kTXCore.model.DonVi;
import kTXCore.model.NamHoc;
import kTXCore.model.TaiKhoan;
import kTXCore.modelDao.DAO_NamHoc;
import kTXCore.modelDao.DAO_TaiKhoan;
import kTXCore.util.Util_MD5;
import kTXCore.util.Util_Menu;
import kTXSm2.model.MatHang;
import kTXSm2.modelDao.DAO_MatHang;
import kTXSm3.model.DichVu;
import kTXSm3.modelDao.DAO_DichVu;

public class Controller_XacThuc {
	ObjectDAO<TaiKhoan> dao = new DAO_TaiKhoan();
	String maDangNhap;
	String matKhau;
	String duongDanTrangView = "kTXSm2/pages/mathang_sinhviens.jsp";
	String tenCotTimDoiTuong = "maDichVu";
	String maDichVu;
	
	
	public String getTenCotTimDoiTuong() {
		return tenCotTimDoiTuong;
	}

	public void setTenCotTimDoiTuong(String tenCotTimDoiTuong) {
		this.tenCotTimDoiTuong = tenCotTimDoiTuong;
	}

	public String getMaDichVu() {
		return maDichVu;
	}

	public void setMaDichVu(String maDichVu) {
		this.maDichVu = maDichVu;
	}

	public DichVu getDichVu() {
		ObjectDAO<DichVu> obj_DichVu = new DAO_DichVu();
		ArrayList<DichVu> ls_DichVu = obj_DichVu.listByColumns("maDichVu", getMaDichVu());
		if (ls_DichVu.size() > 0)
			return ls_DichVu.get(0);
		else
			return null;

	}

	public String getMaDangNhap() {
		return maDangNhap;
	}

	public void setMaDangNhap(String maDangNhap) {
		this.maDangNhap = maDangNhap;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String dangNhap() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<TaiKhoan> ls = dao.listByColumns("maDangNhap", getMaDangNhap());
		TaiKhoan obj;
		if (ls.size() > 0) {
			obj = ls.get(0);
			String md5 = Util_MD5.md5(getMatKhau());
			if (obj.getMatKhau().equals(md5) && obj.isTrangThaiHoatDong()==true) {
				session.setAttribute("taiKhoanDangNhap", obj);
				session.setAttribute("maDangNhap", obj.getMaDangNhap());
				session.setAttribute("chucNangs", Util_Menu.getMenu2(session.getAttribute("maDangNhap") + ""));
				return "SUCCESS";
			}
		}
		String err = "Tài khoản không tồn tại, hoặc mật khẩu không chính xác. <br/> Liên hệ bộ phận kỹ thuật khi quên mật khẩu đăng nhập. <hr/>";
		session.setAttribute("err", err);
		return "FAIL";
	}

	public String dangXuat() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.invalidate();
		return "SUCCESS";
	}
	
	
}

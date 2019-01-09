package kTXSm4.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kTXCore.controller.ZEController;
import kTXCore.dao.ObjectDAO;
import kTXCore.model.SinhVien;
import kTXCore.modelDao.DAO_SinhVien;
import kTXCore.util.Util_Date;
import kTXSm1.model.Phong;
import kTXSm3.model.DichVu;
import kTXSm3.modelDao.DAO_DichVu;
import kTXSm4.model.PhanHoi;
import kTXSm4.modelDao.DAO_PhanHoi;

public class Controller_PhanHoi extends PhanHoi implements ZEController<PhanHoi> {
	ObjectDAO dao = new DAO_PhanHoi();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "kTXSm4/pages/phanhois.jsp";
	String duongDanTrangView = "kTXSm4/pages/phanhoi.jsp";
	String tenCotTimDoiTuong = "maPhanHoi";
	String maObj;
	String maDichVu;
	String maSinhVien;
	String s_ngayPhanHoi;
	String s_thoiGianCapNhat;

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

	public String getMaDichVu() {
		return maDichVu;
	}

	public void setMaDichVu(String maDichVu) {
		this.maDichVu = maDichVu;
	}

	public DichVu getDichVu() {
		ObjectDAO<DichVu> dao_dichvu = new DAO_DichVu();
		ArrayList<DichVu> list_dichvu = dao_dichvu.listByColumns("maDichVu", getMaDichVu());
		if (list_dichvu.size() > 0)
			return list_dichvu.get(0);
		else
			return null;
	}

	public String getMaSinhVien() {
		return maSinhVien;
	}

	public void setMaSinhVien(String maSinhVien) {
		this.maSinhVien = maSinhVien;
	}

	public SinhVien getSinhVien() {
		ObjectDAO<SinhVien> dao_sinhvien= new DAO_SinhVien();
		ArrayList<SinhVien> list_sinhvien= dao_sinhvien.listByColumns("maSinhVien", getMaSinhVien());
		if(list_sinhvien.size()>0)
			return list_sinhvien.get(0);
		else
			return null;

	}

	public String getS_ngayPhanHoi() {
		return s_ngayPhanHoi;
	}

	public void setS_ngayPhanHoi(String s_ngayPhanHoi) {
		this.s_ngayPhanHoi = s_ngayPhanHoi;
	}
	public Date getNgayPhanHoi() {
		return Util_Date.stringToDate(getS_ngayPhanHoi());
	}

	public String getS_thoiGianCapNhat() {
		return s_thoiGianCapNhat;
	}

	public void setS_thoiGianCapNhat(String s_thoiGianCapNhat) {
		this.s_thoiGianCapNhat = s_thoiGianCapNhat;
	}
	public Date getThoiGianCapNhat() {
		return Util_Date.stringToDate(getS_thoiGianCapNhat());
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

		ArrayList<PhanHoi> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<PhanHoi> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		PhanHoi obj = new PhanHoi();
		obj.maPhanHoi = getMaPhanHoi();
		obj.dichVu = getDichVu();
		obj.sinhVien=getSinhVien();
		obj.noiDungPhanHoi=getNoiDungPhanHoi();
		obj.ngayPhanHoi=getNgayPhanHoi();
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
		PhanHoi obj = new PhanHoi();
		obj.setMaPhanHoi(maobj);
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
		ArrayList<PhanHoi> arr = dao.listByColumnLike(column, key);
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

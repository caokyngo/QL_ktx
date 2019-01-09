package kTXSm2.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import kTXCore.controller.ZEController;
import kTXCore.dao.ObjectDAO;
import kTXCore.model.Lop;
import kTXCore.model.NhanVien;
import kTXCore.util.Util_Number;
import kTXSm1.model.ThongTinNoiTru;
import kTXSm2.model.KhuyenMai;

import kTXSm2.model.MatHang;
import kTXSm2.model.NhaCungCap;
import kTXSm2.modelDao.DAO_KhuyenMai;

import kTXSm2.modelDao.DAO_MatHang;
import kTXSm2.modelDao.DAO_NhaCungCap;
import kTXSm3.model.DichVu;
import kTXSm3.modelDao.DAO_DichVu;

public class Controller_MatHang extends MatHang implements ZEController<MatHang> {
	ObjectDAO dao = new DAO_MatHang();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "kTXSm2/pages/mathangs.jsp";
	String duongDanTrangView = "kTXSm2/pages/mathang.jsp";
	String duongDanTrangDV = "kTXSm2/pages/mathang_sinhviens.jsp";
	String tenCotTimDoiTuong = "maMatHang";
	String maObj;
	String maDichVu;
	String maKhuyenMai;
	String maNhaCungCap;
	String maLoai;
	String s_ngayNhap;
	String s_giaNhap;
	String s_giaBan;
	String s_giaSauKhuyenMai;
	String s_anhMoTa;
	String s_thoiGianCapNhat;

	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder_kTXSm2;

	public String getDuongDanTrangDV() {
		return duongDanTrangDV;
	}

	public void setDuongDanTrangDV(String duongDanTrangDV) {
		this.duongDanTrangDV = duongDanTrangDV;
	}

	public String getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}
	
	

	public String getS_anhMoTa() {
		return s_anhMoTa;
	}

	public void setS_anhMoTa(String s_anhMoTa) {
		this.s_anhMoTa = s_anhMoTa;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public String getMyFileName() {
		return myFileName;
	}

	public void setMyFileName(String myFileName) {
		this.myFileName = myFileName;
	}

	public String getMyFolder_kTXSm2() {
		return myFolder_kTXSm2;
	}

	public void setMyFolder_kTXSm2(String myFolder_kTXSm2) {
		this.myFolder_kTXSm2 = myFolder_kTXSm2;
	}

	@Override
	public DichVu getDichVu() {
		ObjectDAO<DichVu> obj_DichVu = new DAO_DichVu();
		ArrayList<DichVu> ls_DichVu = obj_DichVu.listByColumns("maDichVu", getMaDichVu());
		if (ls_DichVu.size() > 0)
			return ls_DichVu.get(0);
		else
			return null;

	}

	@Override
	public KhuyenMai getKhuyenMai() {
		ObjectDAO<KhuyenMai> obj_KhuyenMai = new DAO_KhuyenMai();
		ArrayList<KhuyenMai> ls_KhuyenMai = obj_KhuyenMai.listByColumns("maKhuyenMai", getMaKhuyenMai());
		if (ls_KhuyenMai.size() > 0)
			return ls_KhuyenMai.get(0);
		else
			return null;
	}

	@Override
	public NhaCungCap getNhaCungCap() {
		ObjectDAO<NhaCungCap> obj_NhaCungCap = new DAO_NhaCungCap();
		ArrayList<NhaCungCap> ls_NhaCungCap = obj_NhaCungCap.listByColumns("maNhaCungCap", getMaNhaCungCap());
		if (ls_NhaCungCap.size() > 0)
			return ls_NhaCungCap.get(0);
		else
			return null;
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

	public String getS_ngayNhap() {
		return s_ngayNhap;
	}

	public void setS_ngayNhap(String s_ngayNhap) {
		this.s_ngayNhap = s_ngayNhap;
	}

	@Override
	public String getHanSuDung() {
		return hanSuDung;
	}

	@Override
	public void setHanSuDung(String hanSuDung) {
		this.hanSuDung = hanSuDung;
	}

	@Override
	public String getSoLuongTon() {
		return soLuongTon;
	}

	@Override
	public void setSoLuongTon(String soLuongTon) {
		this.soLuongTon = soLuongTon;
	}

	@Override
	public Double getGiaNhap() {
		return Double.parseDouble(getS_giaNhap());
	}

	public String getS_giaNhap() {
		return s_giaNhap;
	}

	public void setS_giaNhap(String s_giaNhap) {
		this.s_giaNhap = s_giaNhap;
	}

	public String getS_giaBan() {
		return s_giaBan;
	}

	public void setS_giaBan(String s_giaBan) {
		this.s_giaBan = s_giaBan;
	}

	public String getS_giaSauKhuyenMai() {
		return s_giaSauKhuyenMai;
	}

	public void setS_giaSauKhuyenMai(String s_giaSauKhuyenMai) {
		this.s_giaSauKhuyenMai = s_giaSauKhuyenMai;
	}

	@Override
	public void setGiaNhap(Double giaNhap) {
		this.giaNhap = giaNhap;
	}

	@Override
	public Double getGiaBan() {
		return Double.parseDouble(getS_giaBan());
	}

	@Override
	public void setGiaBan(Double giaBan) {
		this.giaBan = giaBan;
	}

	@Override
	public Double getGiaSauKhuyenMai() {
		return Double.parseDouble(getS_giaSauKhuyenMai());
	}

	@Override
	public void setGiaSauKhuyenMai(Double giaSauKhuyenMai) {
		this.giaSauKhuyenMai = giaSauKhuyenMai;
	}

	@Override
	public String getAnhMoTa() {
		return anhMoTa;
	}

	@Override
	public void setAnhMoTa(String anhMoTa) {
		this.anhMoTa = anhMoTa;
	}

	@Override
	public String getSoDiemDoi() {
		return soDiemDoi;
	}

	@Override
	public void setSoDiemDoi(String soDiemDoi) {
		this.soDiemDoi = soDiemDoi;
	}

	@Override
	public String getGhiChu() {
		return ghiChu;
	}

	@Override
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public String getS_thoiGianCapNhat() {
		return s_thoiGianCapNhat;
	}

	public void setS_thoiGianCapNhat(String s_thoiGianCapNhat) {
		this.s_thoiGianCapNhat = s_thoiGianCapNhat;
	}

	public void setMaDichVu(String maDichVu) {
		this.maDichVu = maDichVu;
	}

	public String getMaNhaCungCap() {
		return maNhaCungCap;
	}

	public void setMaNhaCungCap(String maNhaCungCap) {
		this.maNhaCungCap = maNhaCungCap;
	}

	public String getMaKhuyenMai() {
		return maKhuyenMai;
	}

	public void setMaKhuyenMai(String maKhuyenMai) {
		this.maKhuyenMai = maKhuyenMai;
	}

	public String getMaDichVu() {
		return maDichVu;
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

		ArrayList<MatHang> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<MatHang> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
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
		MatHang obj = (MatHang) dao.listByColumns("maMatHang", maobj).get(0);
		// obj.setMaNhanVien(maobj);
		if (obj.getAnhMoTa() != null) {
			myFileName = request.getRealPath("kTXSm2/images/sanphams") + "/" + obj.getAnhMoTa();
			System.out.println(myFileName);
			File destFile = new File(myFolder_kTXSm2, myFileName);
			if (destFile.exists()) {
				destFile.delete();
			}
		}
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
		ArrayList<MatHang> arr = dao.listByColumnLike(column, key);
		session.setAttribute("arr", arr);
		session.setAttribute("checkTimKiem", "true");
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	public String searchDV() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String column = getTimKiemTheo();
		String key = getTuKhoa();
		ArrayList<MatHang> arr = dao.listByColumnLike(column, key);
		session.setAttribute("arr", arr);
		session.setAttribute("checkTimKiem", "true");
		session.setAttribute("p", duongDanTrangDV);
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
	public String saveOrUpdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		try {
			String s = "";
			if (!myFileName.equals("")) {
				if (myFile != null) {
					myFileName = getMaMatHang() + myFileFileName.substring(myFileFileName.lastIndexOf("."));
					File destFile = new File(myFolder_kTXSm2, myFileName);
					s = destFile + "";
					FileUtils.copyFile(myFile, destFile);
					System.out.println(destFile.toString());
				} else {
					s = getS_anhMoTa();
				}
			} else
				s = getS_anhMoTa();

			MatHang obj = new MatHang();
			obj.maMatHang = getMaMatHang();
			obj.tenMatHang = getTenMatHang();
			obj.dichVu = getDichVu();
			obj.khuyenMai = getKhuyenMai();
			obj.nhaCungCap = getNhaCungCap();
			
			obj.ngayNhap = getNgayNhap();
			obj.hanSuDung = getHanSuDung();
			obj.soLuongTon = getSoLuongTon();
			obj.giaNhap = getGiaNhap();
			obj.giaBan = getGiaBan();
			obj.giaSauKhuyenMai = getGiaSauKhuyenMai();
			obj.anhMoTa = s.substring(s.lastIndexOf("\\") + 1, s.length());
			obj.soDiemDoi = getSoDiemDoi();
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
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";
		}
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

package kTXSm1.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;

import kTXCore.controller.ZEController;
import kTXCore.dao.ObjectDAO;
import kTXSm1.model.Phong;
import kTXSm1.modelDao.DAO_Phong;

public class Controller_Phong extends Phong implements ZEController<Phong> {
	ObjectDAO dao = new DAO_Phong();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "kTXSm1/pages/phongs.jsp";
	String duongDanTrangView = "kTXSm1/pages/phong.jsp";
	String tenCotTimDoiTuong = "maPhong";
	String maObj;

	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder_kTXSm1;

	String tenLop;

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

	public String getMyFolder_kTXSm1() {
		return myFolder_kTXSm1;
	}

	public void setMyFolder_kTXSm1(String myFolder_kTXSm1) {
		this.myFolder_kTXSm1 = myFolder_kTXSm1;
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

	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
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

		ArrayList<Phong> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<Phong> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		Phong obj = new Phong();
		obj.maPhong = getMaPhong();
		obj.tenPhong = getTenPhong();
		obj.diaChi = getDiaChi();
		obj.soGiuong = getSoGiuong();
		obj.soGiuongConTrong = getSoGiuongConTrong();
		obj.moTa = getMoTa();
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
		Phong obj = new Phong();
		obj.setMaPhong(maobj);
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
		ArrayList<Phong> arr = dao.listByColumnLike(column, key);
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

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		try {
			String s = "";
			if (!myFileName.equals("")) {
				if (myFile != null) {
					myFileName = getTenLop() + myFileFileName.substring(myFileFileName.lastIndexOf("."));
					File destFile = new File(myFolder_kTXSm1, myFileName);
					s = destFile.toString();
					FileUtils.copyFile(myFile, destFile);
					System.out.println(destFile.toString());

				}
				FileInputStream inputStream = new FileInputStream(new File(s));
				// Ä�á»‘i tÆ°á»£ng workbook cho file XSL.
				HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
				// Láº¥y ra sheet Ä‘áº§u tiÃªn tá»« workbook
				HSSFSheet sheet = workbook.getSheetAt(0);
				DAO_Phong objDAO = new DAO_Phong();
				Phong phong = new Phong();

				String msg = "";
				String kq = "";

				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
					Row r = sheet.getRow(i);

					Cell cell_maPhong = r.getCell(0);
					String maPhong = "";
					if (cell_maPhong != null)
						maPhong = cell_maPhong.toString();

					Cell cell_tenPhong = r.getCell(1);
					String tenPhong = "";
					if (cell_tenPhong != null)
						tenPhong = cell_tenPhong.toString();
					Cell cell_diaChi = r.getCell(2);
					String diaChi = "";
					if (cell_diaChi != null)
						diaChi = cell_diaChi.toString();
					
					Cell cell_soGiuong = r.createCell(3);
					String soGiuong = "";
					if (cell_soGiuong != null)
						soGiuong = cell_soGiuong.toString();
					
					Cell cell_soGiuongConTrong = r.getCell(4);
					String soGiuongConTrong = "";
					if (cell_soGiuongConTrong != null)
						soGiuongConTrong = cell_soGiuongConTrong.toString();

					Cell cell_ghiChu = r.getCell(5);
					String ghiChu = "";
					if (cell_ghiChu != null)
						ghiChu = cell_ghiChu.toString();

					Cell cell_moTa = r.getCell(6);
					String moTa = "";
					if (cell_moTa != null)
						moTa = cell_moTa.toString();


					phong.setMaPhong(maPhong);
					phong.setDiaChi(diaChi);
					phong.setGhiChu(ghiChu);
					phong.setMoTa(moTa);
					phong.setTenPhong(tenPhong);
					phong.setSoGiuong(soGiuong);
					phong.setSoGiuongConTrong(soGiuongConTrong);

					if (objDAO.saveOrUpdate(phong)) {
						kq += "";
					} else {
						kq += "fail ";
					}
				}
				if (kq.equals(""))
					return "SUCCESS";
				else
					return "FAIL";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "SUCCESS";
	}
	public String deleteAll() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ObjectDAO<Phong> dao_Phong = new DAO_Phong();
		ArrayList<Phong> list_Phong = dao_Phong.listAll();
		String kq = "";
		for (Phong phong : list_Phong)
			if (dao_Phong.delete(phong))
				kq += "";
			else
				kq += " fail";
		if (kq.isEmpty()) {
			session.setAttribute("msg", "Xóa dữ liệu thành công");
			return "SUCCESS";
		}
		else {
			session.setAttribute("msg", "Xóa dữ liệu không thành công");
			return "FAIL";
		}
	}
	
	@Override
	public String exportData() {
		// TODO Auto-generated method stub
		return null;
	}

}

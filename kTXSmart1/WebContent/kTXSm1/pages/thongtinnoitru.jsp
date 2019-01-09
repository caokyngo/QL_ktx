<%@page import="kTXCore.util.Util_Number"%>
<%@page import="kTXCore.model.HocKy"%>
<%@page import="kTXCore.modelDao.DAO_HocKy"%>
<%@page import="kTXSm1.model.Phong"%>
<%@page import="kTXSm1.modelDao.DAO_Phong"%>
<%@page import="kTXCore.model.SinhVien"%>
<%@page import="kTXCore.model.TaiKhoanSinhVien"%>
<%@page import="kTXCore.modelDao.DAO_TaiKhoanSinhVien"%>
<%@page import="kTXSm1.model.DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXSm1.modelDao.DAO_DotKeKhaiThongTinNoiTru"%>
<%@page import="java.util.Date"%>
<%@page import="kTXSm1.model.ThongTinNoiTru"%>
<%@page import="kTXCore.util.Util_Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String tenLop = "ThongTinNoiTru";
	String tenTrang = "Thông tin nội trú";
	String trangDanhSach = "index.jsp?p=kTXSm1/pages/thongtinnoitrus.jsp";
	String[] tk_value = { "maThongTinNoiTru", "sinhVien", "phong", "dotKeKhaiThongTinNoiTru", "ngayDangKy",
			"ngayKeKhaiThongTin" };
	String[] tk_show = { "Mã thông tin nội trú", "Sinh viên", "Phòng", "Đợt kê khai thông tin nội trú",
			"Ngày đăng ký ", "Ngày kê khai thông tin" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	String mode = session.getAttribute("mode") + "";
	String tenTrangChiTiet = "";
	tenTrangChiTiet = mode.equals("addNew") ? "Thêm mới" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

	boolean modeView = mode.equals("viewDetail");
	boolean modeEdit = mode.equals("viewDetailAndEdit");

	// kiểm tra xem đang truy cập vào trang đăng ký bằng link p=kTXSm1/pages/thongtinnoitru.jsp
	// hay vào trang đăng ký bằng nhấn nút thêm mới 
	// nếu vào bằng link trên thì set lại modeView =false để không bị lỗi khi vào xem chi tiết, sau đó vào trang thêm mới bằng link trên
	String p = request.getParameter("p") + "";
	if (p.equals("kTXSm1/pages/thongtinnoitru.jsp"))
		modeView = false;

	ThongTinNoiTru obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof ThongTinNoiTru) {
			obj = (ThongTinNoiTru) session.getAttribute("obj");
		}
	}
%>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			-
			<%=tenTrangChiTiet%>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<form action="luuDuLieu<%=tenLop%>.action" method="post">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: left;">
					<div class="row">
						<div class="col-md-5">
							<p style="color: red; display: inline;"><%=msg%></p>
						</div>
						<div class="col-md-7">
							<%@ include file="../../kTXPartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã thông tin nội trú <span class="text-danger">(*)</span></label>
									<input class="form-control" name="maThongTinNoiTru"
										value="<%=(obj != null ? obj.getMaThongTinNoiTru() : System.currentTimeMillis())%>"
										readonly required="required">
								</div>
								<div class="form-group">
									<label>Ngày kê khai thông tin <span class="text-danger">(*)</span></label>
									<input type="date" class="form-control"
										name="s_ngayKeKhaiThongTin"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getNgayKeKhaiThongTin())
					: Util_Date.dateToString(new Date()))%>"
										disabled required="required">
								</div>
								<div class="form-group">
									<label>Đợt kê khai nội trú <span class="text-danger">(*)</span></label>
									<%
										ObjectDAO objdao = new DAO_DotKeKhaiThongTinNoiTru();
										ArrayList<DotKeKhaiThongTinNoiTru> listDotKeKhaiThongTinNoiTru = objdao.listAll();
										Date currentDate = new Date();
										ArrayList<DotKeKhaiThongTinNoiTru> list_remove = new ArrayList<DotKeKhaiThongTinNoiTru>();

										for (DotKeKhaiThongTinNoiTru dotKeKhaiThongTinNoiTru : listDotKeKhaiThongTinNoiTru) {
											if (!(currentDate.after(dotKeKhaiThongTinNoiTru.getNgayBatDau())
													&& currentDate.before(dotKeKhaiThongTinNoiTru.getNgayKetThuc()))) {
												// nếu ngày hiện tại không nằm trong khoảng thời gian của đợt đăng ký
												// => thêm đợt đăng ký đó vào list_remove để xóa
												list_remove.add(dotKeKhaiThongTinNoiTru);
											}
										}
										listDotKeKhaiThongTinNoiTru.removeAll(list_remove);
										// mặc định sẽ không nằm trong đợt đăng ký
										// nếu sau bước kiểm tra ở trên mà có đợt đăng ký nào trong ngày hiện tại => isTrongDotDangKy = true 
										boolean isTrongDotKeKhai = false;
										if (listDotKeKhaiThongTinNoiTru.size() > 0)
											isTrongDotKeKhai = true;
									%>
									<select class="form-control" name="maDotKeKhaiThongTinNoiTru"
										<%=(modeView || isTrongDotKeKhai == false ? " disabled " : "")%>
										required="required">
										<%
											if (obj == null) {
												// trường hợp chưa đăng ký => lấy danh sách đợt đăng ký từ bảng đợt đăng ký
												for (DotKeKhaiThongTinNoiTru dotKeKhaiThongTinNoiTru : listDotKeKhaiThongTinNoiTru) {
										%>
										<option
											value="<%=dotKeKhaiThongTinNoiTru.getMaDotKeKhaiThongTinNoiTru()%>"><%=dotKeKhaiThongTinNoiTru.getTenDotKeKhaiThongTinNoiTru()%></option>
										<%
											}
											}
											if (obj != null && obj.getDotKeKhaiThongTinNoiTru() != null) {
												// trường hợp đã đăng ký => lấy đợt đăng ký từ thông tin đăng ký
										%>
										<option
											value="<%=obj.getDotKeKhaiThongTinNoiTru().getMaDotKeKhaiThongTinNoiTru()%>"><%=obj.getDotKeKhaiThongTinNoiTru().getTenDotKeKhaiThongTinNoiTru()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Phòng <span class="text-danger">(*)</span></label> <select
										class="form-control" name="maPhong"
										<%=(modeView ? " disabled " : "")%> required="required">
										<%
											ObjectDAO dao_phong = new DAO_Phong();
											ArrayList<Phong> listPhong = dao_phong.listAll();
											for (int i = 0; i < listPhong.size(); i++) {
												Phong phong = listPhong.get(i);
												if (obj != null && obj.getPhong() != null
														&& Integer.parseInt(obj.getPhong().getSoGiuongConTrong()) < Integer
																.parseInt(obj.getPhong().getSoGiuong())
														&& obj.getPhong().getMaPhong().equals(phong.maPhong)) {
										%>
										<option value="<%=phong.maPhong%>" selected="selected"><%=phong.tenPhong%></option>
										<%
											} else {
										%>
										<option value="<%=phong.maPhong%>"><%=phong.tenPhong%></option>
										<%
											}
										%>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<%
										ObjectDAO objdao_TaiKhoan = new DAO_TaiKhoanSinhVien();
										String maDangNhap = session.getAttribute("maDangNhap").toString();
										ArrayList<TaiKhoanSinhVien> listTaiKhoan = objdao_TaiKhoan.listByColumns("maDangNhap", maDangNhap);
										if (listTaiKhoan.size() > 0) {
											TaiKhoanSinhVien taiKhoan = listTaiKhoan.get(0);
											SinhVien sinhVien = taiKhoan.getSinhVien();
									%>
									<label>Mã sinh viên <span class="text-danger">(*)</span></label>
									<input class="form-control" name="maSinhVien" readonly
										value="<%=obj != null && obj.getSinhVien() != null ? obj.getSinhVien().getMaSinhVien()
						: sinhVien.getMaSinhVien()%> "
										required="required">

									<%
										} else {
									%>
									<label>Mã sinh viên <span class="text-danger">(*)</span></label>
									<input class="form-control" name="maSinhVien"
										<%=(modeView ? " readonly " : "")%>
										value='<%=obj != null && obj.getSinhVien() != null ? obj.getSinhVien().getMaSinhVien() : ""%> '
										required="required">
									<%
										}
									%>
								</div>

								<div class="form-group">
									<label>Ngày đăng ký <span class="text-danger">(*)</span></label><input
										type="date" class="form-control" name="s_ngayDangKy"
										value='<%=(obj != null ? Util_Date.dateToString(obj.getNgayDangKy()) : "")%>'
										<%=(modeView ? "disable" : "")%> required="required">
								</div>

								<div class="form-group">
									<label>Học kỳ<span class="text-danger">(*)</span></label> <select
										class="form-control" name="maHocKy"
										<%=(modeView ? "disable" : "")%> required="required">
										<%
											ObjectDAO dao_hocky = new DAO_HocKy();
											ArrayList<HocKy> listHocKy = dao_hocky.listAll();
											for (int i = 0; i < listHocKy.size(); i++) {
												HocKy hk = listHocKy.get(i);
												if (obj != null && obj.getHocKy() != null && obj.getHocKy().getMaHocKy().equals(hk.maHocKy)) {
										%>
										<option value="<%=hk.maHocKy%>" selected="selected"><%=hk.tenHocKy%></option>
										<%
											} else {
										%>
										<option value="<%=hk.maHocKy%>"><%=hk.tenHocKy%></option>
										<%
											}
										%>
										<%
											}
										%>

									</select>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label>Mô tả</label>
											<textarea class="form-control" cols="80" id="editor1"
												rows="5" name="moTa" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getMoTa() != null ? obj.getMoTa() : "")%></textarea>
										</div>
										<div class="form-group">
											<label>Ghi chú</label>
											<textarea class="form-control" cols="80" id="editor2"
												rows="5" name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getGhiChu() : "")%></textarea>
										</div>
									</div>
								</div>
								<div class="panel-footer" style="text-align: left;">
									<div class="col-md-5"></div>
									<div class="col-md-7">
										<%@ include file="../../kTXPartial/processform.jsp"%>
									</div>
								</div>
								<!-- /.col-lg-6 (nested) -->
								<!-- /.col-lg-6 (nested) -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<%
	session.removeAttribute("msg");
%>
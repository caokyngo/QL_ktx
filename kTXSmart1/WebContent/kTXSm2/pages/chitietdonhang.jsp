<%@page import="java.util.HashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="kTXSm2.model.TinhTrangDonHang"%>
<%@page import="kTXSm2.modelDao.DAO_TinhTrangDonHang"%>
<%@page import="kTXSm2.model.LoaiDonHang"%>
<%@page import="kTXSm2.modelDao.DAO_LoaiDonHang"%>

<%@page import="kTXSm2.model.MatHang"%>
<%@page import="kTXCore.model.NhanVien"%>
<%@page import="java.util.Date"%>
<%@page import="kTXCore.util.Util_Date"%>
<%@page import="kTXSm2.model.DonHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "DonHang";
	String tenTrang = "Quản lý chi tiết đơn hàng";
	String trangDanhSach = "index.jsp?p=kTXSm2/pages/mathang_sinhviens.jsp";
	String[] tk_value = { "maDonHang", "sinhVien", "nhanVien", "loaiDonHang", "tinhTrangDonHang" };
	String[] tk_show = { "Mã đơn hàng", "Sinh viên", "Nhân viên", "Loại đơn hàng", "Tình trạng đơn hàng" };
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

	DonHang obj = session.getAttribute("obj") != null ? (DonHang) session.getAttribute("obj") : null;
	// 	DonHang obj_donhang = session.getAttribute("obj_donhang") != null
	// 			? (DonHang) session.getAttribute("obj_donhang")
	// 			: null;
	// 	MatHang obj_mathang = session.getAttribute("obj_mathang") != null
	// 			? (MatHang) session.getAttribute("obj_mathang")
	// 			: null;
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
									<label>Mã đơn hàng <span class="text-danger">(*)</span></label>
									<input class="form-control" name="maChiTietDonHang"
										value="<%=(obj != null ? obj.getMaDonHang() : System.currentTimeMillis())%>"
										readonly required="required">
								</div>
								<div class="form-group">
									<label>Mã mặt hàng <span class="text-danger">(*)</span></label>
									<%
										Set<MatHang> matHangSet = new HashSet<>();
										if (obj != null && obj.getMathangs() != null)
											matHangSet = obj.mathangs;
									%>
									<input class="form-control" name="maMatHang"
										value="<%=(obj != null && obj.getMathangs() != null ? obj.getMathangs() : "")%>"
										readonly required="required">
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
										value="<%=obj != null && obj.getSinhVien() != null ? obj.getSinhVien().getMaSinhVien() : ""%> "
										required="required">

									<%
										} else {
											ObjectDAO objdao_TaiKhoannv = new DAO_TaiKhoanNhanVien();

											ArrayList<TaiKhoanNhanVien> listTaiKhoannv = objdao_TaiKhoannv.listByColumns("maDangNhap", maDangNhap);
											if (listTaiKhoannv.size() > 0) {
												TaiKhoanNhanVien taiKhoannv = listTaiKhoannv.get(0);
												NhanVien nhanVien = taiKhoannv.getNhanVien();
									%>
									<label>Mã nhân viên <span class="text-danger">(*)</span></label>
									<input class="form-control" name="maNhanVien" readonly
										value="<%=obj != null && obj.getNhanVien() != null ? obj.getNhanVien().getMaNhanVien() : ""%> "
										required="required">
									<%
										}
										}
									%>
								</div>
								<div class="form-group">
									<label>Loại đơn hàng</label> <select class="form-control"
										name="maLoai" <%=(modeView ? " disabled " : "")%>>
										<option></option>

										<%
											ObjectDAO dao_loaidh = new DAO_LoaiDonHang();
											ArrayList<LoaiDonHang> listloaidh = dao_loaidh.listAll();
											for (int i = 0; i < listloaidh.size(); i++) {
												LoaiDonHang ldh = listloaidh.get(i);
												if (obj != null && obj.getLoaiDonHang() != null
														&& obj.getLoaiDonHang().getMaLoai().equals(ldh.maLoai)) {
										%>
										<option value="<%=ldh.maLoai%>" selected="selected">
											<%=ldh.tenLoaiDonHang%>
										</option>
										<%
											} else {
										%>
										<option value="<%=ldh.maLoai%>">
											<%=ldh.tenLoaiDonHang%>
										</option>
										<%
											}
										%>
										<%
											}
										%>

									</select>

								</div>
								<div class="form-group">
									<label>Tình trạng đơn hàng</label> <select class="form-control"
										name="maTinhTrangDonHang" <%=(modeView ? " disabled " : "")%>>
										<%
											ObjectDAO dao_tinhtrangdh = new DAO_TinhTrangDonHang();
											ArrayList<TinhTrangDonHang> listtinhtrangdh = dao_tinhtrangdh.listAll();
											if (listtinhtrangdh.size() > 0) {
										%>
										<option
											value="<%=listtinhtrangdh.get(0).getMaTinhTrangDonHang()%>"><%=listtinhtrangdh.get(0).getTenTinhTrangDonHang()%></option>

										<%
											}
										%>





									</select>

								</div>


								<div class="form-group">
									<label>Địa chỉ</label> <input class="form-control"
										name="diaChi"
										value="<%=(obj != null ? obj.getDiaChi() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Số điện thoại</label> <input class="form-control"
										name="soDienThoai"
										value="<%=(obj != null ? obj.getSoDienThoai() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày đặt hàng <span class="text-danger">(*)</span></label>
									<input type="date" class="form-control" name="s_ngayDat"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getNgayDat()) : Util_Date.dateToString(new Date()))%>"
										disabled required="required">
								</div>

								<div class="form-group">
									<label>Số lượng</label> <input class="form-control"
										name="soLuong"
										value="<%=(obj != null && obj.getSoLuong() != null ? obj.getSoLuong() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tổng tiền</label> <input class="form-control"
										name="s_tongTien" readonly required="required"
										value="<%=(obj != null && obj.getTongTien() != null ? obj.getTongTien() : "")%>">
								</div>


								<div class="row">
									<div class="col-lg-12">
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
										<%@ include file="../../kTXPartial/processformdv.jsp"%>
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
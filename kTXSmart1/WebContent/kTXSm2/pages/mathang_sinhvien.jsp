<%@page import="kTXSm2.model.NhaCungCap"%>
<%@page import="kTXSm2.modelDao.DAO_NhaCungCap"%>
<%@page import="kTXSm2.model.KhuyenMai"%>
<%@page import="kTXSm2.modelDao.DAO_KhuyenMai"%>
<%@page import="kTXSm3.model.DichVu"%>
<%@page import="kTXSm3.modelDao.DAO_DichVu"%>
<%@page import="kTXSm2.model.MatHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "MatHang";
	String tenTrang = "Quản lý Mặt Hàng";
	String trangDanhSach = "index.jsp?p=kTXSm2/pages/mathang_sinhviens.jsp";
	String[] tk_value = {"maMatHang", "tenMatHang", "khuyeMai", "nhaCungCap", "soLuongTon", "soDiemDoi"};
	String[] tk_show = {"Mã mặt hàng", "Tên mặt hàng", "Khuyến mãi", "Nhà cung cấp", "Số lượng trong kho",
			"Số điểm quy đổi"};
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

	MatHang obj = session.getAttribute("obj") != null ? (MatHang) session.getAttribute("obj") : null;
%>
<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maMatHang");
		x.value = x.value.toUpperCase();

		var b = document.getElementById("myFileName");
		b.value = x.value;

	}
</script>

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
									<label>Mã mặt hàng</label> <input class="form-control"
										name="maMatHang"
										value="
										<%=(obj != null ? obj.getMaMatHang() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên mặt hàng</label> <input class="form-control"
										name="tenMatHang"
										value='<%=(obj != null ? obj.getTenMatHang() : "")%>'
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>Thuộc dịch vụ</label> <select class="form-control"
										name="maDichVu" <%=(modeView ? " disabled " : "")%>>
										<option></option>

										<%
											ObjectDAO dao_dichVu = new DAO_DichVu();
											ArrayList<DichVu> listDichVu = dao_dichVu.listAll();
											for (int i = 0; i < listDichVu.size(); i++) {
												DichVu dv = listDichVu.get(i);
												if (obj != null && obj.getDichVu() != null && obj.getDichVu().getMaDichVu().equals(dv.maDichVu)) {
										%>
										<option value="<%=dv.maDichVu%>" selected="selected">
											<%=dv.tenDichVu%>
										</option>
										<%
											} else {
										%>
										<option value="<%=dv.maDichVu%>">
											<%=dv.tenDichVu%>
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
									<label>Chương trình khuyến mãi</label> <select
										class="form-control" name="maKhuyenMai"
										<%=(modeView ? " disabled " : "")%>>
										<%
											ObjectDAO dao_khuyenMai = new DAO_KhuyenMai();
											ArrayList<KhuyenMai> listKhuyenMai = dao_khuyenMai.listAll();
											for (int i = 0; i < listKhuyenMai.size(); i++) {
												KhuyenMai km = listKhuyenMai.get(i);
												if (obj != null && obj.getKhuyenMai() != null
														&& obj.getKhuyenMai().getMaKhuyenMai().equals(km.maKhuyenMai)) {
										%>
										<option value="<%=km.maKhuyenMai%>" selected="selected"><%=km.tenKhuyenMai%></option>
										<%
											} else {
										%>
										<option value="<%=km.maKhuyenMai%>"><%=km.tenKhuyenMai%></option>
										<%
											}
										%>
										<%
											}
										%>

									</select>
								</div>
								<div class="form-group">
									<label>Nhà cung cấp</label> <select class="form-control"
										name="maNhaCungCap" <%=(modeView ? " disabled " : "")%>>

										<%
											ObjectDAO dao_nhaCungCap = new DAO_NhaCungCap();
											ArrayList<NhaCungCap> listNhaCungCap = dao_nhaCungCap.listAll();
											for (int i = 0; i < listNhaCungCap.size(); i++) {
												NhaCungCap ncc = listNhaCungCap.get(i);
												if (obj != null && obj.getNhaCungCap() != null
														&& obj.getNhaCungCap().getMaNhaCungCap().equals(ncc.maNhaCungCap)) {
										%>
										<option value="<%=ncc.maNhaCungCap%>" selected="selected"><%=ncc.tenNhaCungCap%></option>
										<%
											} else {
										%>
										<option value="<%=ncc.maNhaCungCap%>"><%=ncc.tenNhaCungCap%></option>
										<%
											}
										%>
										<%
											}
										%>

									</select>
								</div>
								<div class="form-group">
									<label>Số lượng tồn kho</label> <input class="form-control"
										name="soLuongTon"
										value='<%=(obj != null ? obj.getSoLuongTon() : "")%>'
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>Số điểm đổi</label> <input class="form-control"
										name="soDiemDoi"
										value='<%=(obj != null && obj.getSoDiemDoi() != null ? obj.getSoDiemDoi() : "")%>'
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>Giá nhập</label> <input class="form-control"
										name="s_giaNhap"
										value='<%=(obj != null && obj.getGiaNhap() != null ? obj.getGiaNhap() : "")%>'
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>Giá bán</label> <input class="form-control"
										name="s_giaBan"
										value='<%=(obj != null && obj.getGiaBan() != null ? obj.getGiaBan() : "")%>'
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>giá sau khuyến mãi</label> <input class="form-control"
										name="s_giaSauKhuyenMai"
										value='<%=(obj != null && obj.getGiaSauKhuyenMai() != null ? obj.getGiaSauKhuyenMai() : "")%>'
										<%=(modeView ? " disabled " : "")%>>



								</div>
								<div class="form-group">
									<label>Hình ảnh sản phẩm</label> <input class="form-control"
										name="myFile"
										value="<%=(obj != null && obj.getAnhMoTa() != null ? obj.getAnhMoTa() : "")%>"
										type="<%=(modeView ? "hidden" : "file")%>"><img
										src="<%=obj != null && obj.getAnhMoTa() != null && modeView ? "kTXSm2/images/sanphams/" + obj.getAnhMoTa()
					: ""%>"
										height="<%=modeView ? 135 : 1%>"
										width="<%=modeView ? 135 : 1%>">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor2" rows="5"
										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getGhiChu() : "")%></textarea>
								</div>
							</div>
						</div>
						<input type="hidden" name="s_anhMoTa"
							value="<%=obj != null && obj.getAnhMoTa() != null ? obj.getAnhMoTa() : ""%>">
						<input type="hidden" id="myFileName" name="myFileName"></input> <input
							type="hidden" name="myFolder_kTXSm2"
							value="<%=request.getRealPath("kTXSm2/images/sanphams")%>" />
						<div class="panel-footer" style="text-align: left;">
							<div class="col-md-5"></div>
							<div class="col-md-7">
								<%@ include file="../../kTXPartial/processform.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</form>

<%@page import="kTXSm2.model.NhaCungCap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "NhaCungCap";
	String tenTrang = "Quản lý Nhà Cung Cấp";
	String trangDanhSach = "index.jsp?p=kTXSm2/pages/nhacungcaps.jsp";
	String[] tk_value = { "maNhaCungCap", "tenNhaCungCap", "soDienThoai", "diaChi", "email", "quocGia" };
	String[] tk_show = { "Mã nhà cung cấp", "Tên nhà cung cấp", "Số điện thoại", "Địa chỉ", "Email",
			"Quốc gia" };
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

	NhaCungCap obj = session.getAttribute("obj") != null ? (NhaCungCap) session.getAttribute("obj") : null;
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
									<label>Mã nhà cung cấp</label> <input class="form-control" name="maNhaCungCap"
										value="<%=(obj != null ? obj.getMaNhaCungCap() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên nhà cung cấp</label> <input class="form-control"
										name="tenNhaCungCap"
										value="<%=(obj != null ? obj.getTenNhaCungCap(): "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Số điện thoại</label> <input class="form-control" name="soDienThoai"
										value="<%=(obj != null ? obj.getSoDienThoai() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Fax</label> <input  class="form-control" name="fax"
										value="<%=(obj != null ? obj.getFax() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Email</label> <input  class="form-control" name="email"
										value="<%=(obj != null ? obj.getEmail() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Địa chỉ</label> <input  class="form-control" name="diaChi"
										value="<%=(obj != null ? obj.getDiaChi() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Quốc gia</label> <input  class="form-control" name="quocGia"
										value="<%=(obj != null ? obj.getQuocGia(): "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getGhiChu() : "")%></textarea>
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
					<!-- /.row (nested) -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</form>
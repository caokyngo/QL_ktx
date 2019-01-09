<%@page import="kTXSm2.model.KhuyenMai"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "KhuyenMai";
	String tenTrang = "Quản lý chương trình khuyến mãi";
	String trangDanhSach = "index.jsp?p=kTXSm2/pages/khuyenmais.jsp";
	String[] tk_value = { "maKhuyenMai", "tenKhuyenMai", "thoiGianBatDau", "thoiGianKetThuc", "mucKhuyenMai" };
	String[] tk_show = { "Mã khuyến mãi", "Tên khuyến mãi", "thời gian bắt đầu", "Thời gian kết thúc",
			"Mức khuyến mãi" };
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

	KhuyenMai obj = session.getAttribute("obj") != null ? (KhuyenMai) session.getAttribute("obj") : null;
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
									<label>Mã khuyến mãi</label> <input class="form-control"
										name="maKhuyenMai"
										value='
										<%=(obj != null ? obj.getMaKhuyenMai() : "")%>'
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên chương trình khuyến mãi</label> <input
										class="form-control" name="tenKhuyenMai"
										value="<%=(obj != null ? obj.getTenKhuyenMai() : "")%>"
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>Thời gian bắt đầu</label> <input type="date"
										class="form-control" name="s_thoiGianBatDau"
										value="<%=(obj != null ? obj.getThoiGianBatDau() : "")%>"
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>Thời gian kết thúc</label> <input type="date"
										class="form-control" name="s_thoiGianKetThuc"
										value="<%=(obj != null ? obj.getThoiGianKetThuc() : "")%>"
										<%=(modeView ? " disabled " : "")%>>

								</div>
								<div class="form-group">
									<label>Mức khuyến mãi</label> <input class="form-control"
										name="s_mucKhuyenMai"
										value="<%=(obj != null && obj.getMaKhuyenMai() != null ? obj.getMucKhuyenMai() : "")%>"
										<%=(modeView ? " disabled " : "")%>>

								</div>
							</div>
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


			</div>

		</div>

	</div>

</form>
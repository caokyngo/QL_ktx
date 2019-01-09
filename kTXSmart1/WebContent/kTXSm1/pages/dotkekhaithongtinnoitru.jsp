<%@page import="java.util.Date"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@page import="kTXSm1.modelDao.DAO_DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXSm1.model.DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXCore.util.Util_Number"%>
<%@page import="kTXCore.util.Util_Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String tenLop = "DotKeKhaiThongTinNoiTru";
	String tenTrang = "Quản lý đợt kê khai thông tin nội trú";
	String trangDanhSach = "index.jsp?p=kTXSm1/pages/dotkekhaithongtinnoitrus.jsp";
	String[] tk_value = { "maDotKeKhaiThongTinNoiTru", "tenDotKeKhaiThongTinNoiTru", "ngayBatDau",
			"ngayKetThuc" };
	String[] tk_show = { "Mã đợt kê khai thông tin nội trú", "Tên đợt kê khai thông tin nội trú",
			"Ngày bắt đầu", "Ngày kết thúc" };
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

	DotKeKhaiThongTinNoiTru obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof DotKeKhaiThongTinNoiTru) {
			obj = (DotKeKhaiThongTinNoiTru) session.getAttribute("obj");
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
									<label>Mã đợt kê khai <span class="text-danger">(*)</span></label> <input class="form-control"
										name="maDotKeKhaiThongTinNoiTru"
										value="<%=(obj != null ? obj.getMaDotKeKhaiThongTinNoiTru() : System.currentTimeMillis())%>"
										 readonly required="required">
								</div>
								<div class="form-group">
									<label>Tên đợt kê khai <span class="text-danger">(*)</span></label> <input class="form-control"
										name="tenDotKeKhaiThongTinNoiTru"
										value="<%=(obj != null ? obj.getTenDotKeKhaiThongTinNoiTru() : "")%>"
										<%=(modeView ? " disabled " : "")%> required="required">
								</div>

							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Ngày bắt đầu <span class="text-danger">(*)</span></label> <input type="date"
										class="form-control" name="s_ngayBatDau"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getNgayBatDau()) : Util_Date.dateToString(new Date()))%>"
										<%=(modeView ? " disabled " : "")%> required="required">
								</div>
								<div class="form-group">
									<label>Ngày kết thúc <span class="text-danger">(*)</span></label> <input type="date"
										class="form-control" name="s_ngayKetThuc"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getNgayKetThuc()) : Util_Date.dateToString(new Date()))%>"
										<%=(modeView ? " disabled " : "")%> required="required">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Mô tả</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="moTa" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getMoTa() != null ? obj.getMoTa() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor2" rows="5"
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
<%session.removeAttribute("msg"); %>
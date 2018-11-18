<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kTXSm1.model.Phong"%>
<%@page import="kTXSm1.modelDao.DAO_Phong"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String tenLop = "Phong";
	String tenTrang = "Quản lý phòng";
	String trangDanhSach = "index.jsp?p=kTXSm1/pages/phongs.jsp";
	String[] tk_value = { "maPhong", "tenPhong", "diaChi", "soGiuong", "soGiuongConTrong" };
	String[] tk_show = { "Mã phòng", "Tên phòng", "Địa chỉ", "Số giường", "Số giường còn trống" };
%>
<%@include file="../../kTXPartial/code-header.jsp"%>
<%
	String mode = session.getAttribute("mode") + "";
	String tenTrangChiTiet = "";
	tenTrangChiTiet = mode.equals("addNew") ? "Thêm mới" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

	boolean modeView = mode.equals("viewDetail");
	boolean modeEdit = mode.equals("viewDetailAndEdit");

	Phong obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof Phong) {
			obj = (Phong) session.getAttribute("obj");
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
									<label>Mã phòng <span class="text-danger">(*)</span></label> <input
										class="form-control" name="maPhong"
										value="<%=(obj != null ? obj.getMaPhong() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>
										required="required">
								</div>
								<div class="form-group">
									<label>Tên phòng <span class="text-danger">(*)</span></label> <input
										class="form-control" name="tenPhong"
										value="<%=(obj != null ? obj.getTenPhong() : "")%>"
										<%=(modeView ? " disabled " : "")%> required="required">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Địa chỉ <span class="text-danger">(*)</span></label> <input
										class="form-control" name="diaChi"
										value="<%=(obj != null ? obj.getDiaChi() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>
										required="required">
								</div>
								<div class="form-group">
									<label>Số giường <span class="text-danger">(*)</span></label> <input
										class="form-control" name="soGiuong"
										value="<%=(obj != null ? obj.getSoGiuong() : "")%>"
										<%=(modeView || modeEdit ? " readonlys " : "")%>
										required="required">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Số giường còn trống <span class="text-danger">(*)</span></label>
									<input class="form-control" name="soGiuongConTrong"
										value="<%=(obj != null ? obj.getSoGiuongConTrong() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>
										required="required">
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
										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getMoTa() : "")%></textarea>
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
		</div>
	</div>

</form>
<%
	session.removeAttribute("msg");
%>
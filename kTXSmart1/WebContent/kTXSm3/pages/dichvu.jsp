<%@page import="kTXCore.util.Util_Date"%>
<%@page import="kTXCore.model.NhanVien"%>
<%@page import="kTXCore.modelDao.DAO_NhanVien"%>
<%@page import="kTXSm3.model.DichVu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "DichVu";
	String tenTrang = "Quản lý dịch vụ";
	String trangDanhSach = "index.jsp?p=kTXSm3/pages/dichvus.jsp";
	String[] tk_value = {"maDichVu", "nhanVien", "tenDichVu", "ngayTao"};
	String[] tk_show = {"Mã dịch vụ", "Nhân viên", "Tên dịch vụ", "Ngày tạo"};
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

	DichVu obj = session.getAttribute("obj") != null ? (DichVu) session.getAttribute("obj")
			: null;
	
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
									<label>Mã dịch vụ</label> <input class="form-control"
										name="maDichVu"
										value="<%=(obj != null ? obj.getMaDichVu() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên dịch vụ</label> <input class="form-control"
										name="tenDichVu"
										value="<%=(obj != null ? obj.getTenDichVu() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày tạo</label> <input type="date" class="form-control" name="s_ngayTao"
										value="<%=(obj != null && Util_Date.dateToString(obj.getNgayTao()) != null ? Util_Date.dateToString(obj.getNgayTao()) : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Nhân viên</label> <select class="form-control"
										name="maNhanVien" <%=(modeView ? " disabled " : "")%>>
										<%
											ObjectDAO objdao = new DAO_NhanVien();
											ArrayList<NhanVien> listNhanVien = objdao.listAll();
											for (NhanVien nv : listNhanVien) {
										%>
										<option value="<%=nv.maNhanVien%> "
											<%=obj != null && obj.getNhanVien().maNhanVien.equals(nv.maNhanVien) ? "selected" : ""%>>
											<%=nv.tenNhanVien%>
										</option>
										<%
											}
										%>
									</select>
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
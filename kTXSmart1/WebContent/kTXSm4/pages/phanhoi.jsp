<%@page import="java.util.Date"%>
<%@page import="kTXCore.util.Util_Date"%>
<%@page import="kTXSm3.model.DichVu"%>
<%@page import="kTXSm3.modelDao.DAO_DichVu"%>
<%@page import="kTXSm4.modelDao.DAO_PhanHoi"%>
<%@page import="kTXCore.model.NhanVien"%>
<%@page import="kTXCore.model.SinhVien"%>
<%@page import="kTXSm4.model.PhanHoi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "PhanHoi";
	String tenTrang = "Quản lý phản hồi";
	String trangDanhSach = "index.jsp?p=kTXSm4/pages/phanhois.jsp";
	String[] tk_value = { "maPhanHoi", "dichVu", "sinhVien", "noiDungPhanHoi", "ngayPhanHoi" };
	String[] tk_show = { "Mã phản hồi", "Dịch vụ", "Sinh viên", "Nội dung phản hồi", "Ngày phản hồi" };
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

	PhanHoi obj = session.getAttribute("obj") != null ? (PhanHoi) session.getAttribute("obj")
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
									<label>Mã phản hồi <span class="text-danger">(*)</span></label> <input class="form-control"
										name="maPhanHoi"
										value="<%=(obj != null ? obj.getMaPhanHoi() : System.currentTimeMillis())%>"
										 readonly required="required">
								</div>
								<div class="form-group">
									<label>Phản hồi về dịch vụ<span class="text-danger">(*)</span></label> <select
										class="form-control" name="maDichVu"
										<%=(modeView ? "disable" : "")%> required="required">
										<%
										
											ObjectDAO dao_dichvu = new DAO_DichVu();
											ArrayList<DichVu> listDichVu = dao_dichvu.listAll();
											for (int i = 0; i < listDichVu.size(); i++) {
												DichVu dv = listDichVu.get(i);
												if (obj != null && obj.getDichVu() != null && obj.getDichVu().getMaDichVu().equals(dv.maDichVu)) {
										%>
										<option value="<%=dv.maDichVu%>" selected="selected"><%=dv.tenDichVu %></option>
										<%
											} else {
										%>
										<option value="<%=dv.maDichVu%>"><%=dv.tenDichVu %></option>
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
									<label>Ngày phản hồi <span class="text-danger">(*)</span></label>
									<input type="date" class="form-control"
										name="s_ngayPhanHoi"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getNgayPhanHoi())
					: Util_Date.dateToString(new Date())) %>"
										disabled required="required">
								</div>
							</div>
						</div>
					</div>


				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="form-group">
							<label>Nội dung phản hồi</label>
							<textarea class="form-control" cols="80" id="editor1" rows="5"
								name="noiDungPhanHoi" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getNoiDungPhanHoi() != null ? obj.getNoiDungPhanHoi() : "")%></textarea>
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
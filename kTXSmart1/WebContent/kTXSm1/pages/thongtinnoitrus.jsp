<%@page import="kTXCore.util.Util_Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="kTXSm1.modelDao.DAO_DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXSm1.model.DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXSm1.modelDao.DAO_ThongTinNoiTru"%>
<%@page import="kTXSm1.model.ThongTinNoiTru"%>
<%@page import="kTXCore.model.SinhVien"%>
<%@page import="kTXCore.modelDao.DAO_TaiKhoanSinhVien"%>
<%@page import="kTXCore.model.TaiKhoanSinhVien"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String tenLop = "ThongTinNoiTru";
String tenTrang = "Thông tin nội trú";
String[] tk_value = { "maThongTinNoiTru", "sinhVien", "phong", "dotKeKhaiThongTinNoiTru", "ngayDangKy",
		"ngayKeKhaiThongTin" };
String[] tk_show = { "Mã thông tin nội trú", "Sinh viên", "Phòng", "Đợt kê khai thông tin nội trú",
		"Ngày đăng ký cư trú", "Ngày kê khai thông tin" };
%>

<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	//kiểm tra xem tài khoản đang đăng nhập là của sinh viên hay không
	String maDangNhap = session.getAttribute("maDangNhap") != null
			? session.getAttribute("maDangNhap").toString()
			: "";
	TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taiKhoanDangNhap");
	SinhVien sinhVien = null;
	if (taiKhoan != null && taiKhoan instanceof TaiKhoanSinhVien) {
		TaiKhoanSinhVien tk1 = (TaiKhoanSinhVien) taiKhoan;
		sinhVien = tk1.getSinhVien();
	}

	ObjectDAO<ThongTinNoiTru> dao = new DAO_ThongTinNoiTru();

	ArrayList<ThongTinNoiTru> list = new ArrayList<ThongTinNoiTru>();

	String maDot = request.getParameter("maDot");
	maDot = (maDot == null || maDot.equals("null")) ? "all" : maDot;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof ThongTinNoiTru) {
				list = (ArrayList<ThongTinNoiTru>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
				if (sinhVien != null)
					list = dao.listByColumns("sinhVien", sinhVien.getMaSinhVien());
			}
		} else
			list = new ArrayList<ThongTinNoiTru>();
	} else {
		if (!maDot.equals("all"))
			list = dao.pagination("dotKeKhaiThongTinNoiTru = '" + maDot + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
		else
			list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
		if (sinhVien != null)
			list = dao.listByColumns("sinhVien", sinhVien.getMaSinhVien());
	}
%>
<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			<p style="color: red; display: inline;"><%=msg%></p>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<%@ include file="../../kTXPartial/panel-heading.jsp"%>
		<div class="panel-body">
			<div id="danhchonguoiquanly">
				<form class="form-inline pull-left">
					<label>Chọn đợt kê khai</label> <select
						name="maDotKeKhaiThongTinNoiTru" class="form-control" id="maDot"
						onchange="myFunction()">
						<%
							ObjectDAO<DotKeKhaiThongTinNoiTru> dao_DotKeKhaiThongTinNoiTru = new DAO_DotKeKhaiThongTinNoiTru();
							ArrayList<DotKeKhaiThongTinNoiTru> list_DotKeKhaiThongTinNoiTru = dao_DotKeKhaiThongTinNoiTru.listAll();
						%>
						<option value="all" <%if (maDot.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (DotKeKhaiThongTinNoiTru dotKeKhaiThongTinNoiTru : list_DotKeKhaiThongTinNoiTru) {
						%>
						<option
							value="<%=dotKeKhaiThongTinNoiTru.getMaDotKeKhaiThongTinNoiTru() %>"
							<%if (maDot.equals(dotKeKhaiThongTinNoiTru.getMaDotKeKhaiThongTinNoiTru())) {%>
							selected="selected" <%}%>><%=dotKeKhaiThongTinNoiTru.getTenDotKeKhaiThongTinNoiTru() %></option>
						<%
							}
						%>
					</select>
					<script type="text/javascript">
						function myFunction() {
							var maDot = document.getElementById("maDot").value;
							var recordPerPage = document
									.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&maDot=" + maDot
									+ "&recordPerPage=" + recordPerPage;

						}
					</script>
				</form>
				<form class="form-inline pull-right"
					action="exportThongTinNoiTru.action">
					<input hidden=""
						value="<%=request.getParameter("maDot") != null ? request.getParameter("maDot") : ""%>"
						name="maDotKeKhaiThongTinNoiTru">
					<button type="submit" class="form-control btn btn-success" value="">
						<img alt="" src="content/images/excel-32.png" width="16px"
							height="16px"> Xuất danh sách excel
					</button>
				</form>
			</div>
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã thông tin nội trú</th>
						<th>Sinh viên</th>
						<th>Phòng</th>
						<th>Đợt kê khai</th>
						<th>Ngày đăng ký cư trú</th>
						<th>Ngày kê khai</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ThongTinNoiTru obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaThongTinNoiTru();
							String tenDoiTuong = obj.getMaThongTinNoiTru();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaThongTinNoiTru() %></td>
						<td><%=obj.getSinhVien() != null ? obj.getSinhVien().getMaSinhVien()  : ""%></td>
						<td><%=obj.getPhong() != null ? obj.getPhong().getMaPhong() : "" %></td>
						<td><%=obj.getDotKeKhaiThongTinNoiTru().getTenDotKeKhaiThongTinNoiTru() %></td>
						<td><%=Util_Date.dateToString2(obj.getNgayDangKy()) %></td>
						<td><%=Util_Date.dateToString2(obj.getNgayKeKhaiThongTin()) %></td>
						<td style="text-align: center;"><%@ include
								file="../../kTXPartial/menupullcuadoituong.jsp"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- /.table-responsive -->
			<!-- Phan trang -->
			<%@ include file="../../kTXPartial/phantrang.jsp"%>
			<!-- ket thuc phan trang -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- Modal Tìm kiếm-->
<%@ include file="../../kTXPartial/timkiemModel.jsp"%>


<%-- <%
	if (sinhVien != null) {
%>
<script>
	document.getElementById("nutNhapLieuExcel").style.display = "none";
	document.getElementById("nutThemMoi").style.display = "none";
	document.getElementById("danhchonguoiquanly").style.display = "none";
</script>
<%
	} else {
%>
<script>
	document.getElementById("nutNhapLieuExcel").style.display = "none";
	document.getElementById("nutThemMoi").style.display = "none";
</script>
<%
	}
%> --%>

<%
	session.removeAttribute("msg");
%>
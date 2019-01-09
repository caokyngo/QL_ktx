<%@page import="kTXSm3.modelDao.DAO_DichVu"%>
<%@page import="kTXSm3.model.DichVu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "DichVu";
	String tenTrang = "Quản lý dịch vụ";
	String[] tk_value = {"maDichVu", "nhanVien", "tenDichVu", "ngayTao"};
	String[] tk_show = {"Mã dịch vụ", "Nhân viên", "Tên dịch vụ", "Ngày tạo"};
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	ObjectDAO<DichVu> dao = new DAO_DichVu();
	ArrayList<DichVu> list = new ArrayList<DichVu>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof DichVu) {
				list = (ArrayList<DichVu>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<DichVu>();
	} else {
		list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
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
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã dịch vụ</th>
						<th>Nhân viên</th>
						<th>Tên dịch vụ</th>
						<th>Ngày tạo</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (DichVu obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaDichVu();
							String tenDoiTuong = obj.getTenDichVu();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaDichVu() %></td>
						<td><%=obj.getNhanVien().getTenNhanVien() != null ? obj.getNhanVien().getTenNhanVien() : ""%></td>
						<td><%=obj.getTenDichVu() != null ? obj.getTenDichVu() : ""%></td>
						<td><%=obj.getNgayTao() != null ? obj.getNgayTao() : ""%></td>


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
	</div>
</div>

<script>
	document.getElementById("nutNhapLieuExcel").style.display = "none";
	//document.getElementById("nutTimKiem").style.display = "none";
	// 	document.getElementById("nutThemMoi").style.display = "none";
	//document.getElementById("danhchonguoiquanly").style.display = "none";
</script>
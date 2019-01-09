<%@page import="kTXSm2.modelDao.DAO_NhaCungCap"%>
<%@page import="kTXSm2.model.NhaCungCap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "NhaCungCap";
	String tenTrang = "Quản lý Nhà cung cấp";
	String[] tk_value = { "maNhaCungCap", "tenNhaCungCap", "soDienThoai", "diaChi", "email", "quocGia" };
	String[] tk_show = { "Mã nhà cung cấp", "Tên nhà cung cấp", "Số điện thoại", "Địa chỉ", "Email",
			"Quốc gia" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	ObjectDAO<NhaCungCap> dao = new DAO_NhaCungCap();
	ArrayList<NhaCungCap> list = new ArrayList<NhaCungCap>();
	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof NhaCungCap) {
				list = (ArrayList<NhaCungCap>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<NhaCungCap>();
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
						<th>Mã nhà cung cấp</th>
						<th>Tên nhà cung cấp</th>
						<th>Số điện thoại</th>
						<th>Địa chỉ</th>
						<th>Email</th>
						<th>Quốc gia</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (NhaCungCap obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaNhaCungCap();
							String tenDoiTuong = obj.getTenNhaCungCap();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaNhaCungCap() %></td>
						<td><%=obj.getTenNhaCungCap()%></td>
						<td><%=obj.getSoDienThoai()%></td>
						<td><%=obj.getDiaChi()%></td>
						<td><%=obj.getEmail()%></td>
						<td><%=obj.getQuocGia() %></td>
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

<script type="text/javascript">
	document.getElementById("nutNhapLieuExcel").style.display = "none";
</script>
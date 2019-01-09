<%@page import="kTXSm1.model.Phong"%>
<%@page import="kTXSm1.modelDao.DAO_Phong"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array" %>
<%@page import="kTXCore.modelDao.DAO_Lop"%>
<%@page import="kTXCore.model.Lop"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "Phong";
	String tenTrang = "Quản lý phòng";
	String[] tk_value = { "maPhong", "tenPhong", "diaChi", "soGiuong", "soGiuongConTrong" };
	String[] tk_show = { "Mã phòng", "Tên phòng", "Địa chỉ", "Số giường", "Số giường còn trống" };
%>

<%@ include file="../../kTXPartial/code-header.jsp"%>

<%
ObjectDAO<Phong> dao = new DAO_Phong();
ArrayList<Phong> list = new ArrayList<Phong>();

if (session.getAttribute("checkTimKiem") != null) {
	ArrayList listTemp = (ArrayList) session.getAttribute("arr");
	if (listTemp.size() > 0) {
		if (listTemp.get(0) instanceof Phong) {
			list = (ArrayList<Phong>) listTemp;
		} else {
			session.setAttribute("checkTimKiem", null);
			list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
		}
	} else
		list = new ArrayList<Phong>();
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
						<th>Mã phòng</th>
						<th>Tên phòng</th>
						<th>Địa chỉ</th>
						<th>Số giường</th>
						<th>Số giường còn trống</th>
						
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (Phong obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaPhong();
							String tenDoiTuong = obj.getTenPhong();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaPhong() %></td>
						<td><%=obj.getTenPhong() != null ? obj.getTenPhong() : "" %></td>
						<td><%=obj.getDiaChi() != null ? obj.getDiaChi() : "" %></td>
						<td><%=obj.getSoGiuong() != null ? obj.getSoGiuong() : ""%></td>
						<td><%=obj.getSoGiuongConTrong() != null ? obj.getSoGiuongConTrong() : ""%></td>

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

<!-- Modal Tìm kiếm-->
<%@ include file="../../kTXPartial/timkiemModel.jsp"%>

<script type="text/javascript">
	document.getElementById("nutNhapLieuExcel").style.display = "none";
</script>

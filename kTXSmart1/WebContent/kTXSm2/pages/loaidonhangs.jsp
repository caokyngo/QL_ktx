<%@page import="kTXSm2.modelDao.DAO_LoaiDonHang"%>
<%@page import="kTXSm2.model.LoaiDonHang"%>
<%@page import="kTXCore.dao.ObjectDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "LoaiDonHang";
	String tenTrang = "Quản lý loại đơn hàng";
	String[] tk_value = { "maLoai", "tenLoaiDonHang", "ghiChu", "thoiGianCapNhat" };
	String[] tk_show = { "Mã Loại", "Tên loại đơn hàng", "Ghi chú", "Thời gian cập nhật" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	ObjectDAO<LoaiDonHang> dao = new DAO_LoaiDonHang();
	ArrayList<LoaiDonHang> list = new ArrayList<LoaiDonHang>();
	
	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof LoaiDonHang) {
				list = (ArrayList<LoaiDonHang>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<LoaiDonHang>();
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
						<th>Mã Loại đơn hàng</th>
						<th>Tên Loại đơn hàng</th>
						<th>Ghi chú</th>
						
						<th>Thời gian cập nhật</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (LoaiDonHang obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaLoai();
							String tenDoiTuong = obj.getTenLoaiDonHang();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaLoai() %></td>
						<td><%=obj.getTenLoaiDonHang() != null ? obj.getTenLoaiDonHang() : "" %></td>
						<td><%=obj.getGhiChu() != null ? obj.getGhiChu() : "" %></td>
						<td><%=obj.getThoiGianCapNhat() != null ? obj.getThoiGianCapNhat() : ""%></td>
						

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
	document.getElementById("nutTimKiem").style.display = "none";
// 	document.getElementById("nutThemMoi").style.display = "none";
	//document.getElementById("danhchonguoiquanly").style.display = "none";
</script>
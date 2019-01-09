<%@page import="java.util.ArrayList"%>
<%@page import="kTXSm2.modelDao.DAO_DonHang"%>
<%@page import="kTXSm2.model.DonHang"%>
<%@page import="kTXCore.dao.ObjectDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "DonHang";
	String tenTrang = "Quản lý đơn hàng";
	String[] tk_value = { "maDonHang", "sinhVien", "nhanVien",  "tinhTrangDonHang" };
	String[] tk_show = { "Mã đơn hàng", "Sinh viên", "Nhân viên",  "Tình trạng đơn hàng" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	ObjectDAO<DonHang> dao = new DAO_DonHang();
	ArrayList<DonHang> list = new ArrayList<DonHang>();
	
	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof DonHang) {
				list = (ArrayList<DonHang>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<DonHang>();
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
						<th>Mã đơn hàng</th>
						<th>Sinh viên</th>
						<th>Nhân viên</th>
						
						<th>Tình trạng đơn hàng</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (DonHang obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaDonHang();
							String tenDoiTuong = obj.getMaDonHang();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaDonHang() %></td>
						<td><%=obj.getSinhVien() != null ? obj.getSinhVien() : "" %></td>
						<td><%=obj.getNhanVien() != null ? obj.getNhanVien() : "" %></td>
						
						<td><%=obj.getTinhTrangDonHang() != null ? obj.getTinhTrangDonHang() : "" %></td>
						
						

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
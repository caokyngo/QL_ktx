<%@page import="kTXSm2.model.KhuyenMai"%>
<%@page import="kTXSm2.modelDao.DAO_KhuyenMai"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "KhuyenMai";
	String tenTrang = "Quản lý chương trình khuyến mãi";
	String[] tk_value = { "maKhuyenMai", "tenKhuyenMai", "thoiGianBatDau", "thoiGianKetThuc","mucKhuyenMai" };
	String[] tk_show = { "Mã khuyến mãi", "Tên khuyến mãi", "thời gian bắt đầu", "Thời gian kết thúc", "Mức khuyến mãi" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	ObjectDAO<KhuyenMai> dao = new DAO_KhuyenMai();
	ArrayList<KhuyenMai> list = new ArrayList<KhuyenMai>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof KhuyenMai) {
				list = (ArrayList<KhuyenMai>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<KhuyenMai>();
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
						<th>Mã khuyến mãi</th>
						<th>Tên khuyến mãi</th>
						<th>Thời gian bắt đầu</th>
						<th>Thời gian kết thúc</th>
						<th>Mức khuyến mãi</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (KhuyenMai obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaKhuyenMai();
							String tenDoiTuong = obj.getTenKhuyenMai();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaKhuyenMai() %></td>
						<td><%=obj.getTenKhuyenMai() != null ? obj.getTenKhuyenMai() : "" %></td>
						<td><%=obj.getThoiGianBatDau() !=null ? obj.getThoiGianBatDau() : "" %></td>
						<td><%=obj.getThoiGianKetThuc() != null ? obj.getThoiGianKetThuc() : "" %></td>
						<td><%=obj.getMucKhuyenMai() != null ? obj.getMucKhuyenMai() : "" %></td>
						
						

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

<%@page import="kTXCore.model.SinhVien"%>
<%@page import="kTXCore.model.NhanVien"%>
<%@page import="kTXSm2.modelDao.DAO_TinhTrangDonHang"%>
<%@page import="kTXSm2.model.TinhTrangDonHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "TinhTrangDonHang";
	String tenTrang = "Quản lý tình trạng đơn hàng";
	String[] tk_value = { "maTinhTrangDonHang", "tenTinhTrangDonHang", "ghiChu", "thoiGianCapNhat" };
	String[] tk_show = { "Mã tình trạng đơn hàng", "Tên tình trạng đơn hàng", "Ghi chú", "Thời gian cập nhật" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
ObjectDAO<TinhTrangDonHang> dao = new DAO_TinhTrangDonHang();
ArrayList<TinhTrangDonHang> list = new ArrayList<TinhTrangDonHang>();

if (session.getAttribute("checkTimKiem") != null) {
	ArrayList listTemp = (ArrayList) session.getAttribute("arr");
	if (listTemp.size() > 0) {
		if (listTemp.get(0) instanceof TinhTrangDonHang) {
			list = (ArrayList<TinhTrangDonHang>) listTemp;
		} else {
			session.setAttribute("checkTimKiem", null);
			list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
		}
	} else
		list = new ArrayList<TinhTrangDonHang>();
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
						<th>Mã tình trạng đơn hàng</th>
						<th>Tên tình trạng đơn hàng</th>
						<th>Ghi chú</th>
						
						<th>Thời gian cập nhật</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (TinhTrangDonHang obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaTinhTrangDonHang();
							String tenDoiTuong = obj.getTenTinhTrangDonHang();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaTinhTrangDonHang() %></td>
						<td><%=obj.getTenTinhTrangDonHang() != null ? obj.getTenTinhTrangDonHang() : "" %></td>
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



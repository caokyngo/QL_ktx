<%@page import="kTXCore.util.Util_Date"%>
<%@page import="kTXSm4.modelDao.DAO_PhanHoi"%>
<%@page import="kTXSm4.model.PhanHoi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tenLop = "PhanHoi";
	String tenTrang = "Quản lý phản hồi";
	String[] tk_value = { "maPhanHoi", "dichVu", "sinhVien", "noiDungPhanHoi", "ngayPhanHoi" };
	String[] tk_show = { "Mã phản hồi", "Dịch vụ", "Sinh viên", "Nội dung phản hồi", "Ngày phản hồi" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
ObjectDAO<PhanHoi> dao = new DAO_PhanHoi();
ArrayList<PhanHoi> list = new ArrayList<PhanHoi>();

if (session.getAttribute("checkTimKiem") != null) {
	ArrayList listTemp = (ArrayList) session.getAttribute("arr");
	if (listTemp.size() > 0) {
		if (listTemp.get(0) instanceof PhanHoi) {
			list = (ArrayList<PhanHoi>) listTemp;
		} else {
			session.setAttribute("checkTimKiem", null);
			list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
		}
	} else
		list = new ArrayList<PhanHoi>();
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
						<th>Mã phản hồi</th>
						<th>Dịch vụ</th>
						<th>Sinh viên</th>
						<th>Nội dung phản hồi</th>
						<th>Ngày phản hồi</th>
						
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (PhanHoi obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaPhanHoi();
							String tenDoiTuong = obj.getMaPhanHoi();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaPhanHoi() %></td>
						<td><%=obj.getDichVu() != null ? obj.getDichVu().getTenDichVu() : "" %></td>
						<td><%=obj.getSinhVien() != null ? obj.getSinhVien().getHoDem()+""+ obj.getSinhVien().getTen() : "" %></td>
						<td><%=obj.getNoiDungPhanHoi() != null ? obj.getNoiDungPhanHoi() : ""%></td>
						<td><%=Util_Date.dateToString2(obj.getNgayPhanHoi()) %></td>

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
<%@page import="kTXSm1.modelDao.DAO_DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXSm1.model.DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXCore.util.Util_Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String tenLop = "DotKeKhaiThongTinNoiTru";
	String tenTrang = "Quản lý đợt kê khai thông tin nội trú";
	String trangDanhSach = "index.jsp?p=kTXSm1/pages/dotkekhaithongtinnoitrus.jsp";
	String[] tk_value = { "maDotKeKhaiThongTinNoiTru", "tenDotKeKhaiThongTinNoiTru", "ngayBatDau",
			"ngayKetThuc" };
	String[] tk_show = { "Mã đợt kê khai thông tin nội trú", "Tên đợt kê khai thông tin nội trú",
			"Ngày bắt đầu", "Ngày kết thúc" };
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	ObjectDAO<DotKeKhaiThongTinNoiTru> dao = new DAO_DotKeKhaiThongTinNoiTru();

	ArrayList<DotKeKhaiThongTinNoiTru> list = new ArrayList<DotKeKhaiThongTinNoiTru>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof DotKeKhaiThongTinNoiTru) {
				list = (ArrayList<DotKeKhaiThongTinNoiTru>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<DotKeKhaiThongTinNoiTru>();
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
						<th>Mã đợt kê khai</th>
						<th>Tên đợt kê khai</th>
						<th>Ngày bắt đầu</th>
						<th>Ngày kết thúc</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (DotKeKhaiThongTinNoiTru obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaDotKeKhaiThongTinNoiTru();
							String tenDoiTuong = obj.getTenDotKeKhaiThongTinNoiTru();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaDotKeKhaiThongTinNoiTru()%></td>
						<td><%=obj.getTenDotKeKhaiThongTinNoiTru()%></td>
						<td><%=Util_Date.dateToString2(obj.getNgayBatDau())%></td>
						<td><%=Util_Date.dateToString2(obj.getNgayKetThuc())%></td>
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
<div></div>
<!-- /.row -->

<!-- Modal Tìm kiếm-->
<%@ include file="../../kTXPartial/timkiemModel.jsp"%>




<script type="text/javascript">
	document.getElementById("nutNhapLieuExcel").style.display = "none";
</script>

<%session.removeAttribute("msg"); %>
<%@page import="kTXSm2.modelDao.DAO_NhaCungCap"%>
<%@page import="kTXSm2.model.NhaCungCap"%>
<%@page import="kTXSm3.modelDao.DAO_DichVu"%>
<%@page import="kTXSm3.model.DichVu"%>
<%@page import="kTXSm2.modelDao.DAO_MatHang"%>
<%@page import="kTXSm2.model.MatHang"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "MatHang";
	String tenTrang = "Quản lý Mặt Hàng";
	String[] tk_value = {"maMatHang", "tenMatHang", "khuyeMai", "nhaCungCap", "dichVu", "soLuongTon", "soDiemDoi"};
	String[] tk_show = {"Mã mặt hàng", "Tên mặt hàng", "Khuyến mãi", "Nhà cung cấp", "Dịch vụ", "Số lượng trong kho",
			"Số điểm quy đổi"};
%>
<%@ include file="../../kTXPartial/code-header.jsp"%>
<%
	ObjectDAO<MatHang> dao = new DAO_MatHang();
	ArrayList<MatHang> list = new ArrayList<MatHang>();
	String maDichVu = request.getParameter("maDichVu");
	maDichVu = (maDichVu == null || maDichVu.equals("null") || maDichVu.equals("")) ? "all" : maDichVu;

	String maNhaCungCap = request.getParameter("maNhaCungCap");
	maNhaCungCap = (maNhaCungCap == null || maNhaCungCap.equals("null") || maNhaCungCap.equals(""))
			? "all"
			: maNhaCungCap;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof MatHang) {
				list = (ArrayList<MatHang>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<MatHang>();
	} else {
		if (!maDichVu.equals("all") && !maNhaCungCap.equals("all"))
			list = dao.pagination("dichVu = '" + maDichVu + "' and nhaCungCap = '" + maNhaCungCap + "'",
					(long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);

		if (maDichVu.equals("all") && !maNhaCungCap.equals("all"))
			list = dao.pagination("maNhaCungCap = '" + maNhaCungCap + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);

		if (!maDichVu.equals("all") && maNhaCungCap.equals("all"))
			list = dao.pagination("dichVu = '" + maDichVu + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);

		if (maDichVu.equals("all") && maNhaCungCap.equals("all"))
			list = dao.pagination("1=1 order by dichVu desc", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
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
			<div id="danhchonguoiquanly">
				<form class="form-inline pull-left">
					<label>Chọn loại dịch vụ</label> <select name="maDichVu"
						class="form-control" id="maDichVu" onchange="myFunction()">
						<%
							ObjectDAO<DichVu> dao_DichVu = new DAO_DichVu();
							ArrayList<DichVu> list_DichVu = dao_DichVu.listAll();
						%>
						<option value="all" <%if (maDichVu.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>
						<%
							for (DichVu dichVu : list_DichVu) {
						%>
						<option value="<%=dichVu.getMaDichVu()%>"
							<%if (maDichVu.equals(dichVu.getMaDichVu())) {%>
							selected="selected" <%}%>><%=dichVu.getTenDichVu()%></option>
						<%
							}
						%>
					</select>
					<%-- <label>Chọn nhà cung cấp</label> <select name="nhaCungCap" class="form-control"
						id="nhaCungCap" onchange="myFunction()">
						<%
							ObjectDAO<NhaCungCap> dao_NhaCungCap = new DAO_NhaCungCap();
							ArrayList<NhaCungCap> list_NhaCungCap = dao_NhaCungCap.listAll();
						%>
						<option value="all" <%if (maNhaCungCap.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>
						<%
							for (NhaCungCap nhaCungCap : list_NhaCungCap) {
						%>
						<option value="<%=nhaCungCap.getMaNhaCungCap()%>"
							<%if (maNhaCungCap.equals(nhaCungCap.getMaNhaCungCap())) {%>
							selected="selected" <%}%>><%=nhaCungCap.getTenNhaCungCap()%></option>
						<%
							}
						%> --%>
					<script type="text/javascript">
						function myFunction() {
							var maDichVu = document.getElementById("maDichVu").value;
							var maNhaCungCap = document.getElementById("maNhaCungCap").value;
							var recordPerPage = document
									.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&maDichVu=" + maDichVu
									+ "&maNhaCungCap" + maNhaCungCap + "&recordPerPage=" + recordPerPage;

						}
					</script>

				</form>
			</div>
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã mặt hàng</th>
						<th>Tên mặt hàng</th>
						<th>Tên dịch vụ</th>
						<th>Giá bán</th>
						<th>Khuyến mãi</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (MatHang obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaMatHang();
							String tenDoiTuong = obj.getTenMatHang();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaMatHang()%></td>
						<td><%=obj.getTenMatHang() != null ? obj.getTenMatHang() : ""%></td>
						<td><%=obj.getDichVu() != null ? obj.getDichVu().getTenDichVu() : ""%></td>
						<td><%=obj.getGiaBan() != null ? obj.getGiaBan() : ""%></td>
						<td><%=obj.getKhuyenMai() != null ? obj.getKhuyenMai().getTenKhuyenMai() : ""%></td>


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
</div>
<!-- Modal Tìm kiếm-->
<%@ include file="../../kTXPartial/timkiemModel.jsp"%>
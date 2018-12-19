<%@page import="kTXSm3.modelDao.DAO_DichVu"%>
<%@page import="kTXSm3.model.DichVu"%>
<%@page import="kTXSm2.model.MatHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kTXSm2.modelDao.DAO_MatHang"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "MatHang";
	String tenTrang = "Danh sách mặt hàng";
	String[] tk_value = {"maMatHang", "tenMatHang", "khuyeMai", "nhaCungCap", "soLuongTon", "soDiemDoi"};
	String[] tk_show = {"Mã mặt hàng", "Tên mặt hàng", "Khuyến mãi", "Nhà cung cấp", "Số lượng trong kho",
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
<div class="row">
	<div class="col-lg-12">
		<%@ include file="../../kTXPartial/panel-heading.jsp"%>
		<div class="panel-body">
			<form class="form-inline pull-left" action="">
				<label>Danh mục dịch vụ</label> <select name="maDichVu"
					class="form-control" id="maDichVu" onchange="myFunction()">
					<%
						ObjectDAO<DichVu> dao_DichVu = new DAO_DichVu();
						ArrayList<DichVu> list_DichVu = dao_DichVu.listAll();
					%>
					<option value="all" <%if (maDichVu.equals("all")) {%>
						selected="selected" <%}%>>Tất cả</option>
					<%
						for (DichVu dv : list_DichVu) {
					%>

					<option value="<%=dv.getMaDichVu()%>"
						<%if (maDichVu.equals(dv.getMaDichVu())) {%> selected="selected"
						<%}%>><%=dv.getTenDichVu()%></option>
					<%
						}
					%>
				</select>
				<script type="text/javascript">
					function myFunction() {
						var maDichVu = document.getElementById("maDichVu").value;

						var recordPerPage = document
								.getElementById("recordPerPage").value;
						var p1 = document.getElementById("p1").value;
						window.location.href = p1 + "&maDichVu=" + maDichVu
								+ "&recordPerPage=" + recordPerPage;

					}
				</script>
			</form>
			<form class="form-inline pull-right"
				action="exportThongTinNoiTru.action">
				<input hidden=""
					value='<%=request.getParameter("maDichVu") != null ? request.getParameter("maDichVu") : ""%>'
					name="maDichVu">

			</form>
		</div>





		<%
			for (MatHang mh : list) {
				String maDoiTuong = mh.getMaMatHang();
				String tenDoiTuong = mh.getTenMatHang();
		%>
		<div class="col-md-3 md-col">
			<div class="col-md">
				<a href="#"><img height="300px" width="150px"
					src='<%="kTXSm2/images/sanphams/" + mh.getAnhMoTa()%>'
					alt="<%=mh.getTenMatHang()%>" /></a>
				<div class="top-content">
					<h5>
						<a href="xemChiTiet<%=tenLop%>.action?maobj=<%=maDoiTuong%>"><%=mh.getTenMatHang()%></a>
					</h5>
					<div class="white">
						<a href="themMoiDonHang.action"
							class="button">Mua
							ngay</a>
						<p class="dollar">
							<span class="in-dollar">$</span><span><%=mh.getGiaSauKhuyenMai()%></span>
						</p>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>
		</div>
		<%
			}
		%>

	</div>

</div>
<%@ include file="../../kTXPartial/phantrang.jsp"%>
<%@ include file="../../kTXPartial/timkiemModelDV.jsp"%>
<script type="text/javascript">
	document.getElementById("nutNhapLieuExcel").style.display = "none";
	document.getElementById("nutThemMoi").style.display = "none";
</script>









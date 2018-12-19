<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="kTXSm2.model.MatHang"%>
<%@page import="kTXSm2.modelDao.DAO_MatHang"%>
<%@page import="java.util.function.ObjDoubleConsumer"%>
<%@page import="kTXSm3.model.DichVu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kTXSm3.modelDao.DAO_DichVu"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>kTXSmart</title>
<link rel="shortcut icon" href="favicon.ico">
<!-- Bootstrap Core CSS -->
<link href="content/css_scripts/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="content/css_scripts/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="content/css_scripts/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="content/css_scripts/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="content/css_scripts/bootstrap/css/sb-admin-2.css"
	rel="stylesheet">

<link
	href="content/css_scripts/bootstrap/css/sbadmin2-sidebar-toggle.css"
	rel="stylesheet" type="text/css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style type="text/css">
.block {
	display: block;
	width: 100%;
	border: none;
	background-color: #4CAF50;
	color: white;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
}

.block:hover {
	background-color: #ddd;
	color: black;
}
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<%
	// Kiểm tra đã đăng nhập
	// Nếu chưa đăng nhập => chuyển login.jsp
	String maDangNhap = session.getAttribute("maDangNhap") + "";
	if (maDangNhap.equals("null")) {
		response.sendRedirect("login.jsp");
	}
%>

<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header" style="background-color: #e60000">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp" style="color: white">
				&nbsp; <img src="content/images/logo.png"
				style="display: inline-block;" width="30px" height="30px" alt="" />
				<span style="display: inline-block;"> UTC2 Smart 1.0 </span>
			</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse"
			style="background: url('content/images/bgTH2.png')'">
			<ul class="nav  navbar-nav navbar-dark bg-primary text-white">

				<%=session.getAttribute("chucNangs")%>

				<li class="dropdown"><a class="dropdown-toggle"
					style="color: white;" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false" href="index.jsp?p="><i
						class="fa fa-user"></i> <span class="masked"> Tài khoản</span></a>
					<ul class="dropdown-menu">
						<li><a href="index.jsp?p=kTXCore/pages/doimatkhau.jsp"><i
								class="glyphicon glyphicon-refresh"></i> &nbsp;&nbsp;Đổi mật
								khẩu </a></li>
						<li><a href="dangXuat.action"><i class="fa fa-sign-out"></i>
								&nbsp;&nbsp;Đăng xuất </a></li>
					</ul></li>
				
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>

	<div class="container" style="padding: 10px; padding-top: 100px;">
		<div class="starter-template"
			style="padding: 10px; background: white;">
			<%
				String p = request.getParameter("p") + "";
				if (p.equals("null")) {
					p = session.getAttribute("p") + "";
				} else {
					session.setAttribute("p", p);
				}
				if (p != null && !p.equals("null")) {
					if (!p.startsWith("http://")) {
			%>
			<jsp:include page="<%=p%>"></jsp:include>
			<%
				} else {
			%>
			<iframe src="<%=p%>" width="100%" height="600px"></iframe>
			<%
				}
				}
			%>
		</div>
	</div>
	<div class="footer">
		<div class="container">
			<p class="text-muted">Sinh viên thực hiện: Ngô Cao Kỳ</p>
		</div>
	</div>
	<!-- /#page-wrapper -->

	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="content/css_scripts/jquery/jquery.min.js"
		type="text/javascript"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="content/css_scripts/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="content/css_scripts/metisMenu/metisMenu.min.js"
		type="text/javascript"></script>

	<!-- Custom Theme JavaScript -->
	<script src="content/css_scripts/bootstrap/js/sb-admin-2.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#menu-toggle").click(
							function(e) {
								e.preventDefault();

								$("#wrapper").toggleClass("toggled");

								$('#wrapper.toggled').find("#sidebar-wrapper")
										.find(".collapse").collapse('hide');

							});
				});
	</script>

	<!-- DataTables JavaScript -->
	<script
		src="content/css_scripts/datatables/js/jquery.dataTables.min.js"
		type="text/javascript"></script>
	<script
		src="content/css_scripts/datatables-plugins/dataTables.bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="content/css_scripts/datatables-responsive/dataTables.responsive.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true,
				searching : false,
				info : false,
				paging : false,
				sorting : false,
				language : {
					searchPlaceholder : "Nhập từ khóa",
					zeroRecords : "Không có dữ liệu trong bảng",
					decimal : "",
					emptyTable : "Không có dữ liệu trong bảng",
					infoEmpty : "Hiển thị từ mục 0 đến 0 của 0 mục",
					infoFiltered : "(filtered from _MAX_ total entries)",
					infoPostFix : "",
					thousands : ",",
					lengthMenu : "Hiển thị _MENU_ mục",
					loadingRecords : "Đang tải...",
					processing : "Đang xử lý...",
					paginate : {
						first : "Trang đầu",
						last : "Trang cuối",
						next : "Tiếp theo",
						previous : "Quay lại"
					},
					aria : {
						sortAscending : "sắp xếp cột tăng dần",
						sortDescending : "sắp xếp cột giảm dần"
					}
				},

			});
		});
	</script>
	<%-- 		<ckeditor:replaceAll basePath="content/ckeditor/" /> --%>
</body>

</html>

<%@page import="kTXSm1.model.ThongTinNoiTru"%>
<%@page import="kTXSm1.modelDao.DAO_ThongTinNoiTru"%>
<%@page import="kTXSm1.modelDao.DAO_DotKeKhaiThongTinNoiTru"%>
<%@page import="kTXSm1.model.DotKeKhaiThongTinNoiTru"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kTXCore.modelDao.DAO_SinhVien"%>
<%@page import="kTXCore.model.SinhVien"%>
<%@page import="kTXCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ObjectDAO<SinhVien> dao_SinhVien = new DAO_SinhVien();
	ArrayList<SinhVien> list_SinhVien = dao_SinhVien.listAll();
	int soSinhVien = list_SinhVien.size();
%>

<%
	// lay ra nam da chon
	String namHoc = request.getParameter("namHoc"); // 2017-2018

	String[] arr = namHoc.split("-");
	int namBatDau = Integer.parseInt(arr[0]);
	int namKetThuc = Integer.parseInt(arr[1]);
	ObjectDAO<DotKeKhaiThongTinNoiTru> obj_DotKeKhaiThongTinNoiTru = new DAO_DotKeKhaiThongTinNoiTru();
	ArrayList<DotKeKhaiThongTinNoiTru> ls_DotKeKhaiThongTinNoiTru = obj_DotKeKhaiThongTinNoiTru.listAll();
	// lay ra dot dang ky co thoi gian bat dau tuong ung voi nam hoc da chon
	ls_DotKeKhaiThongTinNoiTru = obj_DotKeKhaiThongTinNoiTru
			.listByQuery("FROM DotKeKhaiThongTinNoiTru WHERE ngayBatDau > '" + namBatDau
					+ "-9-1' AND ngayBatDau < '" + namKetThuc + "-9-1'");
	System.out.println("ls_DotDangKyNoiTru = " + ls_DotKeKhaiThongTinNoiTru);
	String maDotKeKhaiThongTinNoiTru = "";

	ObjectDAO obj2 = new DAO_ThongTinNoiTru();
	ArrayList<ThongTinNoiTru> ls2 = new ArrayList<ThongTinNoiTru>();
	ArrayList<ThongTinNoiTru> ls_SinhVienNoiTru = new ArrayList<ThongTinNoiTru>();
	for (int i = 0; i < ls_DotKeKhaiThongTinNoiTru.size(); i++) {
		maDotKeKhaiThongTinNoiTru = ls_DotKeKhaiThongTinNoiTru.get(i).getMaDotKeKhaiThongTinNoiTru();
		// lay ra danh sach sinh vien ngoai tru theo nam hoc da chon o tren
		ls2 = obj2.listByColumns("dotKeKhaiThongTinNoiTru", maDotKeKhaiThongTinNoiTru);
		ls_SinhVienNoiTru.addAll(ls2);
	}

	
%>

<table border=0 cellspacing=0 cellpadding=0 width="100%"
	style='width: 100.0%; border-collapse: collapse'>
	<!--VABWAFAATABfADIAMAAxADcAMAAyADIAMwA=-->
	<tr>
		<td width="37%" valign=top
			style='width: 37.8%; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p style='margin-bottom: 6.0pt'>
				<b>ĐƠN VỊ:</b> ………………………
			</p>
		</td>
		<td width="62%" valign=top
			style='width: 62.2%; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>
				<b><span lang=NL>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br>
						Độc lập - Tự do - Hạnh phúc<br> -----------
				</span></b>
			</p>
		</td>
	</tr>
	<tr>
		<td width="37%" valign=top
			style='width: 37.8%; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>&nbsp;</p>
		</td>
		<td width="62%" valign=top
			style='width: 62.2%; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=right style='margin-bottom: 6.0pt; text-align: right'>
				<i>&nbsp;</i>
			</p>
		</td>
	</tr>
</table>

<p style='margin-bottom: 6.0pt'>
	<span style='font-size: 8.0pt'>&nbsp;</span>
</p>

<p align=center style='margin-bottom: 6.0pt; text-align: center'>Kính
	gửi: …………………………………………………………………………………..</p>

<p align=center style='margin-bottom: 6.0pt; text-align: center'>
	<b>BÁO CÁO CÔNG TÁC HỌC SINH, SINH VIÊN NỘI TRÚ NĂM HỌC <%=namHoc%></b>
</p>

<p align=center style='margin-bottom: 6.0pt; text-align: center'>
	<b>&nbsp;</b>
</p>

<table border=1 cellspacing=0 cellpadding=0 width="100%"
	style='width: 100.0%; border-collapse: collapse; border: none'>
	<tr>
		<td width="3%" rowspan=2
			style='width: 3.5%; border: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>
				<b>TT</b>
			</p>
		</td>
		<td width="19%" rowspan=2
			style='width: 19.1%; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>
				<b>Trình độ đào tạo</b>
			</p>
		</td>
		<td width="6%" rowspan=2
			style='width: 6.76%; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>
				<b>Tổng số HSSV toàn trường</b>
			</p>
		</td>
		<td width="15%" colspan=2
			style='width: 15.7%; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>
				<b>HSSV nội trú</b>
			</p>
		</td>
		<td width="7%" rowspan=2
			style='width: 7.84%; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>
				<b>Số lần nhà trường đi kiểm tra nơi nội trú của HSSV</b>
			</p>
		</td>
		<td width="39%" colspan=5
			style='width: 39.24%; border: solid windowtext 1.0pt; border-left: none; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>
				<b>Số HSSV bị kỷ luật do vi phạm quy chế HSSV nội trú</b>
			</p>
		</td>
	</tr>
	<tr>
		<td width="7%"
			style='width: 7.84%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>Tổng
				số HSSV nội trú</p>
		</td>
	</tr>
	<tr>
		<td width="3%" valign=top
			style='width: 3.5%; border: solid windowtext 1.0pt; border-top: none; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p align=center style='margin-bottom: 6.0pt; text-align: center'>1</p>
		</td>
		<td width="19%" valign=top
			style='width: 19.1%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p style='margin-bottom: 6.0pt'>Đại học</p>
		</td>
		<td width="6%" valign=top
			style='width: 6.76%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p style='margin-bottom: 6.0pt'><%=soSinhVien%></p>
		</td>
		<td width="7%" valign=top
			style='width: 7.84%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p style='margin-bottom: 6.0pt'><%=ls_SinhVienNoiTru.size()%></p>
		</td>
		
		<td width="7%" valign=top
			style='width: 7.84%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p style='margin-bottom: 6.0pt'>&nbsp;</p>
		</td>
		<td width="7%" valign=top
			style='width: 7.84%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt'>
			<p style='margin-bottom: 6.0pt'>&nbsp;</p>
		</td>
		
	</tr>
</table>

<p style='margin-bottom: 6.0pt'>- Thành tích của trường trong công
	tác HSSV nội
	trú: .................................................................................................
</p>

<p style='margin-bottom: 6.0pt'>..........................................................................................................................................................................................
</p>

<p style='margin-bottom: 6.0pt'>- Đề xuất, kiến
	nghị:............................................................................................................................................................
</p>

<p style='margin-bottom: 6.0pt'>..........................................................................................................................................................................................
</p>


<%session.removeAttribute("msg"); %>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAVE:/</title>

<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>portfolio</li>
	<li><a href="../gallery/gallery.jsp">Gallery</a></li>
	<li><a href="../media/media.jsp">Media</a></li>
</ul>
</nav>


<%

	String id=(String)session.getAttribute("id");
	
	MemberDAO mdao=new MemberDAO();
	MemberBean mb=mdao.getMember(id);

%>

<!-- 게시판 -->
	<article id="w_article">
<!-- board/writeForm.jsp -->
		<div id="w_form">
		<h1>write</h1>
		<form action="writePro.jsp" method="post" enctype="multipart/form-data">
		
			<table border="1" class="w_table">
				<tr>
					<td>name</td>
					<td><input type="text" name="name" value="<%=mb.getName()%>"></td>
					<td>password</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td>title</td>
					<td><input type="text" name="subject"></td>
					<td>file</td>
					<td><input type="file" name="file"></td>
				</tr>
				<tr>
				
				</tr>
				<tr>
					<td colspan="4"><textarea cols="100" rows="50" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><input type="reset" id="g_btn" value="내용지우기">
									<input type="submit" id="g_btn" value="확인">
					</td>
				</tr>
			</table>
			
		</form>
		</div>
	</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>

<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>
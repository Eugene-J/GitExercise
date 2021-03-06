<%@page import="gallery.GalleryBean"%>
<%@page import="gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">

<title>WAVE:/</title>
</head>
<body>
<div id="wrap">
<!-- 헤더 -->
<jsp:include page="../inc/top.jsp"/>


<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>portfolio</li>
	<li><a href="gallery.jsp">Gallery</a></li>
	<li><a href="../media/media.jsp">Media</a></li>
</ul>
</nav>


<!-- 게시판 -->
<article id="w_article">
<!-- updateForm -->


<%

//세션값 가져오기
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");


	//MemberDAO mdao 객체생성
	GalleryDAO gdao = new GalleryDAO();
	//메서드 호출 MemberBean mb= 메서드 호출 getMember(id)
	GalleryBean gb=gdao.getGallery(num);	

	


%>

	
	<h1>update</h1>
	<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post" name="fr">   
		<input type="hidden" name="num" value="<%=num%>">
		<table border="1"  class="w_table">
			<tr>
				<td>name</td>
				<td><input type="text" name="name" value="<%=gb.getName()%>"></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" name="pass" value="<%=gb.getPass()%>"></td>
			</tr>
			<tr>
				<td>title</td>
				<td><input type="text" name="subject" value="<%=gb.getSubject()%>"></td>
			</tr>
			<tr>
				<td>file</td>
				<td><input type="text" name="subject" value="<%=gb.getFile()%>"><input type="file" value="새파일선택" name="file"></td>
			</tr>
			<tr>
				<td>text</td>
				<td><textarea cols="10" rows="20" name="content"><%=gb.getContent()%></textarea></td>
			</tr>
			<td colspan="4">
				<input type="submit" value="수정">
				<input type="button" value="뒤로" onclick="history.back()">
			</td>
		</table>
	</form>
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
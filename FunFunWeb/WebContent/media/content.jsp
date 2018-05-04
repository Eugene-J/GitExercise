<%@page import="gallery.GalleryBean"%>
<%@page import="gallery.GalleryDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WAVE:/</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"/>


<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>portfolio</li>
	<li><a href="../gallery/gallery.jsp">Gallery</a></li>
	<li><a href="../media/media.jsp">Media</a></li>
</ul>
</nav>

<!-- 게시판 -->
<article id="w_article">
<!-- content.jsp -->
<%
//int num, String pageNum 파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");


//BoardDAO bdao 객체생성
	GalleryDAO gdao = new GalleryDAO();

//자바빈 변수 bb= getBoard(num)
	GalleryBean gb =gdao.getGallery(num);

//updateReadcount(num)
	gdao.updateReadcount(num);
	//BoardBean bb2=bdao.updateReadcount(num);

%>

	<h1>media</h1>
	<table border="1"  class="w_table">
		<tr>
			<td>title</td>
			<td><%=gb.getSubject()%></td>
			<td>name</td>
			<td><%=gb.getName()%></td>
			
		</tr>
		<tr>	
			<td>조회수</td>
			<td><%=gb.getReadcount() %></td>
			<td>date</td>
			<td><%=gb.getDate()%></td>
		</tr>
		<tr>
			
		</tr>
		<tr>
			<td>file</td>
			<td colspan="3">
			<img src="../upload/<%=gb.getFile()%>" width="500" height="700"><br>
			<a href="../upload/<%=gb.getFile()%>"><%=gb.getFile()%></a></td> 
			<!-- 갤러리는 이미지 태그를 써서 이미지가 보이게 해준다. -->
			
		</tr>
		<tr>
			<td>text</td>
			<td colspan="3"><%=gb.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4">
			<%
			String id=(String)session.getAttribute("id");
			if(id!=null){%>
			<input type="button" value="수정" onclick="location.href='updateForm.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>'">
			<%} %>
			<input type="button" value="목록으로" onclick="location.href='gallery.jsp'">
			</td>
		<tr>
	</table>
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
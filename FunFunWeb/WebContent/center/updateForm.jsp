<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<title>board/updateForm</title>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top_notice.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>forum</li>
</ul>
</nav>

<!-- 게시판 -->
<article  id="w_article">
<!-- updateForm -->


<%

//세션값 가져오기
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");


	//MemberDAO mdao 객체생성
	BoardDAO bdao = new BoardDAO();
	//메서드 호출 MemberBean mb= 메서드 호출 getMember(id)
	BoardBean bb=bdao.getBoard(num);	

	


%>

	
	<h1>글 수정하기</h1>
	<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post" name="fr">   
		<input type="hidden" name="num" value="<%=num%>">
		<table border="1"  class="w_table">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="<%=bb.getName()%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" value="<%=bb.getPass()%>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="10" rows="20" name="content"><%=bb.getContent()%></textarea></td>
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
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
<link href="../css/join.css" rel="stylesheet" type="text/css"> 

 
</head>
<body>
<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더들어가는 곳 -->
		
		<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>비밀번호수정</li>
</ul>
</nav>
		<!-- 본문내용 -->
		<%
			String id=(String)session.getAttribute("id");

			MemberDAO mdao=new MemberDAO(); 
			MemberBean mb=mdao.getMember(id);
		%>
		<article id="l_article">
			<h1>비밀번호수정</h1>
				<div id="l_info">
				<h2>비밀번호수정</h2>
				<p>비밀번호를 다시 입력해주십시오</p>
				</div>
				
				<form action="changePassCheckPro.jsp?id=<%=id %>" id="login">
			
					<table  class="l_table">
						<tr>
							<td>PASSWORD</td>
							<td><input type="password" name="pass"></td>
						</tr>
					</table>
					
				<div class="clear"></div>
				<div id="p_buttons">
					<input type="submit" value="확인" class="submit" > 
				</div>
				</form>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->
		
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		
		<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
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
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더들어가는 곳 -->
		
		<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>정보수정</li>
</ul>
</nav>
		<!-- 본문내용 -->
		<%
			String id=(String)session.getAttribute("id");
		%>
		<%=id %>
		<article  id="l_article">
				
			<h1>회원정보수정</h1>
				<div id="l_info">
				<h2>회원정보수정</h2>
				<p>비밀번호를 다시 입력해주십시오</p>
				</div>
				
				<form action="updateFormCheckPro.jsp" id="login">
					<table  class="l_table">
						<tr>
							<td>PASSWORD</td>
							<td><input type="password" name="pass"></td>
						</tr>
					</table>
					

				<div id="buttons">
					<input type="submit" value="확인" class="submit" > 
						 
					<input type="reset" value="내용지우기" class="cancel">
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
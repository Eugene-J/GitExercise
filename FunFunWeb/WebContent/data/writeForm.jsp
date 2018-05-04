<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATA</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
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
<!-- <script src="../script/script.js"></script>  -->  <!-- 자바 스크립트 파일 떼주기 -->
<script type="text/javascript">

	function check(){
		
		if(document.fr.pass.value==""){
			alert("비밀번호를 입력하세요");
			document.fr.pass.focus();
			return false;
		}
		
		if(document.fr.subject.value==""){
			alert("제목을 입력하세요");
			document.fr.subject.focus();
			return false;
		}
		

	}


</script>

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
	<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
	<nav id="sub_menu">
		<ul>
			<li>data</li>
		</ul>
	</nav>

<%

	String id=(String)session.getAttribute("id");
	
	if(id==null){
		response.sendRedirect("login.jsp");
	}
	
	MemberDAO mdao=new MemberDAO();
	MemberBean mb=mdao.getMember(id);

%>

<!-- 게시판 -->
	<article id="w_article">
<!-- board/writeForm.jsp -->
		<h1>게시판 글쓰기</h1>
		
		<form action="writePro.jsp" method="post" enctype="multipart/form-data" onsubmit="check()">
			
			<table border="1" class="w_table">
				<tr>
					<td>name</td>
					<td><input type="text" name="name" value="<%=mb.getName() %>"></td>
				</tr>
				<tr>
					<td>password</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td>title</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td>file</td>
					<td><input type="file" name="file"></td>
				</tr>
				<tr>
					<td>content</td>
					<td><textarea cols="100" rows="80" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" id="g_btn" value="내용지우기">
									<input type="submit" id="g_btn" value="확인">
									</td>
				</tr>
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
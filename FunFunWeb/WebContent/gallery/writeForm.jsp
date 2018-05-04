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
		
		
		
		if(document.fr.content.value==""){
			alert("내용을 입력하세요");
			document.fr.content.focus();
			return false;
		}
		
		
	return true;
	}


</script>

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>portfolio</li>
	<li><a href="gallery.jsp">Gallery</a></li>
	<li><a href="../media/media.jsp">Media</a></li>
</ul>
</nav>


<%

	String id=(String)session.getAttribute("id");
	
	MemberDAO mdao=new MemberDAO();
	MemberBean mb=mdao.getMember(id);

%>

<!-- gallery게시판 -->
	<article id="w_article">
<!-- board/writeForm.jsp -->
		<div id="w_form">
		<h1>gallery</h1>
		<form action="writePro.jsp" method="post" name="fr" enctype="multipart/form-data" onsubmit="return check()">
		
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
				
				</tr>
				<tr>
					<td colspan="4"><textarea cols="100" rows="50" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><input type="reset"  value="내용지우기"><br>
									<input type="submit"  value="확인">
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
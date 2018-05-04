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
<title>답글쓰기</title>
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
		
		
		if(document.fr.content.value==""){
			alert("내용을 입력하세요");
			document.fr.content.focus();
			return false;
		}
	}


</script>


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
	<li>forum</li>
</ul>
</nav>

<%

	String id=(String)session.getAttribute("id");
	
	//세션값 없으면 login.jsp 이동
	if(id==null){
		response.sendRedirect("login.jsp");
	}
	
	MemberDAO mdao=new MemberDAO();
	MemberBean mb=mdao.getMember(id);
	
	//num, re_ref, re_lev, re_seq 파라미터 가져오기

	int num=Integer.parseInt(request.getParameter("num"));
	int re_ref=Integer.parseInt(request.getParameter("re_ref"));
	int re_lev=Integer.parseInt(request.getParameter("re_lev"));
	int re_seq=Integer.parseInt(request.getParameter("re_seq"));
	
%>

<!-- 게시판 -->
	<article>
<!-- board/reWrite.jsp -->
		<h1>답글쓰기</h1>
		
		
		
		<form action="reWritePro.jsp" method="post" name="fr" onsubmit="return check()">
		
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="re_ref" value="<%=re_ref%>">
		<input type="hidden" name="re_lev" value="<%=re_lev%>">
		<input type="hidden" name="re_seq" value="<%=re_seq%>">
			
			<table border="1" class="w_table">
				<tr>
					<td>name</td>
					<td><input type="text" name="name" value="<%=mb.getName()%>"></td>
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
					<td>content</td>
					<td><textarea cols="100" rows="20" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="다시쓰기">
									<input type="submit" value="답글쓰기"></td>
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
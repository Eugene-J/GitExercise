<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
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

	<%
	String id=(String)session.getAttribute("id");
	
	if(id==null){
		%><script>
			alert("조회실패");
		</script>
		
		<% 
		response.sendRedirect("loginForm.jsp");
	}
		

		MemberDAO mdao=new MemberDAO(); 
		MemberBean mb=mdao.getMember(id);

%>
<article  id="l_article">
	<h1>비밀번호수정</h1>
	<div id="l_info">
				<h2>비밀번호수정</h2>
				<p>새로운 비밀번호를 입력해 주십시오</p>
				</div>

		<form action="changePassPro.jsp?id=<%=id %>" method="post" class="join" name="fr"> 
		<!-- id값을 넘겨줘야 changePass 메소드 sql 에서 id를 이용할 수 있음  -->
				
				<table  class="ll_table">
						<tr>
							<td>PASSWORD</td>
							<td><input type="password" name="pass"></td>
						</tr>
					</table>
				
			<div class="clear"></div>
			
			<div id="pp_buttons">
				<input type="submit" value="비밀번호수정" class="submit" >
				<input type="button" value="뒤로가기" class="back" onclick="history.back()">
			</div>
			</form>
			</article>

</article>

<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->


</body>
</html>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보보기</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->



<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>infomation</li>
</ul>
</nav>

<%

	String id=(String)session.getAttribute("id");

	if(id==null){
		%><script>
			alert("접근할 수 없는 메뉴입니다");
		</script>
		<%
		response.sendRedirect("login.jsp");
	}
	
	MemberDAO mdao=new MemberDAO();
	MemberBean mb=mdao.getMember(id);
%>
<article  id="w_article">
	<h1>my info</h1>

	<table border="1"  class="w_table">
	<tr>
 		<th>아이디</th>
			<td><%=mb.getId() %></td> 
		</tr>
		<tr>
			<th>이름</th>
			<td><%=mb.getName() %></td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td><%=mb.getReg_date() %></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><%=mb.getEmail()%></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><%=mb.getPostcode()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=mb.getAddress()%></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><%=mb.getAddress2()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=mb.getPhone() %></td>
		</tr>
		<tr>
			<th>핸드폰번호</th>
			<td><%=mb.getMobile() %></td>
		</tr>

		
		
	</table>
	<br>
	<div id="info_btn">
		<input type="button" value="회원정보수정" onclick="location.href='updateFormCheck.jsp'">
		<input type="button" value="비밀번호수정" onclick="location.href='changePassCheck.jsp'">
		<input type="button" value="회원탈퇴" onclick="location.href='deleteForm.jsp'">
	</div>
</article>

<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->


</body>
</html>
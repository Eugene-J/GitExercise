<%@page import="member.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<h1>member/updatePro</h1>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	String id=(String)session.getAttribute("id");
	//세션값이 없으면 loginForm.jsp 이동
	if(id==null){
		response.sendRedirect("login.jsp");
	}
%>	
	<!-- 	액션태그 객체 생성 -->	
	<jsp:useBean id="mb" class="member.MemberBean"/>
	<!-- 액션태그 폼 파라미터 - 폼에 있는 내용을 자바빈 멤버 변수에 저장 -->
	<jsp:setProperty name="mb" property="*"/> 

<%	
	MemberDAO mdao = new MemberDAO();
	mdao.updateMember(mb);
%>
		
	<script type ="text/javascript">
		alert("회원정보가 수정되었습니다");
		location.href="../main/main.jsp";
	</script>
		
</body>
</html>
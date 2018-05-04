<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deletePro</title>
</head>
<body>

<%
	String id=(String)session.getAttribute("id");

	if(id==null){
		response.sendRedirect("login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	String pass = request.getParameter("pass");
%>

	<jsp:useBean id="mb" class="member.MemberBean"/>
	<jsp:setProperty name="mb" property="*"/>
	
<%
	MemberDAO mdao=new MemberDAO();

	int check=mdao.userCheck(id,mb.getPass());
	
	if(check==1){
		mdao.deleteMember(id,pass);
		session.invalidate();
		%>
		<script type="text/javascript">
			alert("회원탈퇴가 완료되었습니다. 메인페이지로 이동합니다.");
			location.href="../main/main.jsp";
		</script>
		<%
	}else if(check==0){
		%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
		<%
	}else if(check==-1){
		%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
	<%} 
	%>	
	
</body>
</html>
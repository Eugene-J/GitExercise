<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 


	String id=(String)session.getAttribute("id");
	String pass=(String)request.getParameter("pass");	

	MemberDAO mdao=new MemberDAO();
	
	int check=mdao.userCheck(id,pass);
	
	if(check==1){
		response.sendRedirect("changePassForm.jsp");
	}else if(check==0){
		%><script>
			alert("비밀번호가 일치하지 않습니다");
			history.back();
		</script>
	<%
	}
	%>	
</body>
</html>
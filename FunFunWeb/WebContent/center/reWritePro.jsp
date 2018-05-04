<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.BoardBean"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writePro</title>
</head>
<body>
<!-- board/writePro.jsp -->
<%
	request.setCharacterEncoding("UTF-8");	
%>
	<jsp:useBean id="bb" class="board.BoardBean"/>	
	<jsp:setProperty name="bb" property="*"/>
	
<% 
	BoardDAO bdao = new BoardDAO();
	bdao.reInsertBoard(bb); //호출 
	response.sendRedirect("notice.jsp");
%>	

</body>
</html>
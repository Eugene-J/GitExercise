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

	String realPath=request.getRealPath("/upload");
	
	int maxSize=5*1024*1024;
	MultipartRequest multi=new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	

	BoardBean bb=new BoardBean();
	
	bb.setName(multi.getParameter("name"));
	bb.setPass(multi.getParameter("pass"));
	bb.setSubject(multi.getParameter("subject"));
	bb.setContent(multi.getParameter("content"));
	bb.setFile(multi.getFilesystemName("file"));


	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(bb);
	response.sendRedirect("notice.jsp");
	
%>	

</body>
</html>
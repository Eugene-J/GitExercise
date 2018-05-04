<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="data.DataBean"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.DataDAO"%>
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
	

	DataBean db=new DataBean();
	
	
	db.setName(multi.getParameter("name"));
	db.setPass(multi.getParameter("pass"));
	db.setSubject(multi.getParameter("subject"));
	db.setContent(multi.getParameter("content"));
	db.setFile(multi.getFilesystemName("file"));
	
	DataDAO ddao = new DataDAO();
	ddao.insertData(db);
	response.sendRedirect("data.jsp");
	
%>	

</body>
</html>
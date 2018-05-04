<%@page import="gallery.GalleryDAO"%>
<%@page import="gallery.GalleryBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	String realPath=request.getRealPath("/upload");
	
	int maxSize=5*1024*1024;
	MultipartRequest multi=new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	
	
	GalleryBean gb=new GalleryBean();
	
	gb.setContent(multi.getParameter("content"));
	gb.setName(multi.getParameter("name"));
	gb.setPass(multi.getParameter("pass"));
	gb.setSubject(multi.getParameter("subject"));
	gb.setFile(multi.getFilesystemName("file"));
	
 
	GalleryDAO gdao = new GalleryDAO();
	gdao.insertGallery(gb);
	response.sendRedirect("gallery.jsp");
%>	

</body>
</html>
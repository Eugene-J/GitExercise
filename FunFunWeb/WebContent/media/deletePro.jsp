<%@page import="gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateDeletePro</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	int num=Integer.parseInt(request.getParameter("num"));

%>

	<jsp:useBean id="gb" class="gallery.GalleryBean"/>
	<jsp:setProperty name="gb" property="*"/>
	
	<script type="text/javascript">
		alert("게시물이 삭제됩니다. 진행하시겠습니까?");
	</script>
	
	<%
	GalleryDAO gdao = new GalleryDAO();
	int check=gdao.userCheck(num, gb.getPass());
	
	if(check==1){
		gdao.deleteGallery(num, gb.getPass());
	%>
	
		<script type="text/javascript">
			alert("게시물이 삭제되었습니다.");
			location.href="gallery.jsp";
		</script>
		
	<%
	}else if(check==0){
	%>	
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다");
			history.back();
		</script>
	<%
	} 
	%>
		

	
</body>
</html>
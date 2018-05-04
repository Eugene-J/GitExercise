<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- center/commentPro.jsp -->
<%
	request.setCharacterEncoding("UTF-8");	
%>

	<jsp:useBean id="cb" class="comment.CommentBean"/>	
	<jsp:setProperty name="cb" property="*"/>
	
	<jsp:useBean id="bb" class="board.BoardBean"/>	
	<jsp:setProperty name="bb" property="*"/>
	
	
<% 
	String board_num=request.getParameter("board_num");
	String name=request.getParameter("name");
	String content=request.getParameter("content");
	
	cb.setName(name);
	cb.setContent(content);
	cb.setBoard_num(board_num);
	
	CommentDAO cdao = new CommentDAO();
	cdao.insertComment(cb);	

%>
	<script type="text/javascript">
		location.href="content.jsp?num=<%=bb.getNum()%>";
	</script>
</body>
</html>
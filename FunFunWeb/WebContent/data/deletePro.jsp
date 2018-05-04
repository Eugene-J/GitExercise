<%@page import="board.BoardDAO"%>
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

	<jsp:useBean id="bb" class="board.BoardBean"/>
	<jsp:setProperty name="bb" property="*"/>
	
	<script type="text/javascript">
		alert("게시물이 삭제됩니다. 진행하시겠습니까?");
	</script>
	
	<%
	BoardDAO bdao = new BoardDAO();
	int check=bdao.userCheck(num, bb.getPass());
	
	if(check==1){
		bdao.deleteBoard(num, bb.getPass());
	%>
	
		<script type="text/javascript">
			alert("게시물이 삭제되었습니다.");
			location.href="notice.jsp";
		</script>
		
	<%
	}else if(check==0){
	%>	
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다");
			history.back();
		</script>
	<%
	}else if(check==-1){
		%>	
		<script type="text/javascript">
			alert("비밀번호를 입력하십시오");
			history.back();
		</script>
	<%	
	}
	%>
		

	
</body>
</html>
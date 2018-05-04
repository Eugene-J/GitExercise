<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updatePro</title>
</head>
<body>
<h1>board/updatePro</h1>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	int num=Integer.parseInt(request.getParameter("num"));
	
%>	

	<!-- 액션태그 객체 생성 -->	
	<jsp:useBean id="bb" class="board.BoardBean"/>
	<!-- 액션태그 폼 파라미터 - 폼에 있는 내용을 자바빈 멤버 변수에 저장 -->
	<jsp:setProperty name="bb" property="*"/> 

<%
	BoardDAO bdao = new BoardDAO();
	
	int check=bdao.userCheck(num, bb.getPass());

	
	if(check==1){
		bdao.updateBoard(bb);
	%>
		<script type="text/javascript">
			alert("수정되었습니다");
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
	}
	%>
		

		
		
</body>
</html>
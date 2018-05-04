<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>

	<script type="text/javascript">
		function ok(){
			//찾은 아이디를 join.jsp의 아이디 상자에 넣어주기  <= idCheck.jsp 의 userid상자에 찾은 값
			window.opener.document.fr.id.value= document.wfr.id.value;
			//idCheck.jsp 창닫기
			window.close();
		}
	</script>
</head>
<body>
	<h2>아이디 중복 확인</h2>
<%
//member/idcheck.jsp
	request.setCharacterEncoding("UTF-8");
//userid 파라미터 가져오기
//String id = userid 파라미터 가져오기 
	String id=request.getParameter("id");

//MemberDAO mdao 객체 생성
	MemberDAO mdao= new MemberDAO();
//int check=idcheck(id)
//check ==1 아이디 중복, check==0 아이디 중복아님 아이디 선택가능

	int check=mdao.idCheck(id);
	out.println(id);
	out.println(check);
	
	if(check==1){
		out.print("이미 사용하고 있는 아이디입니다");
	}else if(check==0){
		out.print("사용가능한 아이디입니다");
		%>
			<input type="button" value="아이디 선택" onclick="ok()">
		<%
		
	}
%>
	<form action="idCheck.jsp" method="post" name="wfr" >
		아이디 : <input type="text" name="id" value="<%=id%>">
		<input type="submit" name="submit" value="아이디 중복 확인">
	</form>


	
</body>
</html>
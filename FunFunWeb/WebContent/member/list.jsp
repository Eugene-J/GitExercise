<%@page import="java.util.List"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->


<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>member list</li>
</ul>
</nav>


<article id="w_article">

<h1>회원정보목록</h1>
<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
		//세션값 가져오기
		String id=(String)session.getAttribute("id");
		//세션값이 없으면 loginForm.jsp 이동
		if(id==null || !id.equals("admin") ){
			%>
			<script type="text/javascript">
				alert("관리자만 접근 가능한 메뉴입니다.");
			</script>
		<%
				response.sendRedirect("login.jsp");
		}		
		
		MemberDAO mdao= new MemberDAO();
		
		List<MemberBean> memberList=mdao.getMemberList();
		
		%>
	<table border="1"   class="w_table">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>가입날짜</th>
			<th>이메일</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>전화번호</th>
			<th>핸드폰번호</th>
		
		</tr>
		<%
		for(int i=0;i<memberList.size();i++){
			MemberBean mb=(MemberBean)memberList.get(i);
			%>
		<tr>
			<td><%=mb.getId()%></td>  <!-- 괄호안에 id열의 인덱스 번호인 1을 넣어도 결과는 동일하지만 남이 내 프로그램을 봤을 때 1이 뭔지 알수 없으니 이름을 써주는게 더 좋다 -->
			<td><%=mb.getPass()%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getReg_date() %></td>
			<td><%=mb.getEmail()%></td>
			<td><%=mb.getPostcode()%></td>
			<td><%=mb.getAddress()%></td>
			<td><%=mb.getAddress2()%></td>
			<td><%=mb.getPhone()%></td>
			<td><%=mb.getMobile()%></td>
			
		</tr>
		<%
		}
		%>
		
	</table>
	
</article>

<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->


</body>
</html>
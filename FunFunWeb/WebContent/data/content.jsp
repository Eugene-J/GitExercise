<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="data.DataBean"%>
<%@page import="data.DataDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>data</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
<link href="../css/comment.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
	<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
	<nav id="sub_menu">
		<ul>
			<li>data</li>
		</ul>
	</nav>

<!-- 게시판 -->
<article class="c_article">
<!-- content.jsp -->
<%
//int num, String pageNum 파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");

//BoardDAO bdao 객체생성
	DataDAO ddao = new DataDAO();

//자바빈 변수 bb= getBoard(num)
	DataBean db =ddao.getData(num);


	String id=(String)session.getAttribute("id");
	MemberDAO mdao=new MemberDAO();
	MemberBean mb = mdao.getMember(id);

	String board_num=request.getParameter("num");

		
%>

	<h1>data</h1>
	
	<table border="1"  class="w_table">

		<tr>
			<td>글번호</td>
			<td><%=db.getNum()%></td>
		</tr>
		<tr>	
			<td>작성자</td>
			<td><%=db.getName()%></td>
			<td>작성일</td>
			<td><%=db.getDate()%></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td colspan="3"><%=db.getSubject()%></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td colspan="3"><a href="../upload/<%=db.getFile()%>"><%=db.getFile()%></a>
				<%if(db.getFile()==null){%><img src="../images/no_picture.png" width="50" height="50">
				<%}else if(db.getFile()!=null){ %><img src="../upload/<%=db.getFile()%>" width="50" height="50"><%} %>
				</td>
			<!-- 갤러리는 이미지 태그를 써서 이미지가 보이게 해준다. -->
			
		</tr>
		<tr>
			<td>글내용</td>
			<%if(db.getContent()!=null){%>
				<td colspan="3"><textarea cols="80" rows="20">
				 	<%=db.getContent()%> 
				</textarea>
				</td>
			<%}else if(db.getContent()==null){%>
				<td colspan="3"><textarea cols="80" rows="20">
				 	<%=" "%> 
				</textarea>
				</td>
			<%} %>
		</tr>
		<tr>
			<td colspan="4">
				<%
				if(id!=null){
					if(id.equals(id)){%>
						<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=db.getNum()%>&pageNum=<%=pageNum%>'">
						<input type="button" value="글삭제" onclick="location.href='delete.jsp?num=<%=db.getNum()%>&pageNum=<%=pageNum%>'">					
	
					
					<%}else{%>
						<input type="button" value="글목록" onclick="location.href='notice.jsp'">
					<%}
				}else if(id==null){
					%>
					<input type="button" value="글목록" onclick="location.href='notice.jsp'">
				<%}%>
			</td>
		</tr>

	</table>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->



<div class="clear"></div>


<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>

</body>
</html>
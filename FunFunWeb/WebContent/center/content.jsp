<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
<link href="../css/comment.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더-->
	<jsp:include page="../inc/top.jsp"/>

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>portfolio</li>
	<li><a href="gallery.jsp">Gallery</a></li>
	<li><a href="../media/media.jsp">Media</a></li>
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
	BoardDAO bdao = new BoardDAO();

//자바빈 변수 bb= getBoard(num)
	BoardBean bb =bdao.getBoard(num);

//updateReadcount(num)
	bdao.updateReadcount(num);
	//BoardBean bb2=bdao.updateReadcount(num);

	String id=(String)session.getAttribute("id");
	MemberDAO mdao=new MemberDAO();
	MemberBean mb = mdao.getMember(id);
	
	CommentDAO cdao=new CommentDAO();
	CommentBean cb=cdao.getComment(num);
	
	String board_num=request.getParameter("num");
	int count=cdao.getCommentCount(board_num);
	
	if(bb.getContent()!=null){
	String content=bb.getContent().replace("\r\n","<br>");
	//A.replacr("B","C");  -> A에 담긴 문자 B를 C로 replace 해주는 함수 
	}else if (bb.getContent()==null){
		
	}
		
%>

	<h1>forum</h1>
	
	<table border="1"  class="w_table">
		<tr>
			<td>title</td>
			<td colspan="3"><%=bb.getSubject()%></td>
		</tr>
		<tr>	
			<td>name</td>
			<td><%=bb.getName()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=bb.getReadcount() %></td>
		</tr>
		<tr>
			<td>date</td>
			<td><%=bb.getDate()%></td>
		</tr>
		
		<tr>
			<td>file</td>
			<td colspan="3"><a href="../upload/<%=bb.getFile()%>"><%=bb.getFile()%></a>
				<%if(bb.getFile()==null){%><img src="../images/no_picture.png" width="50" height="50">
				<%}else if(bb.getFile()!=null){ %><img src="../upload/<%=bb.getFile()%>" width="50" height="50"><%} %>
				</td>
			<!-- 갤러리는 이미지 태그를 써서 이미지가 보이게 해준다. -->
			
		</tr>
		<tr>
		
		</tr>
		<tr>
			<td>text</td>
			<%if(bb.getContent()!=null){%>
				<td colspan="3"><textarea cols="1500" rows="300">
				 	<%=bb.getContent()%> 
				</textarea>
				</td>
			<%}else if(bb.getContent()==null){%>
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
						<input type="button" value="수정" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
						<input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">					
						<input type="button" value="답글쓰기" onclick="location.href='reWrite.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
	
					
					<%}else{%>
						<input type="button" value="답글쓰기" onclick="location.href='reWrite.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
						<input type="button" value="목록" onclick="location.href='notice.jsp'">
					<%}
				}else if(id==null){
					%>
					<input type="button" value="목록" onclick="location.href='notice.jsp'">
				<%}%>
			</td>
		</tr>

	</table>


		<br>
		
		
		<% if(id!=null){%>
				
					<!-- 댓글목록 -->
					<jsp:include page="../inc/commentList.jsp">
						<jsp:param value="<%=bb.getNum()%>" name="num"/>
					</jsp:include>
					<!-- 댓글박스 -->
					<jsp:include page="../inc/commentBox.jsp">
						<jsp:param value="<%=bb.getNum()%>" name="board_num"/>				
					</jsp:include>
					
		<%}else if(id==null){%>
			<!-- 댓글목록 -->
					<jsp:include page="../inc/commentList.jsp">
						<jsp:param value="<%=bb.getNum()%>" name="num"/>
					</jsp:include>
			<%} %>
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
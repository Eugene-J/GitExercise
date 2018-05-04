<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String id=(String)session.getAttribute("id");
	String board_num=request.getParameter("board_num");
	
	MemberDAO mdao=new MemberDAO();
	MemberBean mb=mdao.getMember(id);
%>
	<jsp:useBean id="bb" class="board.BoardBean"/>	
	<jsp:setProperty name="bb" property="*"/>

	<form action="commentPro.jsp?num=<%=bb.getNum()%>&name=<%=mb.getName() %>" method="post">
		<input type="hidden" name="board_num" value="<%=board_num%>">

		
	
		<table border="1" id="c_box">
			<tr>
				<th>댓글쓰기 :: <%=mb.getName() %> 님</th>
			</tr>
			<tr>
				<td><textarea cols="80" rows="40" name="content"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="댓글쓰기"></td>
			</tr>	
		</table>
	</form>
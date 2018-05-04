<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더들어가는 곳 -->
<header>
<%

	String id=(String)session.getAttribute("id");
	
	if(id==null){
	%>	<div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
		<div class="clear"></div>
	<%}else if(id!=null && !id.equals("admin")){
		%> <div id="login"><%=id%> | <a href="../member/info.jsp">회원정보보기</a> | <a href="../member/logout.jsp">logout</a></div>
	<%}else if(id.equals("admin")){
		%><div id="login"><%=id%> | <a href="../member/info.jsp">회원정보보기</a> | <a href="../member/list.jsp">회원관리</a> | <a href="../member/logout.jsp">logout</a></div>
	<div class="clear"></div>
	<%
	} 
	%>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="../gallery/gallery.jsp">GALLERY</a></li>
	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="../contact/contact.jsp">CONTACT US</a></li>
</ul>
</nav>
</header>
<!-- 헤더들어가는 곳 -->
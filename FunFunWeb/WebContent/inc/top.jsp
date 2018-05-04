<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더들어가는 곳 -->
<header>
	<div class="title">
		<div id="title">
			<a href="../main/main.jsp">WAVE:/<img src="../images/tenor.gif" width="60" height="35"></a>
		</div>
		<div id="subTitle">
			ART CREATIVE GROUP
		</div>
	</div>
	
<div class="clear"></div>

<%
	
	String id=(String)session.getAttribute("id");
	
	if(id==null){%>	
		<div id="login">
			<a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a>
		</div>
		
		<div class="clear"></div>
		
	<%}else if(id!=null && !id.equals("admin")){%> 
		<div id="login"><%=id%>   
			<a href="../member/info.jsp">회원정보보기</a> | <a href="../member/logout.jsp">logout</a>
		</div>
	<%}else if(id.equals("admin")){%>
		<div id="login"><%=id%>   
			<a href="../member/info.jsp">회원정보보기</a> | <a href="../member/list.jsp">회원관리</a> | <a href="../member/logout.jsp">logout</a>
		</div>
	<%
	} 
	%>
	<div class="clear"></div>																																																																																																																																																																																																																																																												
		
<!-- 로고들어가는 곳 -->
<!--  <div id="logo"><img src="../images/abstractflow.gif" width="265" height="62" alt="logo"></div>-->
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
	<ul>
		<li><a href="../main/main.jsp">MAIN</a></li>
		<!-- <li><a href="../company/welcome.jsp">COMPANY</a></li> -->
		<li><a href="#">PORTFOLIO</a>
				<ul>
					<li><a href="../gallery/gallery.jsp">GALLERY</a></li>
					<li><a href="../media/media2.jsp">MEDIA</a></li>
				</ul>
			</li>	
		<li><a href="../center/notice.jsp">FORUM</a></li>
		<li><a href="../data/data.jsp">DATA</a></li>
	</ul>
</nav>

<div class="clear"></div>


</header>
<!-- 헤더들어가는 곳 -->
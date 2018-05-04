<%@page import="gallery.GalleryBean"%>
<%@page import="gallery.GalleryDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAVE:/</title>
<link href="../css/default.css" rel="stylesheet">
<link href="../css/front.css" rel="stylesheet">


	<script src="../js/jquery-3.3.1.js"></script>
	<script src="../js/jquery.innerfade.js"></script>
	<script type="text/javascript">

	
	$(document) .ready(function(){
		
		$('#company') .innerfade({
			aminationtype: 'fade', //서서히 사라지는 효과
			speed:2000,
			timeout:2000,
			type:'random',
			containerheight: '340px'
		});
		
		
	});
	</script>
</head>
<body>

<div id="wrap">
	<!-- 헤더파일 -->
	<jsp:include page="../inc/top.jsp"/>
	<div class="clear"></div>
	
<article>
	
		<section class="mainImg">
			<div class="main_img"></div>
			 <p id="main_txt"><a href="#s_company">▼<br>WHO<br>    WE<br> ARE<br>?</a></p>
		</section><!-- mainImg -->
		
	<div class="clear"></div>
	<div id="line"></div>
	
	<section class="company" id="s_company">
			<h1 id="about">About WAVE</h1>
				<div>
					<ul id="company">
						<li><img src="../images/company1.jpg" width="700px" height="450px"></li>
						<li><img src="../images/company2.jpg" width="700px" height="400px"></li>
						<li><img src="../images/company3.jpg" width="700px" height="450px"></li>
						<li><img src="../images/company4.jpg" width="700px" height="450px"></li>
						<li><img src="../images/company5.jpg" width="700px" height="450px"></li>
					</ul>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Suspendisse tellus nunc, bibendum in nulla non, ornare commodo
						dui. Aenean bibendum sed libero sit amet fermentum. Ut egestas
						semper turpis vel iaculis. Praesent nec purus eget nisi tristique
						aliquam. Phasellus nisl enim, eleifend eu arcu pellentesque,
						vehicula fermentum neque. Donec est orci, dapibus non porttitor
						nec, imperdiet in velit. Etiam non sem dui. Vivamus tristique
						pellentesque odio, a vehicula nunc malesuada vel. Vivamus eu quam
						lacus. Sed tempus semper luctus. Donec urna turpis, lacinia et
						turpis sit amet, eleifend maximus justo. Fusce pellentesque dui
						vel hendrerit faucibus. Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Cras lectus justo, ultricies at magna vel, congue
						efficitur est. </p>
				</div>
	</section><!-- company -->
	
	<div class="clear"></div>
	
	<a href="#portfolio"><div id="square"></div></a>
		
		
	<section class="portfolio">
			<h1 id="portfolio">WORK AND FORUM</h1>	
				<div id="port_img">
					<img src="../images/poster1.jpg">
					<img src="../images/poster2.jpg">
				</div>
				
				<div id="gallery">
					<h3>Gallery</h3>
					<%
						request.setCharacterEncoding("UTF8");
					
						GalleryDAO gdao = new GalleryDAO();
						int count=gdao.getGalleryCount();
						
						int pageSize=5;

						String pageNum=request.getParameter("pageNum");
					
						if(pageNum==null){
							pageNum="1";
						}
		
						int currentPage=Integer.parseInt(pageNum);
						int startRow=1;
						
						
						List<GalleryBean> galleryList=null;
						
						if(count!=0){
							galleryList = gdao.getGalleryList(startRow, pageSize);
						}
					
					%>
						<table border="1">
							 <%
							for(int i=0;i<galleryList.size();i++){
								GalleryBean gb=(GalleryBean)galleryList.get(i);
							 %>
							<tr> 
								<td><a href="../gallery/content.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>"><%=gb.getSubject()%></a></td>
								<%-- <td><%=gb.getName()%></td> --%>
								<td><%=gb.getDate()%></td>
							</tr>
							<%
							} 
							%> 
						</table>
				</div><!-- gallery -->
					
					
				<div id="media">
					<h3>FORUM</h3>
					<%
						request.setCharacterEncoding("UTF8");
					
						BoardDAO bdao = new BoardDAO();
						int count2=bdao.getBoardCount();
						
						int pageSize2=5;
						
						String pageNum2=request.getParameter("pageNum");
					
						if(pageNum2==null){
							pageNum2="1";
						}
						
						int currentPage2=Integer.parseInt(pageNum2);
						
						int startRow2=1;
						
						
						List<BoardBean> boardList=null;
						
						if(count!=0){
							boardList = bdao.getBoardList(startRow2, pageSize2);
						}
					
					%>
						<table border="1">
							<%
							for(int i=0;i<boardList.size();i++){
								BoardBean bb=(BoardBean)boardList.get(i);
							
							%>
							<tr> 
								<td><a href="../center/content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject()%></a></td>
								<%-- <td><%=bb.getName()%></td> --%>
								<td><%=bb.getDate()%></td>
							</tr>
							<%
							} 
							%> 
						</table>
				</div><!-- media -->
				
				<div class="clear"></div>
						
						<p id="port_p">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec semper nisl tortor, in tristique eros pretium et. Ut mattis
						vestibulum mauris sed rutrum. Praesent pharetra sapien massa.
						Donec sagittis commodo dui et faucibus. Fusce eget odio interdum,
						porttitor elit vitae, viverra augue. Donec in ultrices purus. Ut
						nunc tortor, malesuada id odio ut, ultrices mollis lorem. Fusce
						lobortis eu massa non vehicula. Donec nec tortor felis. Vestibulum
						ac luctus tellus, sed dapibus arcu. Morbi fringilla faucibus
						suscipit.</p>
				
				
		</section><!-- portfolio -->
		
	<div class="clear"></div>
	
</article>

	
	
	<!-- 푸터  -->
	<jsp:include page="../inc/bottom.jsp"/>
	
</div>	<!-- wrap -->	

</body>
</html>
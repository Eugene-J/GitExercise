<%@page import="gallery.GalleryBean"%>
<%@page import="gallery.GalleryDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gallery</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">


</head>
<body>
<div id="wrap">
<!-- 헤더 -->
<jsp:include page="../inc/top.jsp"/>


<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>portfolio</li>
	<li><a href="gallery.jsp">Gallery</a></li>
	<li><a href="../media/media.jsp">Media</a></li>
</ul>
</nav>





<article>


<h1>Gallery</h1>

<%
	request.setCharacterEncoding("UTF8");
// 글개수 구해오기
// GalleryDAO dbao 객체생성
// int count = getgallerycount() 메서드 호출
// sql count()

	GalleryDAO gdao = new GalleryDAO();
	int count=gdao.getGalleryCount();
	
	//게시판 글 한페이지에 15씩 잘라 올리기
	int pageSize=9;
	
	//list.jsp 부르고 pageNum=5 가져오기
	String pageNum=request.getParameter("pageNum");

	if(pageNum==null){
		//페이지 번호가 없으면 무조건 '1'인것 수정
		pageNum="1";
	}
	
	//10개씩 첫번째페이지 첫행구하지
	int currentPage=Integer.parseInt(pageNum);
	
	//1페이지 10 =>1  2페이지 10 => 11     3페이지 10=>21
	int startRow=(currentPage-1)*pageSize+1;
	
	//마지막행 구하기 ; 1페이지 10 =>10   2페이지 10 =>20   3페이지 10 =>30
	int endRow=currentPage*pageSize; 
	
	
	//게시판 글 가져오기
	List<GalleryBean> galleryList=null;
	
	if(count!=0){ //이거는 글을 불러오는것. 
		//sql구문으로 게시판 전체의 글을 정렬 최근 글위로.
		//limit 시작행-1, 몇개
		galleryList = gdao.getGalleryList(startRow, pageSize);
	}
%>


<!-- Gallery/list -->
	<h4 id="g_count">전체 글 개수 | <%=count%> 개</h4>
		
		<div id="grid">
			<%
			if(count!=0){
			for(int i=0;i<galleryList.size();i++){
				GalleryBean gb=(GalleryBean)galleryList.get(i);
			%>
			<table id="gallery">
			<tr> 
				<a href="content.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum%>">
					<%if(gb.getFile()==null){%><img src="../images/no_picture.png" width="350" height="500" name="<%=gb.getSubject() %>">
					<%}else if(gb.getFile()!=null){ %><img src="../upload/<%=gb.getFile()%>" width="350" height="500"></a><%} %>
				
			<tr>
			</table>
	
		
		<%
		} 
		}else if(count==0){
	
			}
		%>
	</div>
	
	
	<%
	if(count!=0){	
		//게시판 전체 페이지수 구하기
			//전체 글 개수 count 50개 한화면에 보여눌 글개수 pageSize 10개
			//count50 pageSize10 =>전체페이지수50/10+나머지0=>5+0=0
			//count58 pageSize10 =>전체페이지수58/10+나머지1=>5+1=6
			//삼항 (조건)연산자 조건?참값:거짓값	
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		//한화면에 보여줄 페이지수 설정
		int pageBlock=3;
			
		//시작하는 페이지 번호 구하기
			//1~10 => 1   , 11~20=>11, 21~30 =>21
			//
		//int startPage=(((currentPage/pageBlock)+0.9-1)*pageBlock))+1;
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;	
		
		//끝나는 페이지 번호 구하기
		int endPage=startPage+pageBlock-1;
	
	
		//구한 끝페이지 보다 전체페이지 수가 작은 경우 
		if(endPage>pageCount){
			endPage=pageCount;
		}
	
	
		%>
		
		
		
		<div id="paging">
		<%
		//이전
		if(startPage>pageBlock){
			%><a href="gallery.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a><%  //이전은 문자니까 <%=  필요 없음
		}
		
		for(int i=startPage;i<=endPage;i++){
			%><a href="gallery.jsp?pageNum=<%=i%>"><%=i%></a><%
			//근데 i는 변수니까 <%=  필요하다
		}
		
		//다음
		if(endPage<pageCount){
			%><a href="gallery.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
		<%
		}//if
	}
%>
		</div>
	<%
	String id=(String)session.getAttribute("id");
	if(id!=null){
	%><div id="g_btn"><a href="writeForm.jsp">WRITE</a></div>
	<%
	}
	%> 
	

</article>

<div class="clear"></div>



<!-- 푸터 -->
<jsp:include page="../inc/bottom.jsp"/>

</div>
</body>
</html>
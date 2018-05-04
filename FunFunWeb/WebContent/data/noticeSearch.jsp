<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>

<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
<!-- <script src="../script/script.js"></script>  -->  <!-- 자바 스크립트 파일 떼주기 -->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top_notice.jsp"/>
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

<%
	//한글처리
	request.setCharacterEncoding("UTF8");

	//search 파라미터 가져오기 
	String search=(String)request.getParameter("search");
	
// 글개수 구해오기
// BoardDAO dbao 객체생성
// int count = getBoardCount() 메서드 호출
// sql count()

	BoardDAO bdao = new BoardDAO();
	int count=bdao.getBoardCount(search);
	
	//게시판 글 한페이지에 15씩 잘라 올리기
	int pageSize=3;
	
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
	List<BoardBean> boardList=null;
	
	if(count!=0){
		//sql구문으로 게시판 전체의 글을 정렬 최근 글위로.
		//limit 시작행-1, 몇개
		boardList = bdao.getBoardList(search, startRow, pageSize);
	}
%>

<article>
<h1>Notice</h1>

<!-- board/list -->
	게시판 글목록 [전체 글 개수:<%=count%>]
	
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>첨부파일</td>
			<td>조회수</td>
			<td>글쓴날짜</td>
		</tr>
		<%
			if(count!=0){
		
				for(int i=0;i<boardList.size();i++){
					BoardBean bb=(BoardBean)boardList.get(i);
				
				//String no=(String)bb.getFile();
				
				%>
				
				<tr> 
					<td><%=bb.getNum()%></td>
					<td><a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject()%></a></td>
					<td><%=bb.getName()%></td>
					<td><%if(bb.getFile()==null){%><img src="../images/no_picture.png" width="50" height="50">
						<%}else if(bb.getFile()!=null){ %><img src="../upload/<%=bb.getFile()%>" width="50" height="50"><%} %></td>
					<td><%=bb.getReadcount() %></td>
					<td><%=bb.getDate()%></td>
				</tr>
				<%
				}
			}else if(count==0){
				%>
				<tr>
					<td colspan="6">검색어와 일치하는 값이 없습니다</td>
				</tr>
			<% 	
			}
		%>
		
	</table>
	
	
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
	
	
		
		//이전
		if(startPage>pageBlock){
			%><a href="noticeSearch.jsp?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">[이전]</a><%  //이전은 문자니까 <%=  필요 없음
		}
		
		for(int i=startPage;i<=endPage;i++){
			%><a href="noticeSearch.jsp?pageNum=<%=i%>&search=<%=search%>"><%=i%></a><%
			//근데 i는 변수니까 <%=  필요하다
		}
		
		//다음
		if(endPage<pageCount){
			%><a href="noticeSearch.jsp?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">[다음]</a>
		<%
		}//if
	}
%>
	<%
	String id=(String)session.getAttribute("id");
	if(id!=null){
	%><input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'">
	<%
	}
	%>
	
	
<div id="table_search">
	<form action="noticeSearch.jsp" method="post">
		<input type="text" name="search" class="input_box">
		<input type="submit" value="search" class="btn">
	</form> 
</div>



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
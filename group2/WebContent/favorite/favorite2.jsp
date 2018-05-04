<%@page import="net.admin.manage.db.MovieBean"%>
<%@page import="net.admin.manage.db.MovieDAO"%>
<%@page import="net.favorite.db.FavoriteBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: 회원님이 보고 싶어 하는 영화</title>

  
<!-- js -->
<script src="../js/jquery-3.3.1.js"></script>

<!-- CSS -->
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/category_test.css" rel="stylesheet" type="text/css" media="screen"> 
  
  
<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">


</script> 
</head>





<body>
<div></div> <!-- for IE7 -->
<%
String id = (String)session.getAttribute("id");
List<FavoriteBean> favoritelist = (List)request.getAttribute("favoritelist");
MovieDAO mdao = new MovieDAO();
%>

<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->



<!-- 크롬 기준 -->

<h2 id="categoryTitle">회원님이 보고 싶어 하는 영화</h2> 

<!-- 아티클 -->
<article>

	<div class="container">
		
		
		<!--for문으로 반복 하시면 됩니다.아래의 디자인 예시 코드를 지우고 for문만 남기면 정상작동-->
		<!--for문으로 반복 하시면 됩니다.아래의 디자인 예시 코드를 지우고 for문만 남기면 정상작동-->
		<%for(FavoriteBean fb : favoritelist){
		MovieBean mb= mdao.getMovie(fb.getF_num());
		String moviename = mb.getMv_eng_title();
		String imgname = moviename.replaceAll(" " , "");
		imgname = imgname.replaceAll("\\p{Z}", "");%>
			<a href="#"><div class="mv">
							<img src="./images/<%=mb.getMv_genre()%>/<%=imgname%>_s.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%=mb.getMv_kor_title()%></span><!-- 한글제목 --> 
							<span class="mv_year"><%=mb.getMv_year()%></span><!-- 년도 -->
							<span class="mv_grade"><%=mb.getMv_age()%></span><!-- 등급 -->
							<span class="mv_time"><%=mb.getMv_time()%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
							</div>
			</a>
		<%} %> 
		
	</div><!-- container -->
</article>
<!-- 아티클 영역 끝 --> 





<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->


</body>
</html>
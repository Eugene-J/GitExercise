<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄: 회원님이 보고 싶어 하는 영화</title>

  
<!-- js -->
<script src="../js/jquery-3.3.1.js"></script>

<!-- CSS -->
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/category.css" rel="stylesheet" type="text/css" media="screen"> 
  
  
<!-- 웹 폰트 : 나눔고딕 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">


</script> 
</head>





<body>


<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더 영역 -->



<!-- 크롬 기준 -->

<h2 id="categoryTitle">회원님이 보고 싶어 하는 영화</h2> 

<!-- 아티클 -->
<article>

	<div class="container">
		<!-- 한페이지에 나오는 영화수 150개로 임시 설정 -->
		
		<!--for문으로 반복 하시면 됩니다.아래의 디자인 예시 코드를 지우고 for문만 남기면 정상작동-->
		<%for(int i=0; i<40; i++){ %>
			<a href="#"><div class="mv">
							<img src="../images/sf/arrivla_s1.jpg"><!-- img src를 DB에서 가져온 그림으로 대체해 주세요 -->  
							<span class="mv_title"><%="컨택트"%></span><!-- 한글제목 --> 
							<span class="mv_year"><%="2016"%></span><!-- 년도 -->
							<span class="mv_grade"><%="12"%></span><!-- 등급 -->
							<span class="mv_time"><%="116"%><%="분"%></span><!-- 러닝타임 / 뒤의 '분'은 지우지 말것 -->
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
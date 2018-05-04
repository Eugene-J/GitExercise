<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 영역 -->
<header>
	<div class="title_logo">
		<a href="../main.ma"><img src="../images/watchu_logo.png" width="250px" height="50px"></a>
	</div>
	
<div class="clear"></div>

		
		<div class="pay">
			<a href="../payment.pa">이용권구매</a>
		</div><!--이용권구매 -->	
		
		<!-- 회원의 이름(닉네임)과 등급 세션 받아오기 -->
		<%String name=(String)session.getAttribute("name");
		  String grade=(String)session.getAttribute("grade");
		 %>

		<div class="myinfo">
  			<button class="dropbtn1"><%=name %></button>
				  <div class="dropdown-content1">
				    <a href="./mypage.me">내정보보기</a>
				    <a href="./coupon.me">쿠폰함</a>
				    <a href="./alarm.me">알림창</a>
				    <a href="./my_movie_info.me">평점내역</a>
				    <a href="./logout.me">로그아웃</a>
				  </div>
		</div><!-- 유저정보 -->
				
<div class="clear"></div>
	
		<div class="navbar">
		  	<div class="dropdown">
			    <button class="dropbtn">CATEGORY</button>
			    <div class="dropdown-content">
			     	<a href="./category.ca">애니메이션</a>
					<a href="./category.ca">공포/스릴러</a>
					<a href="./category.ca">독립영화</a>
					<a href="./category.ca">로맨스/드라마</a>
					<a href="./category.ca">액션</a>
					<a href="./category.ca">SF</a>
					<a href="./category.ca">코미디</a>
			    </div>
	  		</div> 
	  		
	  		<!-- ▽ 로그인 기능 구현시 지울 부분 -->
	  			<a href="./taste.ta">취향분석</a>
			 	<a href="./Favorite.fa">보고 싶은 영화</a>
		 		<a href="./vip_reservation.vi">only for vip</a>
		 	<!-- △ 로그인 기능 구현시 지울 부분 -->
	  		
	  		<%--주석 부분: 일반회원과 vip회원간 다른 메뉴바 => 로그인 기능 구현시 위 메뉴를 지우고 활성화 시켜주세요 --%>
			<%-- <%if(grade==null && !grade.equals("vip")){ %>
		  		<a href="../taste/taste.jsp">취향분석</a>
			 	<a href="../favorite/favorite.jsp">보고 싶은 영화</a>
			<%}else if(grade.equals("vip")){ %>
		  		<a href="../taste/taste.jsp">취향분석</a>
			 	<a href="../favorite/favorite.jsp">보고 싶은 영화</a>
		 		<a href="../vip/vip_reservation.jsp">only for vip</a>
			<%}%> --%>
			
		 	<div class="search-container">
			    <form action="./search.jsp">
			      <input type="text" placeholder="제목/감독/배우 검색" name="search">
			      <button type="submit" class="searchBtn"><img src="../images/search.png" width="20px" height="20px"></button>
			    </form>
			</div><!-- 검색창 -->
		</div><!--메인메뉴 -->
</header>

<!-- 헤더 영역 -->
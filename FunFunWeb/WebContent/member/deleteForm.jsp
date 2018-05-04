<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WAVE:/</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
<link href="../css/join.css" rel="stylesheet" type="text/css"> 
</head>
<body>

<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

		<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>회원탈퇴</li>
</ul>
</nav>


<article  id="l_article">
<h1>회원탈퇴</h1>
<div id="l_info">
				<h2>회원탈퇴</h2>
				<p>회원탈퇴를 원하시면 비밀번호를 입력해 주십시오</p>
				
			</div>
	
	<form action="deletePro.jsp" method="post" name="fr">
	<table class="ll_table">
		<tr>
			<td>ID</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="password" name="pass"></td>
		</tr>
	</table>
	<div class="clear"></div>	
		
		<div class="del">
			<p id="warning">탈퇴시 모든 정보가 삭제되며 복원할 수 없습니다</p>
			<input type="submit" value="회원탈퇴"  id="del_buttons">
		</div>
			
	</form>
</article>
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
<link href="../css/join.css" rel="stylesheet" type="text/css"> 

 </script>

</head>
<body>
<div id="wrap">
		<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더들어가는 곳 -->
		
	<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>login</li>
</ul>
</nav>

		<!-- 본문내용 -->
		<article  id="l_article">
		<h1>login</h1>
			<div id="l_info">
				<h2>Login</h2>
				<p>아이디와 비밀번호를 입력해 주십시오</p>
			</div>
				
				<form action="loginPro.jsp" id="login">
					<table  class="l_table" >
						<tr>
							<td>ID</td><td><input type="text" name="id" id="id"></td>
						</tr>
						<tr>
							<td>PASSWORD</td><td><input type="password" name="pass" id="pass"></td>
						</tr>
					</table>
				<div class="clear"></div>

					<input type="submit" value="로그인" class="submit" id="j_btn">

				</form>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->
		
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		
		<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>START</title>
<style type="text/css">


*{
	margin: 0;
	padding:0;
	box-sizing: border-box;
	background-image: url("./images/start_cover.jpg");
	background-repeat: none;
	background-size:cover;
}

.clear{clear: both;}


body{
	background-color: white;
}


.start{
	text-align:center;
	position:absolute;
	background-image:none;
	top:30%; left:0%; bottom:0%; right:0%;
}

	.start #logo{
		width: 610px; height:80px;
		background-image: none;
		margin-bottom: 50px;
	}
	
	.btn{
		display: block;
		background-image:none;
		
	}

	.btn a{
		display: inline-block;
		border: 1px solid ;
		border-radius:20px;
		width: 200px; height:60px;
		background-image:none;
		text-decoration: none;
		background-color:#ad2a51;
		margin:auto auto;
		margin-top:50px;	
		padding-left:10px;
		padding-top:16px;
		letter-spacing: 10px;
	}
	
	.btn a:FIRST-CHILD{
		background-color:#e8616a;
	}

	.btn a:LINK, .btn a:VISITED, .btn a:ACTIVE{
		color:white;
		font-weight:bold;
		font-size: 1.2em;	
	}





#pic_caption{
	background-image:none;
	font-weight: bold;
	position: absolute;
	right:0; bottom:0;
	
}


</style>
</head>
<body>

	<div class="start">
		<img src="./images/watchu_logo_2.png" id="logo">

		<div class="btn">
			<a href="./MemberLogin.me">로그인</a>
			<a href="./MemberJoin.me">회원가입</a>
		</div>
	</div>
	
	<p id="pic_caption">Photo by Jakob Owens on Unsplash</p>
</body>
</html>
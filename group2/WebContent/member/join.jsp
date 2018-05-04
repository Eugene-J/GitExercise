<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/member.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

function fun2(){
	if(document.fr.num1.value.length==6){
		document.fr.num2.focus();
	}
}
</script>
</head>
<body>
<div class="m_cover">
<div class="logo">
<a href="./MemberLogin.me"><img src="./images/watchu_logo.png" alt="logo"></a>
</div>

<div class="nav_r">
<a href="./MemberLogin.me">로그인</a>
</div>

<div class="clear"></div>

<div class="div_01">
		<div class="div_02">
			<span>회원가입</span>
		</div>
	<div>
		<form action="./MemberJoinAction.me" id="join" method="post" name="fr">
			<label>
			<input type="text" name="name" placeholder="이름 (김와츄)" >
			</label><br>
			<label>
			<input type="text" name="id" placeholder="이메일 (example@gmail.com)">
			</label><br>
			<label>
			<input type="text" name="password" placeholder="비밀번호 (6자 이상)">
			</label><br>
			<label>
			<input type="text" name="num1" placeholder="주민등록번호 앞자리" onkeyup="fun2" maxlength="6">
			</label><br>
			<label>
			<input type="text" name="num2" placeholder="주민등록번호 뒷자리" maxlength="1">
			</label><br>
		<div>
			<input type="submit" value="회원가입">
		</div>
		</form>
	</div>
</div>
</div>
</body>
</html>
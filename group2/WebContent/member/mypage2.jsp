<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>

<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>
<div class="mypage_">
	<div class="mypage_profile">
		<h2>profile</h2>
		<table class="mypage_info">
			<tr>
				<td>이메일</td>
				<td class="content">aaaa@watchu.com</td>
			</tr>
			<tr>
				<td>이름</td>
				<td class="content">홍길동</td>
			</tr>
			<tr>
				<td>등급</td>
				<td class="content">VIP</td>
			</tr>
		</table>
	</div>

</div>
</article>


<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>
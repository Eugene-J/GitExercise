<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/gallery.css" rel="stylesheet" type="text/css">
<link href="../css/writeform.css" rel="stylesheet" type="text/css">
<link href="../css/join.css" rel="stylesheet" type="text/css">

 	<script type="text/javascript">
 	
 	function check(){
 		
 		if(document.fr.id.value==""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false;
		}
 		
 		if(document.fr.pass.value==""){
			alert("비밀번호를 입력하세요");
			document.fr.pass.focus();
			return false;
		}
 		
 		
 		if(document.fr.name.value==""){
			alert("이름을 입력하세요");
			document.fr.name.focus();
			return false;
		}
 		
 		if(document.fr.email.value==""){
			alert("관리자의 메일을 받을 사용가능한 이메일주소를 입력하세요");
			document.fr.email.focus();
			return false;
		}
 		
 		
 		if(document.fr.postcode.value==""){
			alert("우편번호를 입력하세요");
			document.fr.postcode.focus();
			return false;
		}
 		
 		if(document.fr.address.value==""){
			alert("주소를 입력하세요");
			document.fr.address.focus();
			return false;
		}
 		
 		if(document.fr.address2.value==""){
			alert("상세주소를 입력하세요");
			document.fr.address2.focus();
			return false;
		}
 		
 		if(document.fr.mobile.value==""){
			alert("핸드폰번호를 입력하세요");
			document.fr.mobile.focus();
			return false;
		}
 		
 	}
 	
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
	<li>정보수정</li>
</ul>
</nav>


<article  id="w_article">
	<h1>정보수정</h1>
	<%
	String id=(String)session.getAttribute("id");
	
	if(id==null){
		%><script>
			alert("조회실패");
		</script>
		
		<% 
		response.sendRedirect("loginForm.jsp");
	}
	MemberDAO mdao=new MemberDAO(); 
	MemberBean mb=mdao.getMember(id);

%>

			<form action="updatePro.jsp" method="post" class="join" name="fr" onsubmit="return check()">
				<div id="info">
					<h2>정보수정</h2>
					<p>수정할 항목을 작성해 주십시오</p>
					</div>
				
				
				
				<table border="1" class="w_table">
			<tr>
			<td>아이디</td><td><input type="text" name="id" id="id" value=<%=id %>>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="password" name="pass" id="password" />
			</td>
		</tr>

		<tr>
			<td>이름</td><td><input type="text" name="name" id="name"  value="<%=mb.getName()%>"/></td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="email" name="email" id="email"  value="<%=mb.getEmail()%>"/></td>
		</tr>

		<tr>
			<td>주소</td><td><input type="text" name="postcode" id="postcode"  value="<%=mb.getAddress()%>" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="j_btn"><br>
				<input type="text" name="address" size='30' id="address" placeholder="주소"><br>
				<input type="text" name="address2" id="address2"  value="<%=mb.getAddress2()%>" placeholder="상세주소"><br></td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type="text" name="phone" id="phone"  value="<%=mb.getPhone()%>"/></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td><td><input type="text" name="mobile" id="mobile"  value="<%=mb.getMobile()%>"/></td>
		</tr>

	</table>

					<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
							<script>
							    function sample6_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var fullAddr = ''; // 최종 주소 변수
							                var extraAddr = ''; // 조합형 주소 변수
							
							                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    fullAddr = data.roadAddress;
							
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    fullAddr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							                if(data.userSelectedType === 'R'){
							                    //법정동명이 있을 경우 추가한다.
							                    if(data.bname !== ''){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있을 경우 추가한다.
							                    if(data.buildingName !== ''){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
							                document.getElementById('address').value = fullAddr;
							
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById('address2').focus();
							            }
							        }).open();
							    }
							</script>
							<!-- Address -->	
				
				
			<div class="clear"></div>
			
			
			
			
			<div id="join_btn">
				<input type="submit" id="u_btn" value="정보수정" class="submit" >
				<input type="button"  id="u_btn" value="뒤로가기" class="back" onclick="history.back()">
			</div>
			</form>
	</article>



<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->


</body>
</html>
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

 	<script type="text/javascript">
 	
 	function idcheck(){
 		
 		if(document.fr.id.value==""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return;
		}else{
			var id=document.fr.id.value;
 			window.open("idCheck.jsp?id="+id,"아이디 중복체크","width=300, height=200, top=100, left=100");
 		}
 	}

 	
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
 		
 		if(document.fr.pass2.value==""){
			alert("비밀번호 다시 한번 입력하세요");
			document.fr.pass2.focus();
			return false;
		}
 		
 		if(document.fr.pass.value!=document.fr.pass2.value){
 			alert("비밀번호가 일치하지 않습니다");
			document.fr.pass2.focus();
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
 		
 		if(document.fr.email2.value==""){
			alert("이메일주소를 다시 한번 입력하세요");
			document.fr.email2.focus();
			return false;
		}
 		
 		if(document.fr.email.value!=document.fr.email2.value){
 			alert("이메일주소가 일치하지 않습니다");
			document.fr.email2.focus();
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
	
	
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
	<li>join</li>
</ul>
</nav>
	
	<!-- 본문내용 -->
	<article id="j_article">
			<h1>Join Us</h1>


	<form action="joinPro.jsp" method="post" class="join" name="fr" onsubmit="return check()">
	
	<div id="info">
	<h2>회원가입</h2>
	<p>아래 항목을 작성해 주십시오</p>
	</div>
	
	<table border="1" class="w_table">
		<tr>
			<td>아이디</td><td><input type="text" name="id" id="id" />
			<input type="button" value="아이디 중복체크" class="dup" onclick="idcheck()" id="j_btn"><br>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="password" name="pass" id="password" />
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인</td><td><input type="password" name="pass2" id="password" /></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" name="name" id="name" /></td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="email" name="email" id="email" /></td>
		</tr>
		<tr>
			<td>이메일 확인</td><td><input type="email" name="email2" id="email"/></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="postcode" id="postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="j_btn"><br>
				<input type="text" name="address" size='30' id="address" placeholder="주소"><br>
				<input type="text" name="address2" id="address2" placeholder="상세주소"><br></td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type="text" name="phone" id="phone" /></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td><td><input type="text" name="mobile" id="mobile" /></td>
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

		<div id="join_btn">
			<button type="reset" id="j_btn" value="내용지우기" class="cancel">내용지우기</button>
			<button type="submit"  id="j_btn" value="회원가입" class="submit">회원가입</button>
		</div>
		<div class="clear"></div>
		
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
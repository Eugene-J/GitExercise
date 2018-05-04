<%@page import="net.vip.db.VipBean"%>
<%@page import="net.vip.db.VipResBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왓츄 : VIP </title>

<!-- css -->
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/vip.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="../js/jquery-3.3.1.js"></script>


<script type="text/javascript">

/* function seatCheck(){
	
	if(document.fr.seat[0].checked==false && document.fr.seat[1].checked==false
		&& document.fr.seat[2].checked==false && document.fr.seat[3].checked==false 
		&& document.fr.seat[4].checked==false && document.fr.seat[5].checked==false
		&& document.fr.seat[6].checked==false && document.fr.seat[7].checked==false
		&& document.fr.seat[8].checked==false && document.fr.seat[3].checked==false){
		
		alert("좌석을 선택해 주세요");
		return false;
		
	}else{
		var x=document.getElementsByNames("seat").value;
		var i;
		for(i=0;i<x.length;i++){
			alert(x[i]);
		}
		return;
	}	
} */	
$(document).ready(function(){
/* 	function check(){
	
		var checkedValue = $(".radio:checked").val(); 
		
		if($checkedValue.val()==""){
			alert("좌석을 선택하십시오");
		}else{
			alert(checkedValue +" 번 좌석을 선택하셨습니다");
		}	
	} */
	
	$('form').submit(function(){
//	 	alert("아이디:"+$('#id').val()+"비밀번호:"+$('#pass').val());
//	 	return false;

	var checked_radio = $('input:radio[name=seat]:checked').val();
	if(checked_radio === undefined) // 선택을 하지 않았을 경우
	{
	    alert('옵션을 선택해주세요.');
	    return false;
	} else {
	    /* alert(checked_radio + "를 선택하셨습니다."); */
	    document.getElementById("demo").innerHTML = checked_radio;
	    return false;
	}

	/* if($('#id').val()==""){
		alert("아이디입력하세요");
		$('#id').focus();
		return false;
	}
	if($('#pass').val()==""){
		alert("비밀번호입력하세요");
		$('#pass').focus();
		return false;
	} */	
	});
});




</script>


</head>
<body>

<%-- 
<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/> 
<!-- 헤더 영역 -->

 --%>
<!-- 아티클 영역 -->
<article>

<%
VipBean vbean= new VipBean();	
VipResBean vrbean = new VipResBean();
	
%>

 	<div class="pic_frame">
		<p class="vip_name"><%="고객이름"%><%="님"%></p>
	</div> 
	
	<div id="content">
		<table border="1">
			<tr><td>이번달의 영화</td></tr>
			<tr><td><%=vbean.getV_kor_title()%></td></tr>
			<tr><td><%=vbean.getV_eng_title()%></td></tr>				
		</table>
		<img src="../images/sf/pixel_p.jpg" width="300px" height="500px">
		
		<table border="1">	
			<tr><td>2015년작</td></tr>
			<tr><td>크리스 콜럼버스 감독</td></tr>
			<tr><td>아담 샌들러, 케빈 제임스, 미셸 모나한</td></tr>
			<tr>
				<td>1982년, 나사(NASA)는 외계와의 접촉을 희망하며 지구의 문화를 담은 타임 캡슐을 우주로 쏘아
					올렸다. 하지만 여기에 담긴 아케이드 게임을 자신들에 대한 선전포고로 오해한 외계인들은 팩맨, 갤러그, 동키콩,
					센티피드, 스페이스 인베이더의 모습으로 나타나 지구를 침공하기 시작하는데… 30년 전 동전 몇 개로 수천 번이나 세상을
					구했던 클래식 아케이드 게임의 고수 3인방은 위기에 빠진 지구를 구하기 위해 다시 한 번 뭉치게 된다. 유일하게 게임의
					룰을 지배할 수 있는 이들, 과연 현실에서도 세상을 구해낼 수 있을까?</td>
			</tr>
		</table>
		
		<table>
			<tr><td>시사회 날짜</td></tr>
			<tr><td>2018.06.22</td></tr>
			<tr><td>19:00 ~ 21:30</td></tr>
		</table>
	</div>

<span id="seet">원하시는 좌석을 선택 해 주세요</span>

<div class="seatTable">
		<span>SCREEN</span>
	
	<form action="VipResAdd.vi" method="post" name="fr">

		<label><input type="radio" class="radio"  name="seat"  value="1"><span>1</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="2"><span>2</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="3"><span>3</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="4"><span>4</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="5"><span>5</span></label>
		<br>
		<label><input type="radio" class="radio"  name="seat"  value="6"><span>6</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="7"><span>7</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="8"><span>8</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="9"><span>9</span></label>
		<label><input type="radio" class="radio"  name="seat"  value="10"><span>10</span></label>
		
		<input type="submit" value="좌석선택">
		<div class="selected">
		<p>선택하신 좌석</p>
		<p id="demo"></p>
		</div>
	</form>
</div>


<div class="clear"></div>
</div>
</article>
<!-- 아티클 영역 -->

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>
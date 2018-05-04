<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/vip.css" rel="stylesheet" type="text/css">

<script src="../js/jquery-3.3.1.js"></script>
<style>
.selected{background: red}
</style>
<script type="text/javascript">

$(document).ready(function(){
	$('label').click(function(){

		 $('input:radio[name=seat]:checked').addClass("selected");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
         /* $(this).siblings().removeClass("selected");   */ //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
		
        var checked_seat = $('input:radio[name=seat]:checked').val(); // 선택된 radio의 value 가져오기
		
        
		if(checked_seat = undefined) // 선택을 하지 않았을 경우
		{
		    alert("좌석을 선택해주십시오");
		} else {
		    alert(checked_seat + "번 좌석을 선택하셨습니다.");
		    
		}
	});
});

/* function radio_chk() {
    //라디오 버튼 Name 가져오기
    var seat = document.getElementsByName("seat");

    //라디오 버튼이 체크되었나 확인하기 위한 변수
    for(var i = 0; i<=10; i++){
        //만약 라디오 버튼이 체크가 되어있다면 true
        if(document.fr.seat[i].checked==true){
            //라디오 버튼 값
           // alert(seat[i].value);
            //라디오 버튼이 체크되면 radio_btn_check를 1로 만들어준다.
            alert(document.fr.seat[i].value +"번 좌석을 선택하셨습니다");
            
            return;
        }
    }
    
    if(document.fr.seat[i].checked==false){
        alert("좌석을 선택해주세요");
        return;
    }
} */


</script>
</head>
<body>


<!-- 헤더 영역 -->
<jsp:include page="../inc/header.jsp"/> 
<!-- 헤더 영역 -->


<!-- 아티클 영역 -->
<article>

<span id="seet">좌석을 선택 해 주세요.</span>

<div class="wrap">

<div id="screen">
	<div id="screen_2">
		<span>SCREEN</span>
	</div>
	<form action="#" method="get" name="fr" onsubmit="return check()">
		<label for="a">1<input type="radio" id="a" name="seat" value="1"></label>
		<label for="b">2<input type="radio" id="b" name="seat" value="2"></label>
		<label for="c">3<input type="radio" id="c" name="seat" value="3"></label>
		<label for="d">4<input type="radio" id="d" name="seat" value="4"></label>
		<label for="e">5<input type="radio" id="e" name="seat" value="5"></label><br>
		<label for="f">6<input type="radio" id="f" name="seat" value="6"></label>
		<label for="g">7<input type="radio" id="g" name="seat" value="7"></label>
		<label for="h">8<input type="radio" id="h" name="seat" value="8"></label>
		<label for="i">9<input type="radio" id="i" name="seat" value="9"></label>
		<label for="j">10<input type="radio" id="j" name="seat" value="10"></label>
		
		
		<input type="submit" value="좌석 선택" class="submit">
		
		<!-- <input type="button" value="라디오 버튼 선택" onclick="radio_chk()"/> -->
		
	</form>
</div>


<input type="checkbox"  name="seat1" id="field1" class="mycheckbox" value=<%=""%>  onclick="check()" disabled>
<label for="field1" class="mycheckbox-label">&nbsp&nbsp&nbsp</label>
<label><input type="checkbox" class="mycheckbox"  name="seat"  value=<%=""%> id="check" ><span>&nbsp&nbsp&nbsp</span></label>
<div id="content">
<table border="1">
	<tr>
		<th>Title</th>
		<td>영화제목</td>
	</tr>
	<tr>
		<th>Date</th>
		<td>시사회 날짜</td>
	</tr>
	<tr>
		<th>Time</th>
		<td>상영시간</td>
	</tr>
	<tr>
		<th>좌석</th>
		<td><script type="text/javascript">
				out.print("checked_seat");
			</script>
		</td>
	</tr>
</table>
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
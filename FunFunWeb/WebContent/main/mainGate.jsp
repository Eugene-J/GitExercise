<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css" rel="stylesheet">
  
body {
	background-color: black;
	paddin:0;}


	
.mainImage {/*border:1px solid red;*/
	position:absolute;
	top:0%;  bottom:0%; left:0%; right:0%;
	width:300px; height:300px;
	margin:auto auto;
	
}

.mainImage a img{
	width:300px; height:300px;


}

p#text {/* border:1px solid red;  */
	width:65px;
	background-color:white;
	font-family: "Courier New", "Gerogia","serif";
	margin: 30px auto;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	letter-spacing: 1px;

}

p#text a:LINK,p#text a:VISITED {
	color:black;
	text-decoration: none;
}

p#text a:HOVER {
	text-decoration: underline;
}



</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XXXXX</title>
</head>
<body>

		<div class="mainImage">
			<a href="main.jsp"><img alt="main" src="../images/abstractflow.gif"></a>
			<p id="text"><a href="main.jsp">XXXXX</a></p>
		</div>
	
</body>
</html>
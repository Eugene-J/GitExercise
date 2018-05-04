<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>PhotoSlide_01</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>



<!-- jQuery  -->
<script type="text/javascript" src="../js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.sliderkit.1.9.2.pack.js"></script>


<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../css/sliderkit-core.css" media="screen, projection" /> 
<link rel="stylesheet" type="text/css" href="../css/sliderkit-demos.css" media="screen, projection" /> 



<script type="text/javascript">
$(function(){
    $(".photoslider-mini").sliderkit({
        auto:false,
        autospeed:3000,
        panelbtnshover:true,
        circular:true,
        fastchange:false
    });
});
</script>



</head>


<body>
<div id="wrapper">
    <div class="sliderkit photoslider-mini">
        <div class="sliderkit-panels">
            <div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev"><a href="#" title="Previous"><span>Previous</span></a></div>
            <div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next"><a href="#" title="Next"><span>Next</span></a></div>
     
            <div class="sliderkit-panel">
                <a href="#"><img src="../images/sf/Arrival_s.jpg" alt="포토이미지1" width="500px" height="200px"/></a>
            </div>
            <div class="sliderkit-panel">
                <a href="#"><img src="../images/sf/Chappie_s.jpg" alt="포토이미지2" width="500px" height="200px"/></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
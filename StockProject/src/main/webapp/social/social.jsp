<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/jquery-1.11.2.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/highcharts/highstock.js"></script>
<script src="js/highcharts/highcharts.js"></script>
<script src="js/highcharts/highcharts-3d.js"></script>
<script src="js/highcharts/highcharts-more.js"></script>
<script src="js/highcharts/heatmap.js"></script>
<script src="js/highcharts/treemap.js"></script>
<script src="js/modules/data.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/bigjs.js"></script>
<link rel="stylesheet" href="css/material.min.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="member/mp_css/style.css">
  <style>
  .twitterdiv{
       margin:15px;
  }
  #floating {
     position: fixed;
     right: 50%;
     top: 100px;
     margin-right: -640px;
     text-align:center;
     width: 120px;
  }
  .container {
      height : 830px;
      margin-bottom : 50px;
      margin : 0 auto;
      overflow : hidden;
      padding : 5px;
      width: 1000px;
  } 
  </style>
 
<script type="text/javascript">
$(function(){
$("#rfbutton").click(function(){
   
   var a=$('#rfbutton').val();
   //alert(a);
   $.ajax({
           type:"GET",
           url:"social.do",
           data:null,
           success : function(result) {
              
           },
           error : function(xhr, status, error) {
                 alert("에러발생");
           }
        });
   });
});
</script>
</head>
<body>

   <div class="container">
   <div class="panel-body">
   <div>
      <c:forEach var="vo" items="${list }">
         <div class="twitterdiv" style="border: 2px solid; color: #5CD1E5; width: 25%; height:170px; float: left;">
            <div style="border-bottom: 1px solid; color: #5CD1E5; height:15%;" >
               <font color="black" style="font-weight: bold; font-size: small;">${vo.id }</font>
            </div>
            <div style="height:70%;">
            <span><font color="black">${vo.msg }</font><br></span></div>
            <div style="height:15%; border-top: 1px solid;"><span style="float:right; margin-right:5px;"><font color="black">${vo.regdate }</font></span>
            </div>
         </div>
      </c:forEach>
      </div>
   </div>
   <div id="floating">
   <br>
   <div><button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="rfbutton" onClick="window.location.reload()">새로고침</button></div><br>
   <div><button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="$('.container').stop().animate({scrollTop:'-=840'})">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위로 </button></div><br>
   <div><button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="$('.container').stop().animate({scrollTop:'+=840'})">&nbsp;아래로</button></div>
   </div>
   </div>
   
</body>
</html>
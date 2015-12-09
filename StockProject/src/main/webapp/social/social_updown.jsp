<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.2.js"></script>
  <style>
  .twitterdiv{
  	margin:19px;
  }
   .dropbox {
    height : 830px;
    margin-bottom : 50px;
    margin : 0 auto;
    overflow : hidden;
    padding : 5px;
    width: 1000px;
    
  } 
  </style>
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
<script type="text/javascript">
     function j_test(n){
         $('.left').scrollTop( $('.left').scrollTop() + n );
     }
 </script>
</head>
<body>

  <div class="container" id="dropbox" style="float:left;">                
   
    <c:forEach var="vo" items="${list }">
    
    <div class="twitterdiv" style="border:1px solid; color:brown; width:22%; height:180px; float:left;">
    	<div style="border-bottom:1px solid; color:brown">
    		<font color="black" style="font-weight:bold;">${vo.id }</font>
			<span class="badge" style="float:right; margin-top:1px;">${vo.regdate }</span>    
    	</div>
    	<div>
    		<font color="black">${vo.msg }</font>
    	</div>
    </div>
    </c:forEach>
 
				
  </div>
<div style="text-align:center; margin-top:10px; float:both;">
     <button type="button" onclick="$('#dropbox').stop().animate({scrollTop:'+=840'})">아래로</button>
     <button type="button" onclick="$('#dropbox').stop().animate({scrollTop:'-=840'})">위로</button>
 </div>

</body>
</html> --%>
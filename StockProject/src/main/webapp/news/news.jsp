<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <style>
  
  .twitterdiv{
  	margin:15px;
  }
  
  #cursor:hover{
  	color:blue;
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
</head>
<body>
	<center>
		 <table id="table_content" style="float:left; margin-left: 22px;">
		 	<tr>
		 		<td><a id="cursor" href=news.do?find=삼성SDS style="text-decoration: none">삼성</a></td>
		 		<td><a id="cursor" href=news.do?find=LG전자 style="text-decoration: none">LG전자</a></td>
		 		<td><a id="cursor" href=news.do?find=SKT style="text-decoration: none">SKT</a></td>
		 		<td><a id="cursor" href=news.do?find=네이버 style="text-decoration: none">네이버</a></td>
		 		<td><a id="cursor" href=news.do?find=한빛소프트 style="text-decoration: none">한빛소프트</a></td>
		 		<td><a id="cursor" href=news.do?find=게임빌 style="text-decoration: none">게임빌</a></td>
		 		<td><a id="cursor" href=news.do?find=네오위즈 style="text-decoration: none">네오위즈</a></td>
		 		<td><a id="cursor" href=news.do?find=아마존 style="text-decoration: none">Amazon</a></td>
		 		<td><a id="cursor" href=news.do?find=AT&T style="text-decoration: none">AT&T</a></td>
		 		<td><a id="cursor" href=news.do?find=애플 style="text-decoration: none">Apple</a></td>
		 		<td><a id="cursor" href=news.do?find=MicroSoft style="text-decoration: none">MS</a></td>
		 		<td><a id="cursor" href=news.do?find=인텔 style="text-decoration: none">인텔</a></td>
		 		<td><a id="cursor" href=news.do?find=어도비 style="text-decoration: none">어도비</a></td>
		 		<td><a id="cursor" href=news.do?find=NVIDIA style="text-decoration: none">NVIDIA</a></td>
		 		<td><a id="cursor" href=news.do?find=FaceBook style="text-decoration: none">페이스북</a></td>
		 		<td><a id="cursor" href=news.do?find=NetFilx style="text-decoration: none">NetFlix</a></td>
		 		<td><a id="cursor" href=news.do?find=구글 style="text-decoration: none">구글</a></td>
		 	</tr>
		 </table>
	</center>
	<div class="container">
	<div>
		<c:forEach var="item" items="${list }">

			<div class="twitterdiv" style="border: 1px solid; color: #5CD1E5; width: 25%; height:210px; float: left;">
				<div style="border-bottom: 1px solid; color:#5CD1E5; height:20%;">
				<a href="${item.link }" target="blank" style="text-decoration: none;">
					<font id="cursor" color="black" style="font-weight: bold; font-size: small;">${item.title }</font></a>
				</div>	
				<div style="height:60%;">
				<a href="${item.link }" target="blank" style="text-decoration: none;">
				<span><font id="cursor" color="black">${item.description }</font><br></span></a>
				</div>
				<div style="height:20%; border-top:1px solid; color: #5CD1E5;"><span style="float:right; margin-top:8px; margin-right:5px;"><font color="black">${item.pubDate }</font></span>
				</div>
			</div>
		</c:forEach>
	</div>
<div id="floating">
	<br>
	<div><button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="$('.container').stop().animate({scrollTop:'-=840'})">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위로</button></div><br>
	<div><button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="$('.container').stop().animate({scrollTop:'+=840'})">&nbsp;아래로</button></div>
	</div>
	</div>
</body>
</html>

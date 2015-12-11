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
	  top: 55px;
	  margin-right: -600px;
	  text-align:center;
	  width: 120px;
  }
  .container {
      height : 830px;
      margin-bottom : 50px;
      margin : 0 auto;
      overflow : hidden;
      padding : 5px;
      width: 1200px;
  }
  </style>
</head>
<body>
	<center>
	<div>
		 <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="float:left; margin-left: 22px; margin-top:10px; position:fixed;">
			<tr>
		 		<td><a id="cursor" href=news.do?find=삼성SDS style="text-decoration: none">삼성SDS</a></td>
		 		<td><a id="cursor" href=news.do?find=LG전자 style="text-decoration: none">LG전자</a></td>
		 		<td><a id="cursor" href=news.do?find=SKT style="text-decoration: none">SK Telecom</a></td>
		 		<td><a id="cursor" href=news.do?find=KT style="text-decoration: none">KT</a></td>
		 		<td><a id="cursor" href=news.do?find=엔씨소프트 style="text-decoration: none">엔씨소프트</a></td>
		 		<td><a id="cursor" href=news.do?find=네이버 style="text-decoration: none">네이버</a></td>
		 		<td><a id="cursor" href=news.do?find=신세계I&S style="text-decoration: none">신세계IandS</a></td>
		 		<td><a id="cursor" href=news.do?find=LG유플러스 style="text-decoration: none">LG유플러스</a></td>
		 		<td><a id="cursor" href=news.do?find=효성ITX style="text-decoration: none">효성 ITX</a></td>
		 		</tr>
		    <tr style="float:center;">
		 		<td><a id="cursor" href=news.do?find=아마존 style="text-decoration: none">아마존</a></td>
		 		<td><a id="cursor" href=news.do?find=애플 style="text-decoration: none">애플</a></td>
		 		<td><a id="cursor" href=news.do?find=마이크로소프트 style="text-decoration: none">마이크로소프트</a></td>
		 		<td><a id="cursor" href=news.do?find=인텔 style="text-decoration: none">인텔</a></td>
		 		<td><a id="cursor" href=news.do?find=NVIDIA style="text-decoration: none">NVIDIA</a></td>
		 		<td><a id="cursor" href=news.do?find=FaceBook style="text-decoration: none">페이스북</a></td>
		 		<td><a id="cursor" href=news.do?find=NetFilx style="text-decoration: none">NetFlix</a></td>
		 		<td><a id="cursor" href=news.do?find=구글 style="text-decoration: none">구글</a></td>
		 		<td><a id="cursor" href=news.do?find=페이팔 style="text-decoration: none">페이팔</a></td>
		 	</tr>
		 </table>
		 </div>
	</center>
	<div class="container">
	<div style="margin-top:100px;">
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
	<div style="text-align: center">
	<img src="<%=request.getContextPath()%>/news/news.png" width=800 height=800>
	</div>
	</div>
</body>
</html>

<!-- # 국내
   SKT : SK Telecom Co. Ltd. (017670.KS) 
   KT : KT Corp. (030200.KS)
   엔씨 소프트 : NCsoft Corporation (036570.KS)
   네이버 : Naver Corporation (035420.KS)
   LG전자 : LG Electronics Inc. (066570.KS)
   삼성sds : Samsung SDS Co., Ltd. (018260.KS)
   신세계 I&S : SHINSEGAE Information & Communication Co., LTD (035510.KS)
   LG유플러스 :  LG Uplus Corp. (032640.KS)
   효성 ITX : Hyosung ITX Co. Ltd. (094280.KS)
   나이스 : NICE Holdings Co., Ltd. (034310.KS)
   KTcs : KTCS Corporation (058850.KS)
   삼성에스원 : S-1 Corporation (012750.KS)
         

# 해외
   아마존 : Amazon.com, Inc. (AMZN) 
   AT&T : AT&T, Inc. (T)
   애플 : Apple Inc. (AAPL)
   마이크로소프트 : Microsoft Corporation (MSFT)
   인텔 : Intel Corporation (INTC)
   어도비 : Adobe Systems Incorporated (ADBE)
   NVIDIA : NVIDIA Corporation (NVDA) 
   FaceBook : Facebook, Inc. (FB)
   Netflix : Netflix, Inc. (NFLX)
   구글 : Alphabet Inc. (GOOG)
   paypal : PayPal Holdings, Inc. (PYPL)
   퀄컴 : QUALCOMM Incorporated (QCOM) -->
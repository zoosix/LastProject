<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/table.css"/> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
$("#cbtn").click(function(){
	var bno=${bno };
	var page=1;
	var param="bno="+bno+"&page="+page;
	$.ajax({
           type:"POST",
           url:"inform_reply.do",
           data: param,
           success : function(result) {
                 // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                 // TODO
                 $('.comment_view').html(result);
           },
           error : function(xhr, status, error) {
                 alert("에러발생");
           }
     });
});
});
</script>
<style>
.demo-card-wide.mdl-card {
  width: 512px;
}
.demo-card-wide > .mdl-card__title {
  color: #fff;
  height: 176px;
  background: url('images/SDS.jpg') center / cover;
}
.demo-card-wide > .mdl-card__menu {
  color: #fff;
}
</style>
</head>
<body>
<br><br>
<center>
<table class="mdl-data-table mdl-js-data-table mdl-data-table" align="center">
  <thead>
    <tr>
    	<c:forEach begin="0" end="3">
      		<th class="mdl-data-table__cell--non-numeric">국/해외</th>
      		<th class="mdl-data-table__cell--non-numeric">회사명</th>
    	</c:forEach>
    </tr>
  </thead>
  <tbody>
  	
   		 <tr>	
   		 		<td>국내</td>
     			<td><a href=inform_main.do?bno=1>SKT</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=2>KT</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=3>NCsoft</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=4>Naver</a></td>
     			
     	 </tr>
     	  <tr>	
     	  		<td>국내</td>
     			<td><a href=inform_main.do?bno=5>LG Electronics</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=6>Samsung SDS</a></td>
   		 		<td>국내</td>
     			<td><a href=inform_main.do?bno=7>SHINSEGAE I&C</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=8>LG Uplus</a></td>
     			
     	 </tr>
     	  <tr>	
     	  		<td>국내</td>
     			<td><a href=inform_main.do?bno=9>Hyosung ITX</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=10>NICE</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=11>KTCS</a></td>
     			<td>국내</td>
     			<td><a href=inform_main.do?bno=12>Samsung S-1</a></td>
   		 		
     	 </tr>
     	  <tr>	<td>해외</td>
     			<td><a href=inform_main.do?bno=13>Amazon</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=14>AT&T</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=15>Apple</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=16>Microsoft</a></td>
     	 </tr>
     	 <tr>
     	 		<td>해외</td>
     			<td><a href=inform_main.do?bno=17>Intel</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=18>Adobe</a></td>
   		 		<td>해외</td>
     			<td><a href=inform_main.do?bno=19>NVIDIA</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=20>Facebook</a></td>
     	 </tr>
     	 <tr>
     	 		<td>해외</td>
     			<td><a href=inform_main.do?bno=21>Netflix</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=22>Alphabet</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=23>PayPal</a></td>
     			<td>해외</td>
     			<td><a href=inform_main.do?bno=24>QUALCOMM</a></td>
     	 </tr>
  </tbody>
</table>
</center>
<br><br>
<center>
	<div class="demo-card-wide mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title">
    <h2 class="mdl-card__title-text">Welcome</h2>
  </div>
  <div class="mdl-card__supporting-text">
   <font style="font-size: 9pt">
  ${list.d1_name}&nbsp;&nbsp;
  ${list.d1_kosipi}&nbsp;&nbsp;
  ${list.d1_WICS}<br>
  ${list.d1_EPS}&nbsp;&nbsp;&nbsp;${list.d1_BPS}&nbsp;&nbsp;&nbsp;${list.d1_PER}&nbsp;&nbsp;&nbsp;<br>
  ${list.d1_up_PER}&nbsp;&nbsp;&nbsp;${list.d1_PBR}&nbsp;&nbsp;&nbsp;${list.d1_income} 
   </font>
  
  </div>
  <div class="mdl-card__actions mdl-card--border">
  <font style="font-size: 6px">
 * PER : 전일자 보통주 수정주가 / 최근결산 EPS
 * 배당수익률 : 최근 결산 수정DPS(현금+주식) / 전일자 보통주 수정주가
 * PBR : 전일자 보통주 수정주가 / 최근결산 BPS
 * WICS : WISEfn Industry Classification Standard, modified by WISEfn
 * PER 값이 (-)인 것은 당기순이익 값이 (-)인 적자상태를 의미합니다.
 </font>
  </div>
  <div class="mdl-card__menu">
    <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
      <i class="material-icons">share</i>
    </button>
  </div>
</div>
</center>
<center>
<h3>회사소개</h3>	
	<table class="mdl-data-table mdl-js-data-table mdl-data-table" align="center" >
	  <tbody>
	  		<tr>
	  			<td colspan="1" width="30%" style="background-color: #dcdcdc; text-align: center;">본사주소</td>
	  			<td colspan="3" width="70%" style="text-align: center;">삼성SDS</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">홈페이지</td>
	  			<td width="30%"></td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">대표전화</td>
	  			<td width="30%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">설립일</td>
	  			<td width="30%"></td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">대표이사</td>
	  			<td width="30%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">계열</td>
	  			<td width="30%"></td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">종업원수</td>
	  			<td width="30%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">발행주식수(보통/우선)</td>
	  			<td width="30%"></td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">감사인</td>
	  			<td width="30%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">명의개서</td>
	  			<td width="30%"></td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">주거래은행</td>
	  			<td width="30%"></td>
	  		</tr>
	  </tbody>
	</table>
<br><br>
<h3>최근연혁</h3>	
	<table class="mdl-data-table mdl-js-data-table mdl-data-table" align="center" >
	  <tbody>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">날짜값</td>
	  			<td width="80%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">날짜값</td>
	  			<td width="80%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">날짜값</td>
	  			<td width="80%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">날짜값</td>
	  			<td width="80%"></td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">날짜값</td>
	  			<td width="80%"></td>
	  		</tr>
	  </tbody>
	</table>
</center>
<br><br><br>
	<center>
     <div class="comment_view" id="comment_view">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" id="cbtn">댓글달기&보기</button>
	</div>
   </center>
</body>
</html>

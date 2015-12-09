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
 /*  background: url('image/logo/logo_'+'bno') center / cover; */
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
  <div class="mdl-card__title" id="con">
  </div>
  <div class="mdl-card__supporting-text">
    <font style="font-size: 9pt">
  ${list1.d1_name}&nbsp;&nbsp;
  ${list1.d1_kosipi}&nbsp;&nbsp;
  ${list1.d1_WICS}<br>
  ${list1.d1_BPS}&nbsp;&nbsp;&nbsp;${list1.d1_PER}&nbsp;&nbsp;&nbsp;<br>
  ${list1.d1_up_PER}&nbsp;&nbsp;&nbsp;${list1.d1_PBR}&nbsp;&nbsp;&nbsp;${list1.d1_income}  
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
	  			<td colspan="3" width="70%" style="text-align: center;">${list3.d3_addr}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">홈페이지</td>
	  			<td width="30%">${list3.d3_homep}</td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">대표전화</td>
	  			<td width="30%">${list3.d3_call}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">설립일</td>
	  			<td width="30%">${list3.d3_create}</td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">대표이사</td>
	  			<td width="30%">${list3.d3_addr}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">계열</td>
	  			<td width="30%">${list3.d3_mainName}</td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">종업원수</td>
	  			<td width="30%">${list3.d3_worker}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">발행주식수(보통/우선)</td>
	  			<td width="30%">${list3.d3_stock}</td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">감사인</td>
	  			<td width="30%">${list3.d3_detect}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">명의개서</td>
	  			<td width="30%">${list3.d3_gaesi}</td>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">주거래은행</td>
	  			<td width="30%">${list3.d3_bank}</td>
	  		</tr>
	  </tbody> 
	</table>
<br><br>

<h3>최근연혁</h3>	
 	<table class="mdl-data-table mdl-js-data-table mdl-data-table" align="center" >
	  <tbody>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list4.d4_con1}</td>
	  			<td width="80%">${list5.d5_con1}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list4.d4_con2}</td>
	  			<td width="80%">${list5.d5_con2}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list4.d4_con3}</td>
	  			<td width="80%">${list5.d5_con3}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list4.d4_con4}</td>
	  			<td width="80%">${list5.d5_con4}</td>
	  		</tr>
	  </tbody>
	</table> 
<br><br>	
	<h3>시세및 주주 현황&nbsp;&nbsp;<font size="2pt" color="gray">[기준:2015.12.09]</font></h3>
 	<table class="mdl-data-table mdl-js-data-table mdl-data-table" align="center" >
	  <tbody>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">주가/전일대비/수익률</td>
	  			<td width="80%">${list8.d8_con1}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">52Weeks 최고/최저</td>
	  			<td width="80%">${list8.d8_con2}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">액면가</td>
	  			<td width="80%">${list8.d8_con3}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">거래량/거래대금</td>
	  			<td width="80%">${list8.d8_con4}</td>
	  		</tr>
	  			<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">시가총액</td>
	  			<td width="80%">${list8.d8_con5}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">52주베타</td>
	  			<td width="80%">${list8.d8_con6}</td>
	  		</tr>
	  	 	<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">발행주식수/유통비율</td>
	  			<td width="80%">${list8.d8_con8}</td>
	  		</tr>
	  		 <tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">외국인지분율</td>
	  			<td width="80%">${list8.d8_con8}</td>
	  		</tr>
	  		 <tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">수익률<font color="gray">(1M/3M/6M/1Y)</font></td>
	  			<td width="80%">${list8.d8_con9}</td> 
	  		</tr> 
	  </tbody>
	</table> 
	  <br><br>	
	<h3>주요제품 매출구성&nbsp;&nbsp;<font size="2pt" color="gray">* 단위 : %</font></h3>
 	<table class="mdl-data-table mdl-js-data-table mdl-data-table" align="center" >
	  <tbody>
	
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list4.d4_con1}</td>
	  			<td width="80%">${list4.d4_con1}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list6.d6_con2}</td>
	  			<td width="80%">${list7.d7_con2}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list6.d6_con3}</td>
	  			<td width="80%">${list7.d7_con3}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list6.d6_con4}</td>
	  			<td width="80%">${list7.d7_con4}</td>
	  		</tr>
	  		 <tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list6.d6_con5}</td>
	  			<td width="80%">${list7.d7_con5}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list6.d6_con6}</td>
	  			<td width="80%">${list7.d7_con6}</td>
	  		</tr>
	  		<tr>
	  			<td width="20%" style="background-color: #dcdcdc; text-align: center;">${list6.d6_con7}</td>
	  			<td width="80%">${list7.d7_con7}</td>
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
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

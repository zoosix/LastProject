<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bigcss.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/body.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
    	  var data = google.visualization.arrayToDataTable([
    	                                                    ['회사명', '주가',{ role: 'style' }],
    	                                                    <c:forEach var="vo" items="${elist}">
    	                                                    [
    	                                                     '<c:out value="${vo.name}"/>',   
    	                                                     <c:out value="${vo.lastPrice}"/>,
    	                                                     'color: #00ACC1'
    	                                                    ],
    	                                                  </c:forEach>
    	                                                  ]);

        var options = {
          title: '종목별 시가',/* 
          hAxis: {title: '주가', minValue: 0, maxValue: 10},
          vAxis: {title: '회사명', minValue: 0, maxValue: 10}, */
          width: 980,
          height: 480,
          legend: 'none'
        };

        var chart = new google.visualization.BarChart(document.getElementById('stock_chart'));

        chart.draw(data, options);
      }
    </script>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
</head>
<div style="width: 96%; height: 900px; margin: 2%; position: relative; overflow: hidden;">
<span style="text-align: left">${ex.date } - ${ex.ex }</span>
	<div id="wrap" style="width: 100%; height: 100%; position: absolute; overflow: hidden;">
		<div class="col-00" style="height: 100%; overflow: hidden;">
			<div id="left" style="width: 100%; height: 100%; float: left; position: absolute;">
				<div class="col-00" style="height: 45%; padding: 5px;">
					<div class="col-00" style="height: 100%; ">
						<div id="chart" style="width: 100%; height: 100%;">
							<div id="stock_chart" style="text-align: center; margin-top: -50px;margin-left: 50px">
								<div style="font-weight: 900; font-size: 40px;">종목을 선택하세요!</div>
								<br>
								<img src="image/finger.png" width="200px" height="250px">
							</div>
						</div>
					</div>
				</div>
				<div class="col-00" style="height: 45%; position: relative; overflow: hidden;">
					<div style="width: 90%; height: 100%; float: left; position: relative;">
						<div id="updown" class="col-00" style="width: 100%; height: 65%; position: absolute;">
							<div class="col-00" style="height: 20px;">
								<div style="width: auto; height: 100%; padding-right: 5px; float: left; font-weight: bold;">
									<font class="all" id="all" style="cursor: pointer;">전체</font>
									<font class="all" id="kor" style="cursor: pointer;">국내</font>
									<font class="all" id="for" style="cursor: pointer;">해외</font>
									<!-- <font class="more" style="cursor: pointer;"> </font>
									<font class="back" style="cursor: pointer; display: none;">ø </font> -->
									<!-- <div class="aaa" id="aaa">
										<input type="button" class="abtn" id="abtn" value="click">
									</div> -->

								</div>
							</div>
							<div id="updown2" class="col-00" style="height: 80%; overflow: auto;">
							<c:forEach var="vo" items="${list }">
								<div class="col-25" style="height: 60px; width: 195px; padding: 5px; float: left;">
									<div class="col-00" style="height: 100%; border: 1px solid rgba(140, 140, 140, .9);">
										<div class="cname" class="col-00" style="height: 30px; padding:5px; text-align: center; font-size: 15px; font-weight: 900; color: black; cursor: pointer; overflow: hidden;">
											${vo.name }
											<input class="symbol" type="hidden" name="symbol" value="${vo.symbol }">
											<input class="name" type="hidden" name="name" value="${vo.name }">
											<input class="lastDate" type="hidden" name="lastDate" value="${vo.lastDate }">
											<input class="lastTimePrice" type="hidden" name="lastTimePrice" value="${vo.lastTimePrice }">
											<input class="lastPrice" type="hidden" name="lastPrice" value="${vo.lastPrice }">
											<input class="marketTotal" type="hidden" name="marketTotal" value="${vo.marketTotal }">
											<input class="open" type="hidden" name="open" value="${vo.open }">
											<input class="previousClose" type="hidden" name="previousClose" value="${vo.previousClose }">
											<input class="lastTime" type="hidden" name="lastTime" value="${vo.lastTime }">
											<input class="week52Low" type="hidden" name="week52Low" value="${vo.week52Low }">
											<input class="week52High" type="hidden" name="week52High" value="${vo.week52High }">
											<input class="dayLow" type="hidden" name="dayLow" value="${vo.dayLow }">
											<input class="dayHigh" type="hidden" name="dayHigh" value="${vo.dayHigh }">
											<input class="change" type="hidden" name="change" value="${vo.change }">
										</div>
										<div class="col-00" style="height: 20px; text-align: center; font-weight: bold; color: ${vo.tcolor.equals('+')?'#f42866':'#00ACC1'};">${vo.tcolor.equals("+")?"▲":"▼"}&nbsp;${vo.lastPrice }&nbsp;&nbsp;&nbsp;&nbsp;${vo.change }</div>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
						<style>
						.mdl-data-table td,th {height:30px; !important;}
						.mdl-data-table th{text-align:left; height:30px;}
						
						</style>
						<div id="list" style="width: 100%; height: 40%; position: absolute; top: 230px;">
							<div style="width: 45%; height: 90%; padding: 5px; float: left;">
									<div id="com1_detail" style="width: 100%; height: 80%; font-weight: bold; font-size: 15px;">
									<input type="hidden" id="com1" class="com1" name="com1">
										<table class="mdl-data-table mdl-js-data-table"  style="width:400px;"><!-- class="table table-striped" -->
										  <thead>
										    <tr style="height: 30px; !important;">
										      <th align="left" id="compare1" style="font-weight: bold; font-size: 15px;" colspan=3>좌클릭 종목선택</th>
										      <th id="com1_more"><a href="#">상세보기</a></th>
										    </tr>
										  </thead>
										  <tbody>
										    <tr style="height: 30px; !important;">
												<td>시가</td>
												<td class="lastPrice2"></td>
												<td>전날 종가</td>
												<td class="previousClose2"></td>
										    </tr>
										    <tr style="height: 30px; !important;">
										      <td>고가</td>
												<td class="dayHigh2"></td>
												<td>오픈가</td>
												<td class="open2"></td>
										    </tr>
										    <tr style="height: 30px; !important;">
										      <td>저가</td>
												<td class="dayLow2"></td>
												<td>시총</td>
												<td class="marketTotal2"></td>
										    </tr>
										    <tr style="height: 30px; !important;">
										      <td>52주 최저</td>
												<td class="week52Low2"></td>
												<td>52주 최고</td>
												<td class="week52High2"></td>
										    </tr>
										  </tbody>
										</table>	
								</div>
							</div>
							<div style="width: 45%; height: 90%;padding: 5px 0px 5px; float: left;">
									<div id="com2_detail" style="width: 100%; height: 80%; padding:0px 10px 5px; font-weight: bold; font-size: 15px;">
									<input type="hidden" id="com2" class="com2" name="com2">
										<table class="mdl-data-table mdl-js-data-table"  style="width:400px;"><!-- class="table table-striped" -->
										  <thead>
										    <tr style="height: 30px; !important;">
										      <th align="right" id="compare2" style="font-weight: bold; font-size: 15px;" colspan=3>우클릭 종목선택</th>
										      <th id="com2_more"><a href="#">상세보기</a></th>
										    </tr>
										  </thead>
										  <tbody>
										    <tr style="height: 30px; !important;">
												<td>시가</td>
												<td class="lastPrice2"></td>
												<td>전날 종가</td>
												<td class="previousClose2"></td>
										    </tr>
										    <tr style="height: 30px; !important;">
										      <td>고가</td>
												<td class="dayHigh2"></td>
												<td>오픈가</td>
												<td class="open2"></td>
										    </tr>
										    <tr style="height: 30px; !important;">
										      <td>저가</td>
												<td class="dayLow2"></td>
												<td>시총</td>
												<td class="marketTotal2"></td>
										    </tr>
										    <tr style="height: 30px; !important;">
										      <td>52주 최저</td>
												<td class="week52Low2"></td>
												<td>52주 최고</td>
												<td class="week52High2"></td>
										    </tr>
										  </tbody>
										</table>	
								</div>
							</div>
						</div>
					</div>
					<div id="comp_btn_wrap" style="width: 10%; height: 85%; float: left;">
						<div style="width: 90%; height: 50%; padding: 5px;">
							<div id="back_btn" style="width: 100%; height: 100%; padding-top: 100px; text-align: center; font-weight: bold;  cursor: pointer;">
								 <button class="mdl-button mdl-js-button mdl-button--icon" style="width:80px;height:80px;color:#00acc1">
                             <i class="material-icons" style="top:20px;left:10px;line-height:54px;width:54px;font-size:84px;!important;">expand_less</i>
                             
                           </button>
							</div>
						</div>
						<div style="width: 90%; height: 50%; padding: 5px;">
							<div id="compare_btn" style="width: 100%; height: 100%; padding-top: 80px; text-align: center; font-weight: bold;  cursor: pointer">
								<!-- Accent-colored raised button with ripple -->
                             <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="font-size: 40px; height:80px; ">
   							<font style="font-size: 12px;">Compare</font><br></button>	
							</div>
						</div>
					</div>
				</div>
				<div style="width: 100%; height: 60%; padding-top: 15px;">
					<div id="stock_compare" style="width: 100%; height: 90%; padding-top: 15px;"></div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
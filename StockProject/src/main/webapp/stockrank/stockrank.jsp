<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/table.css">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['이름', '클릭수'],
    <c:forEach var="vo" items="${list }">
      [
       //'aa',10
       '<c:out value="${vo.name}"/>', 
       <c:out value="${vo.searchRate}"/>
      ],
    </c:forEach>
  ]);

  var options = {
    //title: '주식 순위',
    is3D:true
  };

  var chart = new google.visualization.PieChart(document.getElementById('chart'));
  chart.draw(data, options);
}
</script>
</head>
<body>
 
<center>
<div class="wrapper">
         <div id="chart" style="width:640px;height:480px"></div>
         <%-- <img src="${image }" style="width:900px; height:200px;"> --%>
</div>
	<table>
	
	<thead>
		<tr>
			<th align=center>순위</th>
			<th align=center>종목</th>
			<th align=center>검색비율</th>
			<th align=center>현재가</th>
			<th align=center>전일비</th>
			<th align=center>등락률</th>
			<th align=center>거래량</th>
			<th align=center>시가</th>
			<th align=center>고가</th>
			<th align=center>저가</th>
			<th align=center>PER</th>
			<th align=center>ROE</th>
		</tr>
		</thead>
		<tbody class="stockrank">
		<c:forEach var="vo" items="${list }">
			<tr>
				<td align=center>${vo.no }</td>
				<td align=center>${vo.name }</td>
				<td align=center>${vo.searchRate }%</td>
				<td align=center>${vo.now }</td>
				<td align=center>${vo.compare }</td>
				<td align=center>${vo.percent }</td>
				<td align=center>${vo.amount }</td>
				<td align=center>${vo.price }</td>
				<td align=center>${vo.high }</td>
				<td align=center>${vo.low }</td>
				<td align=center>${vo.per }</td>
				<td align=center>${vo.roe }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</center>
</body>
</html>

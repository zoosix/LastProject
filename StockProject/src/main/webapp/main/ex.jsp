<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$.getJSON("https://query.yahooapis.com/v1/public/yql?q=" + encodeURIComponent("select Date, Open, High, Low, Close, Volume from csv where url='http://real-chart.finance.yahoo.com/table.csv?s=AAPL&d=04&e=17&f=2012&g=d&a=2&b=27&c=2012&ignore=.csv' and columns='Date,Open,High,Low,Close,Volume,Adj Close'") + "&format=json&callback=?", function (data) {
	var result=JSON.stringify(data);
	
	$('#ex').text(result);
});
</script>
</body>
<div id="ex"></div>
</html>
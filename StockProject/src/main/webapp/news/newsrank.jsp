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


<table id="table_content">
			       <c:forEach var="vo" items="${fList }">
			         <tr>
			           <td>${vo.word }</td>
			           <td>${vo.word }</td>
			         </tr>
			       </c:forEach>
			     </table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link rel="stylesheet" href="member/mp_css/style.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar"	data-offset="50">
	<section id="portfolio">
	<div class="container">
		<c:forEach var="f" items="${list }">
			<div class="col-sm-3" style="margin: 20px;">
				<div class="panel panel-default text-center">
					<!-- <div class="panel-heading">
              <h1>Project 1</h1>
            </div> -->
					<div class="panel-body">
						<table class="order-table">
		<thead>
			<tr>
				<th>현재가</th>
				<th>전일대비</th>
				<th>등락률</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${f.lastPrice }</td>
				<td>${f.previousClose }</td>
				<td>${f.rate}</td>
			</tr>
		</tbody>
	</table>
							<%-- 
							<td><frm:formatNumber value="1000000" type="currency"/></td>
				<td><frm:formatNumber value="${f.lastPrice/f.previousClose }" pattern=".00"/></td>
				<td><frm:formatNumber value="${((f.lastPrice-f.previousClose)/f.previousClose)*100}" pattern=".00"/></td>
							<ul>
								<li width=40% align="center">현재가</li>
								<li width=30% align="center">전일대비</li>
								<li width=30% align="center">등락률</li>
							</ul>
							<ul>
								<li width=40%>${f.lastPrice }</li>
								<li width=30%>${f.lastPrice/f.previousClose }</li>
								<li width=30%>${((f.lastPrice-f.previousClose)/f.previousClose)*100}</li>
							</ul> --%>
						</div>
						<!-- <img class="img-responsive"
							src="http://tupublicidadeninternet.es.s3-website-eu-west-1.amazonaws.com/img/placeholder.png" /> -->
					<div class="panel-footer plan">
						<button class="btn btn-lg" style="font-size: 12px;">${f.name }</button>
					</div>
				</div>
			</div>
		</c:forEach>
		
		
<!-- <script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script	src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script> -->

<script src="member/mp_js/index.js"></script>




</body>
</html>

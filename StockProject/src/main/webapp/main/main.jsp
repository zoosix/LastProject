<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kor">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FinalProject</title>
<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="images/touch/ms-touch-icon-144x144-precomposed.png">
<meta name="msapplication-TileColor" content="#3372DF">

<link rel="shortcut icon" href="images/favicon.png">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="css/material.min.css">
<link rel="stylesheet" href="css/styles.css">
<style>
#view-source {
	position: fixed;
	display: block;
	right: 0;
	bottom: 0;
	margin-right: 40px;
	margin-bottom: 40px;
}



	
  
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/jquery-1.11.2.js"></script>
<!-- <script src="js/bootstrap/bootstrap.js"></script> -->
<script src="js/highcharts/highstock.js"></script>
<script src="js/highcharts/highcharts.js"></script>
<script src="js/highcharts/highcharts-3d.js"></script>
<script src="js/highcharts/highcharts-more.js"></script>
<script src="js/highcharts/heatmap.js"></script>
<script src="js/highcharts/treemap.js"></script>
<script src="js/modules/data.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/bigjs.js"></script>
</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<header
			class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
		<div class="mdl-layout__header-row">
			<span class="mdl-layout-title">${msg }</span>
			<div class="mdl-layout-spacer"></div>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
				<label class="mdl-button mdl-js-button mdl-button--icon"
					for="search"> <i class="material-icons">search</i>
				</label>
				<div class="mdl-textfield__expandable-holder">
					<input class="mdl-textfield__input" type="text" id="search">
					<label class="mdl-textfield__label" for="search">Enter your
						query...</label>
				</div>
			</div>
			<button
				class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon"
				id="hdrbtn">
				<i class="material-icons">more_vert</i>
			</button>
			<ul
				class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right"
				for="hdrbtn">
				<li class="mdl-menu__item">About</li>
				<li class="mdl-menu__item">Contact</li>
				<li class="mdl-menu__item">Legal information</li>
			</ul>
		</div>
		</header>
				<div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
			<header class="demo-drawer-header"> <img
				src="images/user.jpg" class="demo-avatar">

			<c:if test="${sessionScope.email==null }">
						<div class="demo-avatar-dropdown">
				<span>로그인 후 이용해주세요.</span>
				<div class="mdl-layout-spacer"></div>
				<button id="accbtn"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
					<i class="material-icons" role="presentation">arrow_drop_down</i> <span
						class="visuallyhidden">Accounts</span>
				</button>
				<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
					for="accbtn">
					<li class="mdl-menu__item" id="signin"><a class="modalA" style="color:#00acc1;text-decoration: none;font-weight:500; !important;">SIGN IN</a></li>
					<li class="mdl-menu__item" aling=center><a class="modalA" style="color:#00acc1;text-decoration: none;font-weight:500; !important;" href="join.do">SIGN UP</a></li>
				</ul>
			</div>
				</c:if>
				
				
			<c:if test="${sessionScope.email!=null }">
			<div class="demo-avatar-dropdown">
				<span>${sessionScope.email}</span>
				<div class="mdl-layout-spacer"></div>
				<button id="accbtn"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
					<i class="material-icons" role="presentation">arrow_drop_down</i> <span
						class="visuallyhidden">Accounts</span>
				</button>
				<ul
					class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
					for="accbtn">
					<li class="mdl-menu__item" id="signin"><a href="logout.do" style="color:#00acc1;text-decoration: none;font-weight:500; !important;">LOGOUT</a></li>
					<li class="mdl-menu__item" aling=center><a href="mypage.do" style="color:#00acc1;text-decoration: none;font-weight:500; !important;">MYPAGE</a></li>
					<!-- <li class="mdl-menu__item"><i class="material-icons">add</i>Add
						another account...</li> -->
				</ul>
				</div>
				</c:if>
			
			
			
			</header>
			<nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
			<a class="mdl-navigation__link" href="main.do"><i
				class="mdl-color-text--blue-grey-400 material-icons"
				role="presentation">home</i>Home</a> 
				<a class="mdl-navigation__link"
				href="inform_main.do"><i class="mdl-color-text--blue-grey-400 material-icons"
				role="presentation">work</i>회사상세정보</a> 
				<a class="mdl-navigation__link" href="social.do"><i
				class="mdl-color-text--blue-grey-400 material-icons"
				role="presentation">trending_up</i>소셜분석</a>
				<a class="mdl-navigation__link" href="news.do"><i
				class="mdl-color-text--blue-grey-400 material-icons"
				role="presentation">library_books</i>실시간뉴스</a>
			<c:if test="${sessionScope.email!=null }"> <!-- 로그인해야 보일것 -->
				
				</c:if>
				<a class="mdl-navigation__link"
				href="stockrank.do"><i class="mdl-color-text--blue-grey-400 material-icons"
				role="presentation">home</i>실시간 주식 순위</a> 
			<div class="mdl-layout-spacer"></div>
			
			<a class="mdl-navigation__link" href=""><i
				class="mdl-color-text--blue-grey-400 material-icons"
				role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
			</nav>
		</div>
		<main class="mdl-layout__content mdl-color--white-100">
				    <tiles:insertAttribute name="body"/> 
				    
				    
		 <!-- ---------------------------------------------------------- -->
				     <div class="modal">
						  <div class="overlay"></div>
						  <div class="modal__contents modal--transition">
				
								<div class='login'>
								  <button class='close' id='close'></button>
								  <div class='top'>
								    <h2 style="color: #00acc1;font-size: 20px; padding: 30px 0px 20px 25px">Login</h2>
								  </div>
								   <form name="loginFrm" method="post" action="login_ok.do">
								  <div class='user'>
								    <input id='email' name='email' placeholder='Mail' type='text'>
								  </div>
								  <div class='pw'>
								    <input id='pwd' name='pwd' placeholder='Password' type='password'>
								  </div>
								  <div class='remlog'>
								    <div class="remember">
								      <input checked="checked" id="remember" name="remember" type="checkbox">
								      <label for="remember"></label>Remember me
								    </div>
								    <!-- Accent-colored raised button with ripple -->								    
								    <input type='Button' value='Sign in' onclick="login()" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
								  </div>
								  <div class='forgot'>
								    <h3>
								      Forgot your password?
								    </h3>
								    <a href='#' style="color: #46485c;  text-decoration: none;">click here</a>
								    to order a new password.
								  </div>
								  	</form>
								</div>
						  </div>
						</div>
          <script src="js/modal.js"></script>
         <link rel="stylesheet" href="css/modalcss.css">

		</main>
	</div>
	<script src="js/material.min.js"></script>
</body>
</html>


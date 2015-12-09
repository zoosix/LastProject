$(document).bind('contextmenu', function(ex){
	ex.preventDefault();
});
$(document).ready(function(){
	$('.search_input input').focusin(function(){
		$(this).css({"background":"white"});
		$(this).css({"color":"black"});
	});
	
	$('.search_input input').focusout(function(){
		currentScrollTop = $(window).scrollTop();
		$(this).css({"background":"white"});
	});
});

$(document).ready(function() {
	$("#right .more").click(function() {
		$("#left").animate({left:"-75%"},{queue:false,duration:700});
		$("#right").animate({width:"100%"},{queue:false,duration:700});
		$(".banner").css({"width":"25%"});
		$("#twit_wrap").css({"overflow":"auto"});
		$("#news_wrap").css({"overflow":"auto"});
		$(this).hide();
		$("#right .back").show();
	});
	$("#right .back").click(function() {
		$("#left").animate({left:"0"},{queue:false,duration:700});
		$("#right").animate({width:"25%"},{queue:false,duration:700});
		$(".banner").css({"width":"100%"});
		$("#twit_wrap").css({"overflow":"hidden"});
		$("#news_wrap").css({"overflow":"hidden"});
		$(this).hide();
		$("#right .more").show();
	});
	
	$("#updown .more").click(function() {
		$("#list").animate({top:"240px"},{queue:false,duration:500});
		$("#updown").animate({height:"240px"},{queue:false,duration:500});
		$("#updown2").animate({height:"210px"},{queue:false,duration:500});
		$(this).hide();
		$("#updown .back").show();
	});
	$("#updown .back").click(function() {
		$("#list").animate({top:"85px"},{queue:false,duration:500});
		$("#updown").animate({height:"28%"},{queue:false,duration:500});
		$("#updown2").animate({height:"80%"},{queue:false,duration:500});
		$(this).hide();
		$("#updown .more").show();
	});
});

$(document).ready(function(){
	$("#twit").click(function() {
		var r=parseInt(Math.random()*255);
		var g=parseInt(Math.random()*255);
		var b=parseInt(Math.random()*255);
		$(this).css({"color":"red"});
		$("#news").css({"color":"black"});
		$("#twit_wrap").css({"display":"block"});
		$("#twit_wrap .banner .line").css({"border":"1px solid rgba("+r+","+g+","+b+",.9)"});
		$("#twit_wrap .banner .line .line_b").css({"border-bottom":"1px solid rgba("+r+","+g+","+b+",.9)"});
		$("#news_wrap").css({"display":"none"});
	});
	$("#news").click(function() {
		var r=parseInt(Math.random()*255);
		var g=parseInt(Math.random()*255);
		var b=parseInt(Math.random()*255);
		$(this).css({"color":"red"});
		$("#twit").css({"color":"black"});
		$("#twit_wrap").css({"display":"none"});
		$("#news_wrap").css({"display":"block"});
		$("#news_wrap .banner .line").css({"border":"1px solid rgba("+r+","+g+","+b+",.9)"});
		$("#news_wrap .banner .line .line_b").css({"border-bottom":"1px solid rgba("+r+","+g+","+b+",.9)"});
	});
});

$(document).ready(function(){
	$("#compare_btn").click(function(){
		$("#left").animate({top:"-420px"},{queue:false,duration:700});
	});
	$("#back_btn").click(function(){
		$("#left").animate({top:"0px"},{queue:false,duration:700});
	});
})

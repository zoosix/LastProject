<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/body.js"></script>

<div id="updown2" class="col-00" style="height: 95%; overflow: auto;">
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

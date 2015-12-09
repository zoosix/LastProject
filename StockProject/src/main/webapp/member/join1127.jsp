
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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
	z-index: 900;
}
</style>
</head>
<body>
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
  <thead>
    <tr>
      <th class="mdl-data-table__cell--non-numeric">Material</th>
      <th>Quantity</th>
      <th>Unit price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Acrylic (Transparent)</td>
      <td>25</td>
      <td>$2.90</td>
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Plywood (Birch)</td>
      <td>50</td>
      <td>$1.25</td>
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Laminate (Gold on Blue)</td>
      <td>10</td>
      <td>$2.35</td>
    </tr>
  </tbody>
</table>
<!-- 
<div id="container">
		
		<!-- content -->
		<div id="content">
				
				
<form id="join_form" method="post" action="/user2/join.nhn?m=check" onsubmit="return mainSubmit(0);">		
	<input type="hidden" id="birthday" name="birthday" value="">		
	<input type="hidden" id="token_sjoin" name="token_sjoin" value="UmZnbOADXQauegl0">
	<input type="hidden" id="joinMode" name="joinMode" value="unreal">
	<input type="hidden" id="pbirthday" name="pbirthday" value="">
	<input type="hidden" id="ptelecom" name="ptelecom" value="SKT">
	<input type="hidden" id="authFlag" name="authFlag" value="N">
	<input type="hidden" id="ipinFlag" name="ipinFlag" value="N">
	<input type="hidden" id="encPswd" name="encPswd" value="">
	<input type="hidden" id="encKey" name="encKey" value="">
	<input type="hidden" id="platform" name="platform" value="PC">
	<input type="hidden" id="old_mobno" name="old_mobno" value="">
	<input type="hidden" id="old_pmobno" name="old_pmobno" value="">
	<input type="hidden" id="old_imobno" name="old_imobno" value="">
	<input type="hidden" id="old_authno" name="old_authno" value="">
	<input type="hidden" id="agentType" name="agentType" value="">
	<input type="hidden" id="captcha_type" name="captcha_type" value="image">
	<input type="hidden" id="chptchakey" name="chptchakey" value="TV3HbiIDXQGaY2x3">
	<input type="hidden" id="captchaMode" name="captchaMode" value="N">
	

				<fieldset class="join_from">						
					<legend class="blind">회원가입</legend>	
					<div class="row_group">
						<div id="idDiv" class="join_row">
							<span class="ps_box int_id">
								<input type="text" id="id" name="id" value="" maxlength="20" onfocus="toggleLabel('idLb','id', 'in');" onblur="toggleLabel('idLb','id', 'out');checkId('first')" placeholder="아이디" class="int"> 
								<label id="idLb" for="id" class="lbl">아이디</label> <button type="button" disabled="" title="delete" class="wrg">삭제</button>
							</span> 
							<!-- class:error e_info, error, error gm -->
							<div id="idMsg" class="error" style="display:none">필수 정보입니다.</div>
						</div>						
						<div id="pswd1Div" class="join_row">
							<!-- [D]normal상태 int_pass / 1단계 사용불가 int_pass_step1 / 2단계 낮음 int_pass_step2 / 3단계 적정 int_pass_step3 / 4단계 높음 int_pass_step4 -->							
							<span id="pswd1Img" class="ps_box int_pass">
								<input type="password" id="pswd1" name="pswd1" maxlength="16" onfocus="toggleLabel('pswd1Lb','pswd1','in');" onblur="toggleLabel('pswd1Lb','pswd1','out');checkPswd1('check')" ;="" onkeyup="checkShiftUp(event);" onkeypress="checkCapslock(event)" onkeydown="checkShiftDownJoin(event);" placeholder="비밀번호" class="int"> 
								<label id="pswd1Lb" for="pswd1" class="lbl">비밀번호</label> <button type="button" disabled="" title="delete" class="wrg">삭제</button>
							</span>							
							<div id="pswd1Msg" class="error" style="display:none">필수 정보입니다.</div>
						</div>
						<div id="pswd2Div" class="join_row">
							<!-- [D]normal상태 int_pass_check / 비밀번호 확인완료 int_pass_check2  -->							
							<span id="pswd2Img" class="ps_box int_pass_check">
								<input type="password" id="pswd2" name="pswd2" maxlength="16" onfocus="toggleLabel('pswd2Lb','pswd2','in');" onblur="toggleLabel('pswd2Lb','pswd2','out');checkPswd2('check')" ;="" onkeyup="checkShiftUp(event);" onkeypress="checkCapslock2(event)" onkeydown="checkShiftDown(event);" placeholder="비밀번호 재확인" class="int"> 
								<label id="pswd2Lb" for="pswd2" class="lbl">비밀번호 재확인</label> <button type="button" disabled="" title="delete" class="wrg">삭제</button>
							</span> 
							<div id="pswd2Msg" class="error" style="display:none">필수 정보입니다.</div>
						</div>
					</div>

					<div class="row_group">
						<div id="nmDiv" class="join_row">
							<span class="ps_box">
								<input type="text" id="nm" name="nm" maxlength="40" value="" onfocus="toggleLabel('nmLb','nm','in');" onblur="toggleLabel('nmLb','nm','out');checkName('check')" placeholder="이름" class="int"> 
								<label id="nmLb" for="nm" class="lbl">이름</label> <button type="button" disabled="" title="delete" class="wrg">삭제</button>
							</span>
							<div id="nmMsg" class="error" style="display:none">필수 정보입니다.</div>
						</div>						
						<div id="sexDiv" class="join_row join_sex">
							<span class="row_title blind"> 성별 </span>
							<span class="sex">
								<span class="jender"><input type="radio" id="man" name="sex" value="0" onclick="checkSex()"><label id="manLb" for="man">남자 </label>
								</span><span class="jender"><input type="radio" id="woman" name="sex" value="1" onclick="checkSex()"><label id="womanLb" for="woman">여자 </label></span>
							</span>
							<span id="sexMsg" class="error" style="display:none">필수 정보입니다.</span>
						</div>
						
						<div id="birthdayDiv" class="join_row join_birthday">
							<div class="join_birth">
								<div class="bir_title"><span>생일</span></div>
								<div class="bir_yy">
									<span class="ps_box">
										<input type="text" id="yy" maxlength="4" value="" onfocus="toggleLabel('yyLb','yy','in');" onblur="toggleLabel('yyLb','yy','out');checkBirthday('check')" placeholder="년(4자)" class="int"> 
										<label id="yyLb" for="yy" class="lbl">년(4자)</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
									</span>
								</div>
								<span class="cell">|</span>
								<div class="bir_mm">
									<span class="ps_box">
										<select id="mm" title="월" class="sel" onchange="checkBirthday('check')">
											<option value="">월</option>
										  	 			<option value="1">1</option>
										  	 			<option value="2">2</option>
										  	 			<option value="3">3</option>
										  	 			<option value="4">4</option>
										  	 			<option value="5">5</option>
										  	 			<option value="6">6</option>
										  	 			<option value="7">7</option>
										  	 			<option value="8">8</option>
										  	 			<option value="9">9</option>
										  	 			<option value="10">10</option>
										  	 			<option value="11">11</option>
										  	 			<option value="12">12</option>
										</select>
									</span>
								</div>
								<span class="cell">|</span>
								<div class=" bir_dd">
									<span class="ps_box">
										<input type="text" id="dd" maxlength="2" value="" onfocus="toggleLabel('ddLb','dd','in');" onblur="toggleLabel('ddLb','dd','out');checkBirthday('check')" placeholder="일" class="int"> 
										<label id="ddLb" for="dd" class="lbl">일</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
									</span>
								</div>
							</div>
							<span id="birthdayMsg" class="error" style="display:none">필수 정보입니다.</span>
						</div>
						<div id="emailDiv" class="join_row join_email">
							<span class="ps_box int_email">
								<input type="text" id="email" name="email" maxlength="100" value="" onfocus="toggleLabel('emailLb','email','in');" onblur="toggleLabel('emailLb','email','out');checkEmail('check')" placeholder="비상연락용 이메일" class="int"> 
								<label id="emailLb" for="email" class="lbl">비상연락용 이메일</label> <button type="button" disabled="" title="delete" class="wrg">삭제</button>
							</span>
							<div id="emailMsg" class="error" style="display:none">필수 정보입니다.</div>
						</div>
					</div>
					
					<!-- 일반 모바일 인증 -->
					<div id="mobDiv" class="row_group" style="display:block">
						<div id="mobnoDiv" class="join_row join_mobile">
							<span class="ps_box country_code">
								<span class="sel_value" id="nationMsg">+82</span>
								<select id="nationNo" name="nationNo" title="국가번호" class="sel country_sel on" onchange="setNationNo(this)" disabled="">
								  	 			<option value="82" selected="">대한민국(82)</option>
								  	 			<option value="1">미국(1)</option>
								  	 			<option value="81">일본(81)</option>
								  	 			<option value="86">중국(86)</option>
								  	 			<option value="93">아프가니스탄(93)</option>
								  	 			<option value="358">핀란드(358)</option>
								  	 			<option value="355">알바니아(355)</option>
								  	 			<option value="213">알제리아(213)</option>
								  	 			<option value="376">안도라(376)</option>
								  	 			<option value="244">앙골라(244)</option>
								  	 			<option value="1268">안티구아&amp;바부다(1268)</option>
								  	 			<option value="54">아르헨티나(54)</option>
								  	 			<option value="374">카라바흐(374)</option>
								  	 			<option value="297">아루바(297)</option>
								  	 			<option value="61">오스트레일리아(61)</option>
								  	 			<option value="43">오스트리아(43)</option>
								  	 			<option value="994">아제르바이잔(994)</option>
								  	 			<option value="973">바레인(973)</option>
								  	 			<option value="880">방글라데쉬(880)</option>
								  	 			<option value="1246">바베이도스(1246)</option>
								  	 			<option value="1268">안티구아&amp;바부다(1268)</option>
								  	 			<option value="375">벨라루시(375)</option>
								  	 			<option value="32">벨기에(32)</option>
								  	 			<option value="501">벨리즈(501)</option>
								  	 			<option value="229">베닌(229)</option>
								  	 			<option value="1441">버뮤다(1441)</option>
								  	 			<option value="975">부탄(975)</option>
								  	 			<option value="591">볼리비아(591)</option>
								  	 			<option value="387">보스니아(387)</option>
								  	 			<option value="267">보츠와나(267)</option>
								  	 			<option value="55">브라질(55)</option>
								  	 			<option value="673">부르나이(673)</option>
								  	 			<option value="359">불가리아(359)</option>
								  	 			<option value="226">부르키나파소(226)</option>
								  	 			<option value="95">미얀마(95)</option>
								  	 			<option value="257">부룬디(257)</option>
								  	 			<option value="855">캄보디아(855)</option>
								  	 			<option value="237">카메룬(237)</option>
								  	 			<option value="1">캐나다(1)</option>
								  	 			<option value="238">카보베르데(238)</option>
								  	 			<option value="1345">케이맨 제도(1345)</option>
								  	 			<option value="236">중앙아프리카공화국(236)</option>
								  	 			<option value="235">챠드(235)</option>
								  	 			<option value="56">칠레(56)</option>
								  	 			<option value="57">콜롬비아(57)</option>
								  	 			<option value="242">콩고(242)</option>
								  	 			<option value="243">콩고민주공화국(243)</option>
								  	 			<option value="506">코스타리카(506)</option>
								  	 			<option value="225">아이보리코스트(225)</option>
								  	 			<option value="385">크로아티아(385)</option>
								  	 			<option value="53">쿠바(53)</option>
								  	 			<option value="357">싸이프러스(357)</option>
								  	 			<option value="420">체코(420)</option>
								  	 			<option value="45">덴마크(45)</option>
								  	 			<option value="253">지부띠(253)</option>
								  	 			<option value="1809">영국령 버진 제도(1809)</option>
								  	 			<option value="670">티모르(670)</option>
								  	 			<option value="593">에콰도르(593)</option>
								  	 			<option value="20">이집트(20)</option>
								  	 			<option value="503">엘살바도르(503)</option>
								  	 			<option value="240">에콰토리얼기니(240)</option>
								  	 			<option value="372">에스토니아(372)</option>
								  	 			<option value="251">에티오피아(251)</option>
								  	 			<option value="298">페로제도(298)</option>
								  	 			<option value="679">피지(679)</option>
								  	 			<option value="358">핀란드(358)</option>
								  	 			<option value="33">프랑스(33)</option>
								  	 			<option value="594">프랑스령서인도제도2(594)</option>
								  	 			<option value="689">프랑스령 폴리네시아(689)</option>
								  	 			<option value="241">가봉(241)</option>
								  	 			<option value="220">감비아(220)</option>
								  	 			<option value="995">그루지아(995)</option>
								  	 			<option value="49">독일(49)</option>
								  	 			<option value="233">가나(233)</option>
								  	 			<option value="350">지브랄타(350)</option>
								  	 			<option value="30">그리스(30)</option>
								  	 			<option value="299">그린랜드(299)</option>
								  	 			<option value="1473">그레나다(1473)</option>
								  	 			<option value="1671">괌(1671)</option>
								  	 			<option value="502">과테말라(502)</option>
								  	 			<option value="44">영국(44)</option>
								  	 			<option value="245">기니아(245)</option>
								  	 			<option value="509">아이티(509)</option>
								  	 			<option value="504">온두라스(504)</option>
								  	 			<option value="852">홍콩(852)</option>
								  	 			<option value="36">헝가리(36)</option>
								  	 			<option value="354">아이슬란드(354)</option>
								  	 			<option value="91">인도(91)</option>
								  	 			<option value="62">인도네시아(62)</option>
								  	 			<option value="98">이란(98)</option>
								  	 			<option value="964">이라크(964)</option>
								  	 			<option value="353">아일랜드(353)</option>
								  	 			<option value="44">영국(44)</option>
								  	 			<option value="972">이스라엘(972)</option>
								  	 			<option value="39">이탈리아(39)</option>
								  	 			<option value="1876">자메이카(1876)</option>
								  	 			<option value="44">영국(44)</option>
								  	 			<option value="962">요르단(962)</option>
								  	 			<option value="254">케냐(254)</option>
								  	 			<option value="686">키리바티(686)</option>
								  	 			<option value="965">쿠웨이트(965)</option>
								  	 			<option value="996">키르기즈스탄(996)</option>
								  	 			<option value="856">라오스(856)</option>
								  	 			<option value="371">라트비아(371)</option>
								  	 			<option value="961">레바논(961)</option>
								  	 			<option value="266">레소토(266)</option>
								  	 			<option value="231">라이베리아(231)</option>
								  	 			<option value="218">리비아(218)</option>
								  	 			<option value="423">리히텐슈타인(423)</option>
								  	 			<option value="370">리투아니아(370)</option>
								  	 			<option value="352">룩셈부르크(352)</option>
								  	 			<option value="853">마카오(853)</option>
								  	 			<option value="389">마케도니아(389)</option>
								  	 			<option value="261">마다가스카르(261)</option>
								  	 			<option value="265">말라위(265)</option>
								  	 			<option value="60">말레이시아(60)</option>
								  	 			<option value="960">몰디브(960)</option>
								  	 			<option value="223">말리(223)</option>
								  	 			<option value="356">말타(356)</option>
								  	 			<option value="222">모리타니아(222)</option>
								  	 			<option value="230">모리셔스(230)</option>
								  	 			<option value="262">레위니옹 제도(262)</option>
								  	 			<option value="52">멕시코(52)</option>
								  	 			<option value="691">마이크로네시아(691)</option>
								  	 			<option value="373">몰도바(373)</option>
								  	 			<option value="377">코소보(377)</option>
								  	 			<option value="976">몽고(976)</option>
								  	 			<option value="212">모로코(212)</option>
								  	 			<option value="258">모잠비크(258)</option>
								  	 			<option value="264">나미비아(264)</option>
								  	 			<option value="977">네팔(977)</option>
								  	 			<option value="31">네덜란드(31)</option>
								  	 			<option value="687">뉴칼레도니아(687)</option>
								  	 			<option value="64">뉴질랜드(64)</option>
								  	 			<option value="505">니카라과(505)</option>
								  	 			<option value="227">니제르(227)</option>
								  	 			<option value="234">나이제리아(234)</option>
								  	 			<option value="1670">사이판(1670)</option>
								  	 			<option value="47">노르웨이(47)</option>
								  	 			<option value="968">오만(968)</option>
								  	 			<option value="92">파키스탄(92)</option>
								  	 			<option value="970">팔레스타인 자치지구(970)</option>
								  	 			<option value="507">파나마(507)</option>
								  	 			<option value="595">파라과이(595)</option>
								  	 			<option value="51">페루(51)</option>
								  	 			<option value="63">필리핀(63)</option>
								  	 			<option value="48">폴란드(48)</option>
								  	 			<option value="351">포르투갈(351)</option>
								  	 			<option value="974">콰타르(974)</option>
								  	 			<option value="262">레위니옹 제도(262)</option>
								  	 			<option value="40">루마니아(40)</option>
								  	 			<option value="7">카자흐스탄(7)</option>
								  	 			<option value="250">르완다(250)</option>
								  	 			<option value="1758">세인트 루시아(1758)</option>
								  	 			<option value="1784">세인트 빈센트(1784)</option>
								  	 			<option value="966">사우디아라비아(966)</option>
								  	 			<option value="221">세네갈(221)</option>
								  	 			<option value="381">유고슬라비아(381)</option>
								  	 			<option value="248">세이셸(248)</option>
								  	 			<option value="232">시에라리온(232)</option>
								  	 			<option value="65">싱가폴(65)</option>
								  	 			<option value="421">슬로바키아(421)</option>
								  	 			<option value="386">슬로베니아(386)</option>
								  	 			<option value="27">남아프리카공화국(27)</option>
								  	 			<option value="34">스페인(34)</option>
								  	 			<option value="94">스리랑카(94)</option>
								  	 			<option value="249">수단(249)</option>
								  	 			<option value="597">수리남(597)</option>
								  	 			<option value="268">스와질랜드(268)</option>
								  	 			<option value="46">스웨덴(46)</option>
								  	 			<option value="41">스위스(41)</option>
								  	 			<option value="963">시리아(963)</option>
								  	 			<option value="886">대만(886)</option>
								  	 			<option value="992">타지키스탄(992)</option>
								  	 			<option value="255">탄자니아(255)</option>
								  	 			<option value="66">태국(66)</option>
								  	 			<option value="228">토고(228)</option>
								  	 			<option value="676">통가(676)</option>
								  	 			<option value="1868">트리니다드 토바고(1868)</option>
								  	 			<option value="216">튀니지(216)</option>
								  	 			<option value="90">터키(90)</option>
								  	 			<option value="993">투르크메니스탄(993)</option>
								  	 			<option value="256">우간다(256)</option>
								  	 			<option value="380">우크라이나(380)</option>
								  	 			<option value="971">아랍에미리트연합(971)</option>
								  	 			<option value="44">영국(44)</option>
								  	 			<option value="598">우루과이(598)</option>
								  	 			<option value="998">우즈베키스탄(998)</option>
								  	 			<option value="678">바누아투(678)</option>
								  	 			<option value="58">베네수엘라(58)</option>
								  	 			<option value="84">베트남(84)</option>
								  	 			<option value="967">예멘(967)</option>
								  	 			<option value="260">잠비아(260)</option>
								  	 			<option value="255">탄자니아(255)</option>
								  	 			<option value="263">짐바브웨이(263)</option>
								</select>
							</span> 
							<span class="ps_box int_mobile"> 
								<input type="text" id="mobno" name="mobno" maxlength="16" value="" onfocus="toggleLabel('mobnoLb','mobno','in');" onblur="toggleLabel('mobnoLb','mobno','out');checkMobno('check')" placeholder="휴대전화번호" class="int">
								<label id="mobnoLb" for="mobno" class="lbl">휴대전화번호</label> <button type="button" disabled="" title="delete" class="wrg">삭제</button>
							</span>
							<div id="mobnoMsg" class="error" style="display:none">필수 정보입니다.</div> 
							<a href="#" onclick="javascript:sendSmsButton();clickcr(this, 'phn.code', '', '', event);return false;" class="btn_c btn_mobile_submit">인증</a>
						</div>
						
						<div id="authnoDiv" class="join_row join_mobile_certify">
							<span class="ps_box int_mobile_certify"> 
								<input type="text" id="authno" name="authno" maxlength="6" value="" onfocus="toggleLabel('authnoLb','authno','in');" onblur="toggleLabel('authnoLb','authno','out');checkAuthno('check')" placeholder="인증번호" class="int">
								<label id="authnoLb" for="authno" class="lbl">인증번호</label>  <button type="button" disabled="" title="delete" class="wrg">삭제</button>
							</span>
							<div id="authnoMsg" class="error" style="display:none">필수 정보입니다.</div>
							<a href="#" onclick="javascript:checkAuthnoButton();clickcr(this, 'phn.codeconfirm', '', '', event);return false;" class="btn_c btn_certify_submit">확인</a>
						</div>
					</div>
					<!-- 일반 모바일 인증 -->					
				
					<!-- 보호자 모바일 인증 -->
					<div id="jmobDiv" class="join_minor tab" style="display:none">
						<ul class="tab_m">
							<li class="m1">
								<a href="#" class="on">휴대전화인증</a>
							</li>
							<li class="m2">
								<a href="#" onclick="viewJuniverIpinTab();clickcr(this, 'ver.ipin', '', '', event);return false;">아이핀 인증</a>
							</li>
						</ul>
						<div class="mobile_box">
							<p class="parent_privacy_txt">보호자 이름, 휴대전화정보, DI(중복가입확인정보)는 보호자 동의 확인을 위하여 <br>아동의 정보와 함께 저장됩니다.</p>
							<p class="parent_privacy">
								<span class="parent_privacy_title">개인정보 처리에 동의합니다.</span>
								<span class="input_chk">
									<input type="checkbox" id="pterms" onclick="viewPrtsAgree();clickcr(this, 'jrp.privacy', '', '', event);" class="chk">
									<label id="ptermsLb" for="pterms"><span>동의</span></label>
								</span>
								<span id="ptermsMsg" class="error" style="display:none">개인정보 처리에 동의해주세요.</span>
							</p>						
							<div class="row_group">
								<div class="join_row">
									<span class="ps_box">
										<input type="text" id="pnm" name="pnm" value="" onfocus="toggleLabel('pnmLb','pnm','in');" onblur="toggleLabel('pnmLb','pnm','out');checkPrtsName('check')" placeholder="보호자 이름" class="int"> 
										<label id="pnmLb" for="pnm" class="lbl">보호자이름</label> 
										<button type="button" disabled="" title="delete" class="wrg">삭제 </button>
									</span>
									<span id="pnmMsg" class="error" style="display:none">필수 정보입니다.</span>									
								</div>
								<div class="join_row sex_local">
									<div class="join_local">
										<span class="ps_box">
											<select id="pForeign" name="pForeign" title="국적" class="sel">
												<option value="N">내국인</option>
												<option value="Y">외국인</option>
											</select>
										</span>									
									</div>
									<span class="cell">|</span>									
									<div id="psexDiv" class="join_sex">
										<span class="row_title blind">성별</span>
										<span class="sex">
											<span class="jender">
												<input type="radio" id="pman" name="psex" value="M" onclick="checkPrtsSex()">
												<label id="pmanLb" for="pman">남자</label></span><span class="jender">
												<input type="radio" id="pwoman" name="psex" value="F" onclick="checkPrtsSex()">
												<label id="pwomanLb" for="pwoman">여자</label>
											</span>
										</span>										
									</div>		
									<span id="psexMsg" class="error" style="display:none">필수 정보입니다.</span>
								</div>
								
								<div class="join_row join_birthday">
									<div class="join_birth">
										<div class="bir_title"><span>생일</span></div>
										<div class="bir_yy">
											<span class="ps_box">
												<input type="text" maxlength="4" id="pyy" name="pyy" value="" onfocus="toggleLabel('pyyLb','pyy','in');" onblur="toggleLabel('pyyLb','pyy','out');checkPrtsBirthday('check')" placeholder="년(4자)" class="int">
													<label id="pyyLb" for="pyy" class="lbl">년(4자)</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
											</span>
										</div>
										<span class="cell">|</span>
										<div class="bir_mm">
											<span class="ps_box">
												<select id="pmm" name="pmm" title="월" class="sel" onchange="checkPrtsBirthday('check')">
													<option value="">월</option>
												  	 			<option value="1">1</option>
												  	 			<option value="2">2</option>
												  	 			<option value="3">3</option>
												  	 			<option value="4">4</option>
												  	 			<option value="5">5</option>
												  	 			<option value="6">6</option>
												  	 			<option value="7">7</option>
												  	 			<option value="8">8</option>
												  	 			<option value="9">9</option>
												  	 			<option value="10">10</option>
												  	 			<option value="11">11</option>
												  	 			<option value="12">12</option>
												</select>
											</span>
										</div>
										<span class="cell">|</span>
										<div class="bir_dd">
											<span class="ps_box">
												<input type="text" maxlength="2" id="pdd" name="pdd" value="" onfocus="toggleLabel('pddLb','pdd','in');" onblur="toggleLabel('pddLb','pdd','out');checkPrtsBirthday('check')" placeholder="일" class="int"> 
												<label id="pddLb" for="pdd" class="lbl">일</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
											</span>
										</div>
									</div>
									<span id="pbirthdayMsg" class="error" style="display:none">필수 정보입니다.</span>
								</div>
								<div class="join_row join_mobile">
									<span class="ps_box country_code">
										<select id="ptelecomSel" name="ptelecomSel" title="통신사" class="sel" onchange="checkPrtsTelecom()">
											<option value="SKT">SKT</option>
											<option value="KTF">KT</option>
											<option value="LGT">LG U+</option>
											<option value="MVNO">알뜰폰</option>
										</select>
									</span> 
									<span class="ps_box int_mobile"> 
										<input type="text" maxlength="16" id="pmobno" name="pmobno" value="" onfocus="toggleLabel('pmobnoLb','pmobno','in');" onblur="toggleLabel('pmobnoLb','pmobno','out');checkPrtsMobno('check')" placeholder="휴대전화번호" class="int"> 
										<label id="pmobnoLb" for="pmobno" class="lbl">휴대전화번호</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
									</span> 
									<a href="#" onclick="sendPrtsSmsButton();clickcr(this, 'jrp.code', '', '', event);return false;" class="btn_c btn_mobile_submit">인증</a>
									<span id="pmobnoMsg" class="error" style="display:none">필수 정보입니다.</span>
								</div>
								<div class="join_row join_com" id="mvnoDiv" style="display:none">
									<span class="row_title">알뜰폰통신사<a href="#" onclick="showMvnoLayer();return false;" class="btn_help sp">도움말</a></span>
									<span class="sex com">
										<span class="jender"><input type="radio" id="mvno_sk" name="mvno" onclick="checkMvno('SKT')"><label for="mvno_sk" id="mvno_skLb" class="on">SKT</label></span><span class="jender"><input type="radio" id="mvno_kt" name="mvno" onclick="checkMvno('KTF')"><label for="mvno_kt" id="mvno_ktLb">KT</label></span><span class="jender"><input type="radio" id="mvno_lg" name="mvno" onclick="checkMvno('LGT')"><label for="mvno_lg" id="mvno_lgLb">LG U+</label></span>
									</span>
								</div>								
								<div class="join_row join_mobile_certify">
									<span class="ps_box int_mobile_certify"> 
										<input type="text" maxlength="6" id="pauthno" name="pauthno" value="" onfocus="toggleLabel('pauthnoLb','pauthno','in');" onblur="toggleLabel('pauthnoLb','pauthno','out');checkPrtsAuthno('check')" placeholder="인증번호" class="int"> 
										<label id="pauthnoLb" for="pauthno" class="lbl">인증번호</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
									</span> 
									<a href="#" onclick="checkPrtsAuthnoButton();clickcr(this, 'jrp.codeconfirm', '', '', event);return false;" class="btn_c btn_certify_submit">확인</a>
									<span id="pauthnoMsg" class="error" style="display:none">인증이 필요합니다.</span>
								</div>
							</div>							
							<p class="parent_privacy_txt">인증비용은 네이버에서 부담합니다.</p>
						</div>
						
						<!-- 통신사레이어 -->
						<div id="mvno_layer" class="ly_dm" style="display:none">
							<div class="newsagency_tb">
							<table class="tbl_mobile">
							<colgroup>
							<col style="width:45px">
							<col style="width:*">
							<col style="width:*">
							</colgroup>
							<thead>
							<tr>
							<th scope="col">통신사</th>
							<th scope="col" colspan="2">알뜰폰 사업자</th>
							</tr>
							</thead>
							<tbody>
							<tr class="line" onclick="javascript:showMvnoLayer('SKT')">
							<th scope="row" rowspan="5">SKT</th>
							<td>KCT</td>
							<td>SK텔링크</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('SKT')">
							<td>KD링크</td>
							<td>큰사람 컴퓨터</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('SKT')">
							<td>이마트</td>
							<td>스마텔</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('SKT')">
							<td>아이즈비전</td>
							<td>에스원</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('SKT')">
							<td>유니컴즈</td>
							<td></td>
							</tr>
							<tr class="line" onclick="javascript:showMvnoLayer('KTF')">
							<th scope="row" rowspan="6">KT</th>
							<td>홈플러스</td>
							<td>온세텔레콤</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('KTF')">
							<td>CJ헬로비전</td>
							<td>위너스텔</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('KTF')">
							<td>에버그린모바일</td>
							<td>S로밍</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('KTF')">
							<td>에넥스텔레콤</td>
							<td>KT파워텔</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('KTF')">
							<td>프리텔레콤</td>
							<td>씨엔커뮤니케이션</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('KTF')">
							<td>몬티스타텔레콤</td>
							<td>머천드코리아</td>
							</tr>
							<tr class="line" onclick="javascript:showMvnoLayer('LGT')">
							<th scope="row" rowspan="7">LG U+</th>
							<td>스페이스네트</td>
							<td>리더스텔레콤</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('LGT')">
							<td>씨엔엠브이엔오</td>
							<td>비엔에스솔루션</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('LGT')">
							<td>인터파크</td>
							<td>에프아이텔</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('LGT')">
							<td>자티전자</td>
							<td>서경방송</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('LGT')">
							<td>울산방송</td>
							<td>푸른방송</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('LGT')">
							<td>남인천방송</td>
							<td>금강방송</td>
							</tr>
							<tr onclick="javascript:showMvnoLayer('LGT')">
							<td>제주방송</td>
							<td></td>
							</tr>
							</tbody>
							</table>
							<a href="javascript:showMvnoLayer('CLOSE')" class="btn_closed sp">창닫기</a>
							</div>
						</div>
						<!-- //통신사레이어 -->
						
					</div>
					<!-- //보호자 모바일 인증 -->
					
					<!-- 보호자 아이핀 인증 -->
					<div id="jipinDiv" class="join_minor tab" style="display:none">
						<ul class="tab_m">
							<li class="m1"><a href="#" onclick="viewJuniverMobileTab();clickcr(this, 'ver.phone', '', '', event);return false;">휴대전화인증</a></li>
							<li class="m2"><a href="#" class="on">아이핀 인증</a></li>
						</ul>
						<div class="ipin_box">
							<div class="join_row join_ipin_certify">
								<div class="ipin_certify">
									<p class="ipin_certify_txt">보호자 명의의 아이핀으로 인증 후 가입이 가능 합니다. </p>
									<span class="ipin_certify_btn">
										<a href="#" onclick="javascript:popupIpinButton();clickcr(this, 'jri.ipinverify', '', '', event);return false;" class="btn_c btn_ipin">아이핀 인증하기</a>
									</span>
								</div>
								<div id="ipinMsg" class="error" style="display:none">인증이 필요합니다.</div>
							</div>
							<div class="join_row join_mobile">
								<span class="ps_box country_code">
									<span class="sel_value" id="inationMsg">+82</span>
									<select id="inationNo" name="inationNo" title="국가번호" class="sel country_sel on" onchange="setIpinNationNo(this)">
										<option value="82" selected="">대한민국(82)</option>									
									</select>
								</span>
								<span class="ps_box int_mobile"> 
									<input type="text" id="imobno" name="imobno" maxlength="16" value="" onfocus="toggleLabel('imobnoLb','imobno','in');" onblur="toggleLabel('imobnoLb','imobno','out');checkIpinMobno('check')" placeholder="휴대전화번호" class="int"> 
									<label id="imobnoLb" for="imobno" class="lbl">휴대전화번호</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
								</span>
								<div id="imobnoMsg" class="error" style="display:none">필수 정보입니다.</div> 
								<a href="#" onclick="javascript:sendIpinSmsButton();clickcr(this, 'phn.code', '', '', event);return false;" class="btn_c btn_mobile_submit">인증</a>
							</div>
							<div class="join_row join_mobile_certify">
								<span class="ps_box int_mobile_certify"> 
									<input type="text" id="iauthno" name="iauthno" maxlength="6" value="" onfocus="toggleLabel('iauthnoLb','iauthno','in');" onblur="toggleLabel('iauthnoLb','iauthno','out');checkIpinAuthno('check')" placeholder="인증번호" class="int"> 
									<label id="iauthnoLb" for="iauthno" class="lbl">인증번호</label> <button type="button" disabled="" title="delete" class="wrg">삭제 </button>
								</span>
								<div id="iauthnoMsg" class="error" style="display:none">필수 정보입니다.</div> 
								<a href="#" onclick="javascript:checkIpinAuthnoButton();clickcr(this, 'phn.codeconfirm', '', '', event);return false;" class="btn_c btn_certify_submit">확인</a>
							</div>
						</div>
					</div>	
					<!-- //보호자 아이핀 인증 -->
					
					
										
					</fieldset>

					<a name="bottom"></a>					
					<div class="error_ch"><span id="joinMsg" class="error" style="display:none">가입정보를 확인해주세요.</span></div>		
					<span class="btn_join"><input type="submit" onclick="clickcr(this, 'sup.signup', '', '', event);" title="회원가입" alt="회원가입" value="가입하기" class="int_join"></span>		
				</form>
		

			
		</div>	
		<!-- //content -->
	</div>
 -->
</body>
</html>

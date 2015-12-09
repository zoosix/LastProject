<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/css?family=Francois+One"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,700"
	rel="stylesheet">
<link
	href="https://fontastic.s3.amazonaws.com/YKLiEB5nKeTck7NdBGoGKY/icons.css"
	rel="stylesheet">

<link rel="stylesheet" href="member/css/normalize.css">


<link rel="stylesheet" href="member/css/style.css">

<!-- <script type="text/javascript">
function joinOk(){
	alert("눌렀다");
}
</script> -->


</head>

<body>

	<!--  <div class="toaster" style="display: none;">
  Yay, the form is valid!
</div> -->

	<main class="wrapper"> <section class="section-form">
	<!-- <h1>GentleForm</h1>
    <p>
      Accessible and user-friendly HTML5 form validation library.<br>
      <a href="https://github.com/Zhouzi/GentleForm" target="_blank">GitHub Repo</a> - <a href="https://twitter.com/home?status=GentleForm%20-%20Accessible%20and%20user-friendly%20HTML5%20form%20validation%20library.%20http%3A%2F%2Fcodepen.io%2FZhouzi%2Ffull%2FQbBzZp%2F%20via%20%40zh0uzi" target="_blank">Tweet!</a>
    </p> -->
  <div class="join_container">
	<form name="join_Form" id="join_Form" class="form" action="join_ok.do"
		method="post">
		<!-- email -->
		<div class="form-group">
			<label for="email" class="form-label form-label--required">
				Email: </label>

			<div class="form-addon" data-states-for="email">
				<div class="form-addon__addon">
					<span class="icon-email"></span>
				</div>

				<input type="email" id="email" name="email" class="form-input"
					placeholder="andrew@email.com" required> <span
					class="form-addon__icon icon-valid"></span> <span
					class="form-addon__icon icon-invalid"></span>
			</div>

			<div data-errors-for="email">
				<small class="form-error is-hidden" data-errors-when="valueMissing">
					This field is required. </small> <small class="form-error is-hidden"
					data-errors-when="typeMismatch"> Please enter a valid email
					address. </small>
			</div>
		</div>
		<!-- pwd -->
		<div class="form-group">
			<label for="password" class="form-label form-label--required">
				Password <span class="text-muted">(minimum 6 characters)</span>:
			</label>

			<div class="form-addon" data-states-for="password">
				<div class="form-addon__addon">
					<span class="icon-password"></span>
				</div>

				<input type="password" id="password" name="pwd"
					class="form-input" placeholder="********" minlength="6" required>

				<span class="form-addon__icon icon-valid"></span> <span
					class="form-addon__icon icon-invalid"></span>
			</div>

			<div data-errors-for="password">
				<small class="form-error is-hidden" data-errors-when="valueMissing">
					This field is required. </small> <small class="form-error is-hidden"
					data-errors-when="tooShort"> Your password should be at
					least 6 characters long. </small>
			</div>
		</div>
		<!-- name -->
		<div class="form-group">
			<label for="name" class="form-label form-label--required">
				Name: </label>

			<div class="form-addon" data-states-for="name">
				<div class="form-addon__addon">
					<span class="icon-name"></span>
				</div>

				<input type="text" id="name" name="name" class="form-input"
					placeholder="Andrew" required> <span
					class="form-addon__icon icon-valid"></span> <span
					class="form-addon__icon icon-invalid"></span>
			</div>

			<div data-errors-for="name">
				<small class="form-error is-hidden" data-errors-when="valueMissing">
					This field is required. </small>
			</div>
		</div>
		<!-- gender -->
		<div class="form-group">

			<label for="gender" class="form-no form-label--required">
				<!-- class="form-label form-label--required"  --> Gender:
			</label>
			<div class="input-group">
				<input type="radio" name="gender" value="male" id="gender-male"
					class="form-radio" /> <label for="gender-male">Male</label>
				<input type="radio" name="gender" value="female" id="gender-female"
					class="form-radio" /> <label for="gender-female">Female</label>
			</div>
			<div data-errors-for="gender">
				<small class="form-error is-hidden" data-errors-when="valueMissing">
					This field is required. </small> <br>
			</div>
		</div>
		<!-- birth -->
		<div class="form-group">

			<label for="birth" class="form-label form-label--required">
				<!-- class="form-label form-label--required" --> Birthday:
			</label>
			<div class="input-group">
				<div class="col-third">
					<input type="text" placeholder="YYYY" class="form-input" id="birthY"/>
				</div>
				<div class="col-third">
					<input type="text" placeholder="MM" class="form-input" id="birthM"/>
				</div>
				<div class="col-third">
					<input type="text" placeholder="DD" class="form-input" id="birthD"/>
					<input type="hidden" id="birth" value="" name="birth"/>
				</div>

			</div>
			<div data-errors-for="birth">
				<small class="form-error is-hidden" data-errors-when="valueMissing">
					This field is required. </small> <br>
			</div>
		</div>
		<!-- tell -->
		<div class="form-group">
			<label for="phone" class="form-label form-label--required">
				Cell Phone number: </label>

			<div class="form-addon" data-states-for="phone">
				<div class="form-addon__addon">
					<span class="icon-phone"></span>
				</div>

				<input type="text" id="phone" name="tell" class="form-input"
					placeholder="010-1234-5678" pattern="^[0-9()+\s]{8,13}$"> <span
					class="form-addon__icon icon-valid"></span> <span
					class="form-addon__icon icon-invalid"></span>
			</div>

			<div data-errors-for="phone">
				<small class="form-error is-hidden"
					data-errors-when="patternMismatch"> Please enter a valid
					phone number. </small>
			</div>
		</div>

		<!-- 관심 종목 -->
		<div class="form-group">
			<label for="favorit" class="form-label form-label--required">
				Favorit Stocks: </label>


			<table
				class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp tbl-favorite"
				width=100%>

				<tbody>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-1"> <input type="checkbox" id="checkbox-1"
								class="mdl-checkbox__input" value="017670.KS" name="favorite"> <span
								class="mdl-checkbox__label">SKT</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-2"> <input type="checkbox" id="checkbox-2"
								class="mdl-checkbox__input" value="030200.KS" name="favorite"> <span
								class="mdl-checkbox__label">KT</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-3"> <input type="checkbox" id="checkbox-3"
								class="mdl-checkbox__input" value="036570.KS" name="favorite"> <span
								class="mdl-checkbox__label">엔씨소프트</span>
						</label></td>
					</tr>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-4"> <input type="checkbox" id="checkbox-4"
								class="mdl-checkbox__input" value="AMZN" name="favorite"> <span
								class="mdl-checkbox__label">Amazon</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-5"> <input type="checkbox" id="checkbox-5"
								class="mdl-checkbox__input" value="T" name="favorite"> <span
								class="mdl-checkbox__label">AT&T</span>
						</label></td>
					<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-6"> <input type="checkbox" id="checkbox-6"
								class="mdl-checkbox__input" value="AAPL" name="favorite"> <span
								class="mdl-checkbox__label">Apple</span>
						</label></td>
					</tr>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-7"> <input type="checkbox" id="checkbox-7"
								class="mdl-checkbox__input" value="035420.KS" name="favorite"> <span
								class="mdl-checkbox__label">네이버</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-8"> <input type="checkbox" id="checkbox-8"
								class="mdl-checkbox__input" value="066570.KS" name="favorite"> <span
								class="mdl-checkbox__label">LG전자</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-9"> <input type="checkbox" id="checkbox-9"
								class="mdl-checkbox__input" value="018260.KS" name="favorite"> <span
								class="mdl-checkbox__label">삼성SDS</span>
						</label></td>
					</tr>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-10"> <input type="checkbox" id="checkbox-10"
								class="mdl-checkbox__input" value="MSFT" name="favorite"> <span
								class="mdl-checkbox__label">Microsoft</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-11"> <input type="checkbox" id="checkbox-11"
								class="mdl-checkbox__input" value="INTC" name="favorite"> <span
								class="mdl-checkbox__label">Intel</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-12"> <input type="checkbox" id="checkbox-12"
								class="mdl-checkbox__input" value="ADBE" name="favorite"> <span
								class="mdl-checkbox__label">Adobe</span>
						</label></td>
					</tr>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-13"> <input type="checkbox" id="checkbox-13"
								class="mdl-checkbox__input" value="035510.KS" name="favorite"> <span
								class="mdl-checkbox__label">신세계I&S</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-14"> <input type="checkbox"
								id="checkbox-14" class="mdl-checkbox__input" value="032640.KS" name="favorite">
								<span class="mdl-checkbox__label">LG유플러스</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-15"> <input type="checkbox" id="checkbox-15"
								class="mdl-checkbox__input" value="094280.KS" name="favorite"> <span
								class="mdl-checkbox__label">효성ITX</span>
						</label></td>
					</tr>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-16"> <input type="checkbox"
								id="checkbox-16" class="mdl-checkbox__input" value="NVDA" name="favorite">
								<span class="mdl-checkbox__label">NVIDIA</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-17"> <input type="checkbox"
								id="checkbox-17" class="mdl-checkbox__input" value="FB" name="favorite">
								<span class="mdl-checkbox__label">FaceBook</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-18"> <input type="checkbox" id="checkbox-18"
								class="mdl-checkbox__input" value="NFLX" name="favorite"> <span
								class="mdl-checkbox__label">Netflix</span>
						</label></td>
					</tr>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-19"> <input type="checkbox"
								id="checkbox-19" class="mdl-checkbox__input" value="034310.KS" name="favorite">
								<span class="mdl-checkbox__label">나이스</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-20"> <input type="checkbox"
								id="checkbox-20" class="mdl-checkbox__input" value="058850.KS" name="favorite">
								<span class="mdl-checkbox__label">KTcs</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-21"> <input type="checkbox" id="checkbox-21"
								class="mdl-checkbox__input" value="012750.KS" name="favorite"> <span
								class="mdl-checkbox__label">삼성에스원</span>
						</label></td>
					</tr>
					<tr>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-22"> <input type="checkbox"
								id="checkbox-22" class="mdl-checkbox__input" value="GOOG" name="favorite">
								<span class="mdl-checkbox__label">Alphabet</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-23"> <input type="checkbox"
								id="checkbox-23" class="mdl-checkbox__input" value="PYPL" name="favorite">
								<span class="mdl-checkbox__label">PayPal</span>
						</label></td>
						<td class="mdl-data-table__cell--non-numeric col-third"><label
							class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
							for="checkbox-24"> <input type="checkbox" id="checkbox-24"
								class="mdl-checkbox__input" value="QCOM" name="favorite"> <span
								class="mdl-checkbox__label">QUALCOMM</span>
						</label></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 전송 -->

		<div class="form-footer">
			<div class="form-footer__message" data-errors-for="signup">
				<small class="form-error is-hidden" data-errors-when="invalid">
					The form contains errors. </small>
			</div>

			<div class="form-footer__cta">
				<button type="button" id="btnSub" onclick="joinOk()"
					class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
					Sign_Up</button>
			</div>
		</div>
	</form>
	</section> </main>
	<script src='http://gabinaureche.com/GentleForm/dist/GentleForm.min.js'></script>

	<script src="<%=request.getContextPath() %>/member/js/index.js"></script>
	<script src="<%=request.getContextPath() %>/member/js/join.js"></script>

</body>
</html>

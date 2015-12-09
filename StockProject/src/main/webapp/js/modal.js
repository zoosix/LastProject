  var modal = $('.modal');

  $( "#signin" ).on( "click", function() {
    $( modal ).toggleClass('modal--show');
  });

  $( ".overlay" ).on( "click", function() {
    $( modal ).toggleClass('modal--show');
  });

  $( ".close" ).on( "click", function() {
    $( modal ).toggleClass('modal--show');
  });

	function login() {
		var f = document.loginFrm;
		if (f.email.value == "") {
			alert("이메일을 입력해주세요.");
			f.id.focus();
			return;
		}
		if (f.pwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			f.pwd.focus();
			return;
		}
		f.submit();
	}

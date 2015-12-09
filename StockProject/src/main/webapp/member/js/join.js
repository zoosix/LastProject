function joinOk(){
	alert("눌렀다");
	var email=$('#email').val();
	//alert(email);
	var pwd=$('#password').val();
	//alert(pwd);
	var name=$('#name').val();
	//alert(name);
	var gender=$(':radio[name="gender"]:checked').val();
	/*if ($('#gender_male').seleted)
		gender=male;
	else if ($('#gender_male').seleted)
		gender=female;
	*/
	//alert(gender);
	var birth=$('#birth').val($('#birthY').val()+'/'+$('#birthM').val()+'/'+$('#birthD').val());
	alert(birth);
	var tell=$('#phone').val();
	//alert(tell);
	
	 var items=[];
	 $('input[name="favorite"]:checkbox:checked').each(function(){
		 items.push($(this).val());
		});
	 var favorite = items.join(',');
	     alert(favorite);
	
	$('#join_Form').submit();
	
}
/*
 * $(function(){ var email=$('#email').val(); var pwd=$('#password').val(); var
 * name=$('#name').val(); var gender=$('#gender').val(); var
 * birth=$('#birth').val(); var tell=$('#phone').val(); var
 * favorite=$('#favorite').val(); $('#btnSub').click(function(){
 * $('#join_Form').submit(); }); });
 */

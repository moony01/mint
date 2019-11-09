//로그인
$('.login__login-btn').click(function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/loginOk',
		data: $('#loginForm').serialize(),
		dataType: 'text',
		success: function(result){
			console.log(result);
			if(result == 'success') {
				alert('정상 로그인 되었습니다. ');
				location.href='/mintProject/shop/main/index';				
			} else {
				alert('아이디 혹은 비밀번호가 틀렸습니다.');
			}
		},
		error: function(e){
			console.log(e);
		}
	});
	
});
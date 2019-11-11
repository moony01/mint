$(document).ready(function(){
});

$('#pwd_check').click(function(){
	$.ajax({
		url : '/mintProject/shop/member/myinfo_pwd_check_result',
		data : {'pwd' : $('#pwd').val()},
		dataType : 'json',
		success : function(data){
			if(data.result=='success'){
				location.href='/mintProject/shop/member/myinfo';
			} else if(data.result=='fail') {
				$('#pwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','8pt');
			}
		},
		error : function(err){
			console.log(err);
		}
	});
});
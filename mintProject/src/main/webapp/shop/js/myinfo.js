$('#pwd_conf_btn').click(function(){
	$.ajax({
		url : '/mintProject/shop/mypage/myinfo_pwd_conf',
		data : {'pwd' : $('#pwd').val()},
		dataType : 'json',
		success : function(data){
			if(data.result=='success'){
				location.href='/mintProject/shop/mypage/myinfo';
			} else if(data.result=='fail') {
				$('#pwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','8pt');
			}
		},
		error : function(err){
			console.log(err);
		}
	});
});
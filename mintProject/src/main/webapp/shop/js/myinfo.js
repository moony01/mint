$('#pwd_conf_btn').click(function(){
	$.ajax({
		url : '/mintProject/shop/mypage/myinfo_pwd_conf',
		data : {'pwd' : $('#pwd').val()},
		dataType : 'json',
		success : function(data){
			if(data.result=='success'){
				location.href='/mintProject/shop/mypage/myinfo';
			} else if(data.result=='fail') {
				swal('비밀번호를 다시 확인해주세요.');
			}
		},
		error : function(err){
			console.log(err);
		}
	});
});

$('#modi_btn').click(function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/mypage/myinfo_modify',
		data: $('#modify-form').serialize(),
		success: function(){
			swal('회원정보가 수정되었습니다')
			.then((value) => {
				location.href='/mintProject/shop/mypage/myinfo';
			});
		},
		error: function(e){
			printError(e);
		}
	});
});

$('#wd_btn').click(function(){
	/*swal('회원 탈퇴 시 고객님께서 보유하셨던 적립금은 삭제됩니다. \n정말 탈퇴하시겠습니까?')
	.then((value) => {
		if(value){
			swal('비밀번호를 다시 한번 입력해주세요',{
				content : 'input'
			})
		}
		
	});*/
	swal({
		title : "정말 탈퇴하시겠습니까?",
		text : "회원 탈퇴 시 고객님께서 보유하셨던 적립금은 삭제됩니다.",
		icon : "warning",
		bottons : true,
	}).then((value) => {
		if(value){
			swal('회원님의 비밀번호를 다시 한번 입력해주세요',{
				content : 'input'
			}).then((value) =>{
				$.ajax({
					type: 'post',
					url: '/mintProject/shop/mypage/remove_account',
					data: {'pwd' : value },
					dataType : 'text',
					success: function(data){
						if(data=='success'){
							swal('회원탈퇴가 완료되었습니다... 또 만나요')
							.then((value) => {
								location.href='/mintProject/shop/main/index';
							});
							
						} else if(data=='fail'){
							swal('비밀번호가 틀렸습니다');
						}
					},
					error: function(e){
						printError(e);
					}
				});
			});
		}
	})
	
	/*if(confirm('정말 탈퇴하시겠습니까?')){
		var pwd = prompt("비밀번호를 다시 한번 입력해주세요");
		$.ajax({
			type: 'post',
			url: '/mintProject/shop/mypage/remove_account',
			data: {'pwd' : pwd},
			dataType : 'text',
			success: function(data){
				if(data=='success'){
					alert('회원탈퇴가 완료되었습니다... 또 만나요');
					location.href='/mintProject/shop/main/index';
				} else if(data=='fail'){
					alert('비밀번호가 틀렸습니다');
				}
			},
			error: function(e){
				printError(e);
			}
		});
	}*/
});
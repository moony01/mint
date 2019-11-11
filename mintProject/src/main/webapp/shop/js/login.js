$().ready(function(){
	//페이지 로드 시 쿠키를 가져와 id의 text필드에 담기
	let rememberId = getCookie("rememberId");
	$('#id').val(rememberId);
	
	//만약 값이 있으면 == 아이디 저장 체크박스를 체크해둠. 
	if($('#id').val() != '') {
		$('.check-id').prop("checked", true);
	} 

});

//체크박스의 값이 바뀜에 따라 cookie를 생성하거나 삭제한다. 
$('.check-id').change(function(){
	if($(this).is(":checked")){
		rememberId = $('#id').val();
		setCookie("rememberId", rememberId, 7);
	} else{
		deleteCookie("rememberId");
	}
});

//쿠키 생성: 7일
function setCookie(cookieName, value, expireDays){
	let expireDate = new Date();
	expireDate.setDate(expireDate.getDate + expireDays);
	let cookieValue = escape(value) + ((expireDays == null) ? "" : ";expires=" + expireDate.toUTCString);
	//escape(): value의 문자열에 있는 특수문자(;, ,, 공백 등)이 있을 시 쿠키 값으로 인식 불가 => encode하기 위해 사용. 
	document.cookie = cookieName + "=" + cookieValue; //document 객체의 cookie에 생성된 쿠키를 저장. ';'를 구분자로 저장된다. 
}

//쿠키 삭제
function deleteCookie(cookieName){
	let expireDate = new Date();
	expireDate.setDate(expireDate.getDate() -1);
	document.cookie = cookieName + "=" + ";expires=" + expireDate.toUTCString();
}

//쿠키 가져오기
function getCookie(cookieName){
	cookieName = cookieName + "=";
	let cookieData = document.cookie;
	let start = cookieData.indexOf(cookieName);
	let cookieValue = '';

	if(start != -1) { //쿠키가 존재할 시
		start += cookieName.length;
		let end = cookieData.indexOf(';', start); //쿠키 값이 끝나는 인덱스를 구함
		
		if(end == -1) end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue); //쿠키값을 decode 함
}

//로그인
$('.login__login-btn').click(function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/loginOk',
		data: $('#loginForm').serialize(),
		dataType: 'text',
		success: function(result){
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

//아이디/비밀번호 찾기
$('.btn-find').click(function(){
	let formData;
	if($(this).text() == '아이디 찾기') {
		formData = $('#findIdForm').serialize();
	} else if($(this).text() == '비밀번호 찾기'){
		formData = $('#findPwdForm').serialize();
	}
	
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/findIdOk',
		data: formData,
		dataType: 'text',
		success: function(result){
			if(result != '') {
				$('.hideIfSucceed').hide();
				$('.findId').append(result.substring(0, result.length-3)+'***');
				$('.showIfSucceed').css('display', 'block');
			} else {
				alert('일치하는 정보가 없습니다. ');
			}
		},
		error: function(e){
			console.log(e);
		}
	});	
});

$('.btn-auth').click(function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/auth',
		data: {"id": document.getElementsByName("id")[0].value,
			"email": document.getElementsByName("email")[0].value},
		success: function(){
			$('.showIfSucceed').empty();
			$('.showIfSucceed').css('display', 'block');
			$('.showIfSucceed').append(`<div class="login__input-container">
									    	<div class="login-content">
									    		<h1>비밀번호 찾기 </h1>
										    	인증번호 입력 <input type="text" class="join-input input--lg" name="emailCerti">
												<div class="join-btn btn--primary btn-certiAuthKey">인증번호 확인</div><br>
									    	</div>
								    	</div>`);
		},
		error: function(e){
			console.log(e);
		}
	});
});

$('.showIfSucceed').on('click', '.btn-certiAuthKey', function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/certiAuthKey',
		data: {"id": document.getElementsByName("id")[0].value,
			"certiAuthKey": document.getElementsByName("emailCerti")[0].value},
		dataType: 'text',
		success: function(data){
			if(data == 'true') {
				alert("인증이 완료되었습니다. ");
				$('.showIfSucceed').empty();
				$('.showIfSucceed').append(`<div class="login__input-container">
										    	<div class="login-content">
										    		<h1>비밀번호 찾기 </h1>
											    	새 비밀번호 등록 &emsp; <input type="password" class="join-input input--lg" name="pwd" placeholder="비밀번호를 입력해주세요"><br>
													새 비밀번호 확인 &emsp; <input type="password" class="join-input input--lg" name="repwd" placeholder="비밀번호를 한번 더 입력해주세요">
													<div class="join-btn btn--primary btn-update"> 확인</div><br>
										    	</div>
									    	</div>`);
			}
			else alert('인증번호가 잘못되었습니다. ');
		},
		error: function(e){
			console.log(e);
		}
	});
});

$('.showIfSucceed').on('click', '.btn-update', function(){
	document.findPwdForm.method='post';
	document.findPwdForm.action ='/mintProject/shop/member/updateInfo';
	document.findPwdForm.submit();
});
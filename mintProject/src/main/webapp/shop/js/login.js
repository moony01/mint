//로그인 ====================================================================================================================
//페이지 로드 시 쿠키를 가져와 id의 text필드에 담기
function getCookie(){
	let rememberId = getCookie("rememberId");
	$('#id').val(rememberId);
	
	//만약 값이 있으면 == 아이디 저장 체크박스를 체크해둠. 
	if($('#id').val() != '') {
		$('.check-id').prop("checked", true);
	} 
}

//login?status= 에 따라 url 변경 
function checkStatus(status){
	if(status == 'fail') { //로그인 실패 시 
		alert("아이디 혹은 비밀번호가 틀립니다. ");
	} else if(status == 'need') { // 로그인 전에 인증 권한이 필요한 페이지를 요청했을 시
		alert('로그인 후 이용 가능한 페이지 입니다.');
		location.href='/mintProject/shop/member/login';
	} else if(status == 'already') { // 다른 브라우저에서 중복 로그인 되었을 시  
		alert('다른 브라우저에서 로그인 되었습니다.');
		location.href='/mintProject/shop/main/index';
	}	
}

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

//로그인 버튼 클릭 
$('.login__login-btn').click(function(){
	document.loginForm.method = 'post';
	document.loginForm.action ='/mintProject/shop/member/loginOk';
	document.loginForm.submit();

});

//아이디/비밀번호 찾기 ============================================================================================================
/*
let formData;

function checkFormData(btn){
	if(btn.text() == '아이디 찾기') {
		formData = $('#findIdForm').serialize();
	} else if(btn.text() == '비밀번호 찾기'){
		formData = $('#findPwdForm').serialize();
	}	
	return formData;
}

//아이디 / 비밀번호 찾기 버튼 클릭
$('.btn-find').click(function(){
	formData = checkFormData($(this));
	
	getFindIdPage()
	.then(function(result){
		printFindIdPage(result);
	})
	.catch(function(e){
		printError(e);
	});
});
*/
/*
// 인증번호 발송 버튼 클릭
$('.btn-auth').click(function(){
	getAuthCheckPage()
	.then(function(){
		printAuthCheckPage();
	})
	.catch(function(e){
		printError(e);
	});
});

//인증번호 확인 버튼 클릭
$('.showIfSucceed').on('click', '.btn-certiAuthKey', function(){
	getAuthConfirmPage()
	.then(function(result){
		printAuthConfirmPage(result);
	})
	.catch(function(e){
		printError(e);
	});
	
});

// 비밀번호 재설정 확인 버튼 클릭 
$('.showIfSucceed').on('click', '.btn-update', function(){
	document.findPwdForm.method='post';
	document.findPwdForm.action ='/mintProject/shop/member/updateInfo';
	document.findPwdForm.submit();
});

//아이디 찾기 관련 메소드 =========================================================================================================
function getFindIdPage(){
	return $.ajax({
		type: 'post',
		url: '/mintProject/shop/member/findIdOk',
		data: formData,
		dataType: 'text',
	});	
}

function printFindIdPage(result){
	if(result != '') {
		$('.hideIfSucceed').hide();
		$('.findId').append(result.substring(0, result.length-3)+'***');
		$('.showIfSucceed').css('display', 'block');
	} else {
		alert('일치하는 정보가 없습니다. ');
	}
	
}
*/
/*
//비밀번호 찾기 관련 메소드 =========================================================================================================
function getAuthCheckPage(){
	return $.ajax({
		type: 'post',
		url: '/mintProject/shop/member/auth',
		data: {"id": document.getElementsByName("id")[0].value,
			"email": document.getElementsByName("email")[0].value},
	});	
}
function getAuthConfirmPage(){
	return $.ajax({
		type: 'post',
		url: '/mintProject/shop/member/certiAuthKey',
		data: {"id": document.getElementsByName("id")[0].value,
			"certiAuthKey": document.getElementsByName("emailCerti")[0].value},
		dataType: 'text',
	});
}

function printAuthCheckPage(){
	let $frag = $(document.createDocumentFragment());
	let authCheckPage =`<div class="login__input-container">
					     <div class="login-content">
							<h1>비밀번호 찾기 </h1>
					    	인증번호 입력 <input type="text" class="join-input input--lg" name="emailCerti">
							<div class="join-btn btn--primary btn-certiAuthKey">인증번호 확인</div><br>
						 </div>
						</div>`;
	$frag.append($(authCheckPage));
	$('.showIfSucceed').empty();
	$('.showIfSucceed').css('display', 'block');
	$('.showIfSucceed').append($frag);
}

function printAuthConfirmPage(result){
	let $frag = $(document.createDocumentFragment());
	if(result == 'true') {
		let authConfirmPage = `<div class="login__input-container">
								<div class="login-content">
									<h1>비밀번호 찾기 </h1>
									새 비밀번호 등록 &emsp; <input type="password" class="join-input input--lg" name="pwd" placeholder="비밀번호를 입력해주세요"><br>
									새 비밀번호 확인 &emsp; <input type="password" class="join-input input--lg" name="repwd" placeholder="비밀번호를 한번 더 입력해주세요">
									<div class="join-btn btn--primary btn-update"> 확인</div><br>
								</div>
							</div>`;
		$frag.append($(authConfirmPage));
		alert("인증이 완료되었습니다. ");
		$('.showIfSucceed').empty();
		$('.showIfSucceed').append($frag);
	} else {
		alert('인증번호가 잘못되었습니다. ');
	}
}

function printError(e){
	console.log(e);
}
*/
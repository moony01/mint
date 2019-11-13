let formData;
let certiAuthBtn = document.querySelector(".btn-certiAuthKey");
let emailCerti = document.getElementsByName("emailCerti")[0];
//아이디 비밀번호 찾기============================================================================================================

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
	.then(printFindIdPage)
	.catch(printError);
});

$('.btn-auth').on("click", function(){	
	getAuthCheckPage()
	.then(printAuthCheckPage)
	.catch(printError);
});

//인증번호 확인 버튼 클릭
$('.showIfSucceed').on('click', '.btn-certiAuthKey', function(){
	getAuthConfirmPage()
	.then(printAuthConfirmPage)
	.catch(printError);
	
});

//비밀번호 재설정 확인 버튼 클릭 
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


//비밀번호 찾기 관련 메소드 =========================================================================================================
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


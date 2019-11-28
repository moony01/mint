//아이디/이메일 중복확인 ajax 호출
function getIsDuplicatedPage(key, value){
	return $.ajax({
		type: 'post',
		url: '/mintProject/shop/member/isDuplicated',
		data: 'key='+key+'&value='+value
	});
}

// getIsDuplicatedPage() 의 sucess result
function printIsDuplicated(result){
	if(!result){
		alert('사용 가능한 이메일 입니다. ');
	} else {
		alert('이미 사용중인 계정입니다.');
	}
	
	return result;
}

// 인증번호 발송 ajax 호출
function getAuthCheckPage(result){
	if(!result) {
		return $.ajax({
			type: 'post',
			url: '/mintProject/shop/member/auth',
			data: {"id": document.getElementsByName("id")[0].value,
				"email": document.getElementsByName("email")[0].value},
		});	
		
	}
}


// 인증번호 일치 여부 확인 ajax 호출
function getAuthConfirmPage(){
	return $.ajax({
		type: 'post',
		url: '/mintProject/shop/member/certiAuthKey',
		data: {"id": document.getElementsByName("id")[0].value,
			"certiAuthKey": document.getElementsByName("emailCerti")[0].value},
		dataType: 'text',
	});
}


//에러메세지 
function printError(e){
	console.log(e);
}
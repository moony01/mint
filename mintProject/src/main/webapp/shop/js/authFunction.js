
function getAuthCheckPage(){
	return $.ajax({
		type: 'post',
		url: '/mintProject/shop/member/auth',
		data: {"id": document.getElementsByName("id")[0].value,
			"email": document.getElementsByName("email")[0].value},
		success: function(){
		},
		error: function(e){
			printError(e);
		}
	});
}

function getIsDuplicatedPage(){
	return $.ajax({
		type: 'post',
		url: '/mintProject/shop/member/isDuplicated',
		data: {"email": document.getElementsByName("email")[0].value},
	});
}


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

function printError(e){
	console.log(e);
}
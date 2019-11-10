const addrBtn = document.querySelector(".btn-addr");
const authBtn = document.querySelector(".btn-auth");
const checkIdBtn = document.querySelector(".btn-checkId");
const certiAuthBtn = document.querySelector(".btn-certiAuthKey");
let emailCerti = document.getElementsByName("emailCerti")[0];

// 다음 우편번호
addrBtn.addEventListener("click",function(){
   daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                var addr = ''; // 주소 변수
                var extraAddr = '';
                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr1").value = extraAddr;
                
                } else {
                    document.getElementById("addr1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr1").value = `${addr} [${data.zonecode}]`;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
                

        }).open();
    });
})

//아이디 중복확인
checkIdBtn.addEventListener("click", function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/isDuplicatedID',
		data: {"id": document.getElementsByName("id")[0].value},
		dataType: 'json',
		success: function(result){
			if(!result){
				alert('사용 가능한 아이디입니다. ');
			} else {
				alert('이미 사용중인 아이디입니다. 다른 아이디를 입력하세요. ');
			}
		},
		error: function(e){
			console.log(e);
		}
	});
});


//인증번호 받기
authBtn.addEventListener("click", function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/auth',
		data: {"id": document.getElementsByName("id")[0].value,
			"email": document.getElementsByName("email")[0].value},
		success: function(){
			console.log('success');
		},
		error: function(e){
			console.log(e);
		}
	});
});

emailCerti.addEventListener("focus", function(){
    $('.btn--white').css('background-color', '#45b8ac').css('pointer-events', 'visible').css('color', '#fff').css('opacity', 1);
});

//인증번호 확인
certiAuthBtn.addEventListener("click", function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/certiAuthKey',
		data: {"id": document.getElementsByName("id")[0].value,
			"certiAuthKey": document.getElementsByName("emailCerti")[0].value},
		dataType: 'text',
		success: function(data){
			console.log(data);
			if(data == 'true') alert("인증이 완료되었습니다. ");
			else alert('인증번호가 잘못되었습니다. ');
		},
		error: function(e){
			console.log(e);
		}
	});
});

//회원가입
$('.btn--lg').click(function(){
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/joinOk',
		data: $('#join-form').serialize(),
		success: function(){
			console.log('success');
			alert('회원가입이 완료되었습니다. ');
			location.href='/mintProject/shop/main/index';
		},
		error: function(e){
			console.log(e);
		}
	});
});

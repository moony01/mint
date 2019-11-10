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
		url: '/mintProject/shop/member/isDuplicated',
		data: {"id": document.getElementsByName("id")[0].value},
		dataType: 'json',
		success: function(result){
			if(!result){
				alert('사용 가능한 아이디입니다. ');
			} else {
				alert('이미 사용중인 아이디입니다. 다른 아이디를 입력하세요. ');
				document.getElementsByName("id")[0].focus();
			}
		},
		error: function(e){
			console.log(e);
		}
	});
});

//ajax 안에 또 ajax가 들어감.. => 이 부분 리팩토링 할 예정!
//인증번호 받기
authBtn.addEventListener("click", function(){
	//우선 이메일 중복확인 먼저 하고 
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/member/isDuplicated',
		data: {"email": document.getElementsByName("email")[0].value},
		success: function(result){
			if(!result){
				alert('사용 가능한 이메일입니다. 인증번호를 발송합니다. ');
				timer = 60*3; 
				counter = setInterval(countDown, 1000); //1초마다 반복적으로 countDown() 실행

				//이메일 중복 아닐 시 인증번호 발송
				$.ajax({
					type: 'post',
					url: '/mintProject/shop/member/auth',
					data: {"id": document.getElementsByName("id")[0].value,
						"email": document.getElementsByName("email")[0].value},
					success: function(){
					},
					error: function(e){
						console.log(e);
					}
				});
			} else {
				alert('이미 사용중인 이메일입니다. ');
				document.getElementsByName("email")[0].focus();
			}
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
			alert('회원가입이 완료되었습니다. ');
			location.href='/mintProject/shop/main/index';
		},
		error: function(e){
			console.log(e);
		}
	});
});


let timer, counter;
//이메일 인증 시 시간 제한 3분
function countDown(){
	let min = parseInt(timer/60);
	let sec = timer % 60;
	
	if(timer == 0) { //제한시간이 지나면 실행중인 루프 종료. 
		clearInterval(counter); 
	}
	
	$('.timeCount').text(zeroPad(min,2)+ ":" + zeroPad(sec,2));
	timer--; 
		
}

//분, 초의 자릿수를 2자리로 맞춤. ex) 2분 9초 => 02:09 
function zeroPad(number, width){ 
	number = number + '';
	return number.length >= width ? number : new Array(width - number.length +1).join('0') +number;
	
}
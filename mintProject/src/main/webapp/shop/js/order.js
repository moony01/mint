/**
 * 한문희
 */
const addrBtn = document.querySelector(".btn-addr");
//배송자 주소 검색
addrBtn.addEventListener("click", function(){
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
                    document.getElementById("delivery_addr1").value = extraAddr;
                
                } else {
                    document.getElementById("delivery_addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("delivery_addr1").value = `${addr} [${data.zonecode}]`;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("delivery_addr2").focus();
            }
                

        }).open();
    });
})




$(document).ready(function(){
	var cnt = $(".price").length;
	var price = new Array(cnt);
	var discountRate = new Array(cnt);
	var discountPriceMinus = new Array(cnt);
	var discountPrice = new Array(cnt);

	let lastPrice = 0; //최종결제금액

	//상품정보 박스 데이터가공(할인적용가, 최종결제금액)
	for(var i=0; i<cnt; i++) {
		price[i] = $('.price span').eq(i).text();
		discountRate[i] = $('.discountRate span').eq(i).text();
		discountPriceMinus[i] = price[i]*(discountRate[i] / 100); //할인된금액
		discountPrice[i] = parseInt(price[i] - discountPriceMinus[i]); //할인적용가
		$(".dp").eq(i).text(discountPrice[i]);
		$(".salesPrice").eq(i).text(discountPrice[i]);
		
		lastPrice +=  discountPrice[i]; //최종결제금액
		$('#lastPrice').text(lastPrice); 
	}

	//데이터 가공 후 붙여주는작업
	let topProductName = $('.mainSubject').eq(0).text();
	$('#topProductName').text(topProductName);	
	$('#productListCount').text(cnt);
	
	let email = $('#memberEmail').text();
	let name = $('#memberName').text();
	let tel = $('#memberTel').text();
	let addr1 = $('#delivery_addr1').val();
	let addr2 = $('#delivery_addr2').val();
	
	
	let tel1 = tel.substring(1,4);
	let tel2 = tel.substring(4,8);
	let tel3 = tel.substring(8,12);
	
	$('#tel1').val(tel1);
	$('#tel2').val(tel2);
	$('#tel3').val(tel3);

	//결제하기 클릭 결제하기
	document.getElementById('btnPayment').onclick = function(){
		var IMP = window.IMP; // 생략가능
		   IMP.init('imp22922268'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		   IMP.request_pay({
			pg: 'html5_inicis', // version 1.1.0부터 지원.  
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: 'MINT 결제', //결제창에서 보여질 이름
			amount: lastPrice, //가격
			buyer_email: email,
			buyer_name: name,
			buyer_tel:  tel,
			buyer_addr: addr1+", "+addr2,
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete' // 나중에 수정
		   }, function (rsp) {
		    console.log(rsp);
		    if (rsp.success) {
			    var msg = '결제가 완료되었습니다.';
			    msg += '고유ID : ' + rsp.imp_uid;
			    msg += '상점 거래ID : ' + rsp.merchant_uid;
			    msg += '결제 금액 : ' + rsp.paid_amount;
			    msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
			    var msg = '결제에 실패하였습니다.';
			    msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	};
});





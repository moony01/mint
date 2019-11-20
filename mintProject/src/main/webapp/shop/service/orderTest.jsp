<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(document).ready(function(){
   <%--  var IMP = window.IMP; // 생략가능
    IMP.init('imp55706666'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'MINT 결제',
        amount : '2000',
        buyer_email : 'jisu@mint.com',
        buyer_name : '최지수',
        buyer_tel : '010-1111-1111',
        buyer_addr : '서울특별시 노원구',
        buyer_postcode : '123-456',
        //m_redirect_url : 'http://www.naver.com'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            //성공시 이동할 페이지
            location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            location.href="<%=request.getContextPath()%>/order/payFail";
            alert(msg);
        }
    }); --%>
    var IMP = window.IMP; // 생략가능
    IMP.init('imp55706666'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    IMP.request_pay({
   		pg: 'html5_inicis', // version 1.1.0부터 지원.  
	    /*
	    'kakao':카카오페이,
	    html5_inicis':이니시스(웹표준결제)
	    'nice':나이스페이
	    'jtnet':제이티넷
	    'uplus':LG유플러스
	    'danal':다날
	    'payco':페이코
	    'syrup':시럽페이
	    'paypal':페이팔
	    */
    	pay_method: 'card',
    	/*
	    'samsung':삼성페이,
	    'card':신용카드,
	    'trans':실시간계좌이체,
	    'vbank':가상계좌,
	    'phone':휴대폰소액결제
	    */
    	merchant_uid: 'merchant_' + new Date().getTime(),
	    /*
	    merchant_uid에 경우
	    https://docs.iamport.kr/implementation/payment
	   	위에 url에 따라가시면 넣을 수 있는 방법이 있움.. 참고하기
	    */
    	name: 'MINT 결제', //결제창에서 보여질 이름
    	amount: 1000, //가격
	    buyer_email: 'iamport@siot.do',
	    buyer_name: '구매자이름',
	    buyer_tel: '010-1111-1111',
	    buyer_addr: '서울특별시 노원구',
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
});
</script>
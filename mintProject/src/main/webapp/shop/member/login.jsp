<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
<section class="content">
    <div class="page-location">
        <a href="/mintProject/shop/main/index">홈</a><span style="margin: 0 5px;">></span><span>로그인</span>
    </div>
    <div class="content__title-location">
        <h1 class="content__title">로그인</h1>
    </div>
    <div class="content__type">
        <span></span>
    </div>
    <form class="login-form" id="loginForm" name="loginForm">
        <div class="login-content">
            <h1>회원 로그인</h1>
            <div class="login__input-container">
                <div class="login__inputs">
                    <input type="text" class="login__input" id="id" name="id">
                    <input type="password" class="login__input" name="pwd">
                </div>
                <div class="login__btn login__login-btn">로그인</div>
            </div>
            <div class="login__id-chk">
                <input type="checkbox" name="checkId" class="check-id">
                <span>아이디 저장</span>
            </div>
        </div>
        <div class="login__btns">
            <div class="login__btn login__btn--primary btn-join" onclick="location.href='/mintProject/shop/member/join'">회원 가입</div>
            <div class="login__btn login__btn--white" onclick="location.href='/mintProject/shop/member/findId'">아이디 찾기</div>
            <div class="login__btn login__btn--white" onclick="location.href='/mintProject/shop/member/findPwd'">비밀번호 찾기</div>
            <div><a id="login-btn-kakao" onclick="javascript:loginWithKakao();"><img src="../storage/kakao_login_btn.png" height="48px"></a></div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>    
</section>
<script src="/mintProject/shop/js/login.js"></script>
<script type='text/javascript'>
if('${status}' == 'fail') { //로그인 실패 시 
	alert("아이디 혹은 비밀번호가 틀립니다. ");
} else if('${status}' == 'need') { // 로그인 전에 인증 권한이 필요한 페이지를 요청했을 시
	alert('로그인 후 이용 가능한 페이지 입니다.');
	location.href='/mintProject/shop/member/login';
} else if('${status}' == 'duplicated') { // 다른 브라우저에서 중복 로그인 되었을 시  
	alert('다른 브라우저에서 로그인 되었습니다.');
	location.href='/mintProject/shop/main/index';
}

function loginWithKakao(){
	//<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('8776ec1322cb0c8918bab2f18fe03c19');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.login({
        success: function (authObj) {
            Kakao.API.request({
            	url : '/v1/user/me',
            	success : function(res){  
            		/* alert(JSON.stringify(res)); */
            		$.ajax({ 
            			type : 'POST',
            			url : '/mintProject/shop/member/kakaoLogin',
            			data : {'email' : res.kaccount_email},
            			success : function(){
            				location.href='/mintProject/shop/main/index';
            			},
            			error : function(err){
            				console.log(err);
            			}
            		});
            	}
            });
        },
        fail: function (err) {
            alert(JSON.stringify(err));
        }
    });
  //]]>	
}
</script>

<!-- CSRF 공격: 인터넷 사용자가 자신의 의지와는 무관하게 공격자가 의도한 행위를 특정 웹 사이트에 요청하도록 만드는 공격. 
방어 기법으로는 1) Referrer 검증, 2) Security Token 가 있으며, mintProject에서는 2) Security Token을 사용한다.

*Security Token 사용 방법
1. front: 사용자의 세션에 임의의 난수 값을 저장하고, 사용자의 요청마다 해당 난수값을 포함시켜 전송한다. 
2. back: 요청받을 때마다 세션에 저장된 토큰값과 요청 파라미터에 전달되는 토큰 값이 일치하는 지 검증한다. 
단점: 같은 도메인 내 XSS 취약점이 있다면 결국 CSRF 공격에 취약해짐. -->
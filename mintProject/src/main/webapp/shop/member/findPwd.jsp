<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="content">
    <div class="page-location">
        <a href="/mintProject/shop/main/index">홈</a><span style="margin: 0 5px;">></span><span>비밀번호 찾기</span>
    </div>
    <div class="content__title-location">
        <h1 class="content__title">비밀번호 찾기</h1>
    </div>
    <div class="content__type">
        <span></span>
    </div>
    <form class="login-form" name="findPwdForm" id="findPwdForm" >
        <div class="login-form hideIfSucceed">
	        <div class="login-content">
	            <h1>비밀번호 찾기</h1>
	            <div class="login__input-container">
	                <div class="login__inputs">
	                	이름 <input type="text" class="login__input" name="name" placeholder="고객님의 이름을 입력해주세요">
	                	아이디 <input type="text" class="login__input" name="id"  placeholder="고객님의  아이디를  입력해주세요">
	                	이메일 <input type="text" class="login__input" name="email" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
	                </div>
	            </div>
	        </div>
	        <div class="login__btns">
	            <div class="login__btn login__btn--primary btn-find">비밀번호 찾기</div>
	           </div>
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</div>
	    <div class="login-form showIfSucceed" style="display: none;">
	    	<div class="login__input-container">
		    	<img class="thumb" src="https://res.kurly.com/mobile/service/member/1908/img_pw_find_email.png" alt="이메일 찾기">
		    	<div class="login-content">
		    		<h1>이메일로 인증 완료 후 비밀번호를 재발급 받으세요 !</h1>
			    	<p>입력하신 이메일로 인증번호가 발송되며, 인증 후 새 비밀번호를 설정할 수 있습니다. 전송량이 많은 경우 이메일 전송이 지연될 수 있습니다. </p> <br>
			    	<div class="join-btn btn--primary btn--lg btn-auth">인증번호 받기</div> 
		    	</div>
	    	</div>
	    </div>    
    </form>
</section>
<script src="/mintProject/shop/js/login.js"></script>
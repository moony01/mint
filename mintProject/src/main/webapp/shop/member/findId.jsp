<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.thumb {
    width: 52px;
    height: 60px;
    margin: 10px 0 5px;
}
</style>
<section class="content">
    <div class="page-location">
        <a href="/mintProject/shop/main/index">홈</a><span style="margin: 0 5px;">></span><span>아이디 찾기</span>
    </div>
    <div class="content__title-location">
        <h1 class="content__title">아이디 찾기</h1>
    </div>
    <div class="content__type">
        <span></span>
    </div>
    <form class="login-form" id="findIdForm" >
        <div class="hideIfSucceed">
	        <div class="login-content">
	            <h1>아이디 찾기</h1>
	            <div class="login__input-container">
	                <div class="login__inputs">
	                	이름 <input type="text" class="login__input" name="name" placeholder="고객님의 이름을 입력해주세요">
	                	이메일 <input type="text" class="login__input" name="email"  placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
	                </div>
	            </div>
	        </div>
	        <div class="login__btns">
	            <div class="login__btn login__btn--primary btn-find">아이디 찾기</div>
	           </div>
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	   	</div>
	   	
	    <div class="showIfSucceed" style="display: none;">
	    	<div class="login__input-container">
		    	<img class="thumb" src="https://res.kurly.com/pc/service/member/1908/img_id_find_succsess_v2.png" alt="아이디찾기완료">
		    	<div class="login-content">
		    		<h1>고객님의 아이디 찾기가 완료되었습니다.</h1>
			    	<p class="findId">아이디: </p> <br>
			    	<div class="join-btn btn--primary btn--lg" onclick="location.href='/mintProject/shop/member/login'">로그인 하기</div> 
		    	</div>
	    	</div>
	    </div>    
    </form>
</section>
<script src="/mintProject/shop/js/find.js"></script>
<script src="/mintProject/shop/js/authFunction.js"></script>
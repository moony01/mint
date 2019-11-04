<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="content">
    <div class="page-location">
        <a href="/shop/main/index">홈</a><span style="margin: 0 5px;">></span><span>로그인</span>
    </div>
    <div class="content__title-location">
        <h1 class="content__title">로그인</h1>
    </div>
    <div class="content__type">
        <span></span>
    </div>
    <form class="login-form">
        <div class="login-content">
            <h1>회원 로그인</h1>
            <div class="login__input-container">
                <div class="login__inputs">
                    <input type="text" class="login__input" name="id">
                    <input type="text" class="login__input" name="pwd">
                </div>
                <div class="login__btn login__login-btn">로그인</div>
            </div>
            <div class="login__id-chk">
                <input type="checkbox" name="checkId" class="check-id">
                <span>아이디 저장</span>
            </div>
        </div>
        <div class="login__btns">
            <div class="login__btn login__btn--primary btn-join">회원 가입</div>
            <div class="login__btn login__btn--white btn-findId">아이디 찾기</div>
            <div class="login__btn login__btn--white btn-findPwd">비밀번호 찾기</div>
        </div>
    </form>    
</section>
<script src="/shop/js/join.js"></script>

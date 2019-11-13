<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="my-page__top-article">

</div>
<seciton class="service">
    <div class="snb">
        <h2 class="snb__title">마이컬리</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="">주문내역</a></li>
            <li class="snb__item"><a href="">늘 사는 것</a></li>
            <li class="snb__item"><a href="">상품 후기</a></li>
            <li class="snb__item"><a href="">적림금</a></li>
            <li class="snb__item current"><a href="">개인 정보 수정</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">개인 정보 수정</h2>
        <h3 class="my-page__sub-title">기본정보</h3> 
        <div class="modi-wrap">
            <div class="join-col">
                <div class="join-title">아이디</div>
                <input type="text" class="join-input input--lg" name="id" readonly>
            </div>
            <div class="join-col">
                <div class="join-title">현재 비밀번호</div>
                <input type="password" class="join-input input--lg" name="pwd">
            </div>
            <div class="join-col">
                <div class="join-title">새 비밀번호</div>
                <input type="password" class="join-input input--lg" name="npwd">
            </div>
            <div class="join-col">
                <div class="join-title">새 비밀번호 확인</div>
                <input type="password" class="join-input input--lg" name="nrepwd">
            </div>
            <div class="join-col">
                <div class="join-title">이름*</div>
                <input type="text" class="join-input input--lg" name="name">
            </div>
            <div class="join-col">
                <div class="join-title">휴대폰*</div>
                <input type="text" class="join-input input--lg" name="tel">
            </div>
            <div class="join-col">
                <div class="join-title">이메일*</div>
                <input type="text" class="join-input input--lg" name="email">
                <div class="join-btn btn--primary">인증번호 받기</div>
            </div>
            <div class="join-col">
                <div class="join-title"></div>
                <input type="text" class="join-input input--lg" name="emailCerti" readonly>
                <div class="join-btn btn--white">인증번호 확인</div>
            </div>
        </div>
        <h3 class="my-page__sub-title">추가 정보</h3> 
        <div class="modi-wrap">
            <div class="join-col">
                <div class="join-title">성별</div>
                <div class="join__radio-group">
                    <label class="radion-container">남자
                        <input type="radio" name="gender" value="0">
                        <span class="checkmark"></span>
                    </label>
                    <label class="radion-container">여자
                        <input type="radio" name="gender" value="1">
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>
            <div class="join-col">
                <div class="join-title">생년월일</div>
                <div class="join__birth">
                    <div class="join__birth-col">
                        <input type="text" class="join-input input--sm" name="year" placeholder="년(4자)" maxlength="4">
                    </div>
                    <div class="join__birth-col">
                        <input type="text" class="join-input input--sm" name="month" placeholder="월" maxlength="2">
                    </div>
                    <div class="join__birth-col">
                        <input type="text" class="join-input input--sm" name="day" placeholder="일" maxlength="2">
                    </div>
                </div>
            </div> 
        </div>
        <div class="my-wrap--center">
            <div class="join-btn wd-btn">탈퇴하기</div>
            <div class="join-btn modi-btn">수정하기</div>
        </div>
    </div>
    
</seciton>
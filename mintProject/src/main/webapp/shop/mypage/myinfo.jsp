<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="mypage_main.jsp"/>

<section class="service">
    <div class="snb">
        <h2 class="snb__title">마이페이지</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/mintProject/shop/mypage/myOrderList">주문내역</a></li>
            <li class="snb__item"><a href="">늘 사는 것</a></li>
            <li class="snb__item"><a href="/mintProject/shop/mypage/review">상품 후기</a></li>
            <li class="snb__item"><a href="">적림금</a></li>
            <li class="snb__item current"><a href="/mintProject/shop/mypage/myinfo_pwd">개인 정보 수정</a></li>
            <li class="snb__item"><a href="/mintProject/shop/mypage/attendance">출석체크</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">개인 정보 수정</h2>
        <h3 class="my-page__sub-title">기본정보</h3> 
        <input type="hidden" id="gender" value="${memberDTO.gender }">
		<input type="hidden" id="birthday" value="${memberDTO.birthday }">
        <form id="modify-form" method="post" action="/mintProject/shop/mypage/myinfo_modify">
        <div class="modi-wrap">
            <div class="join-col">
                <div class="join-title">아이디</div>
                <input type="text" class="join-input input--lg" name="id" readonly value="${memberDTO.id }">
            </div>
            <!-- <div class="join-col">
                <div class="join-title">현재 비밀번호</div>
                <input type="password" class="join-input input--lg" name="pwd">
            </div> -->
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
                <input type="text" class="join-input input--lg" name="name" value="${memberDTO.name }">
            </div>
            <div class="join-col">
                <div class="join-title">휴대폰</div>
                <input type="text" class="join-input input--lg" name="tel" value="${memberDTO.tel }">
            </div>
            <div class="join-col">
                <div class="join-title">이메일*</div>
                <input type="text" class="join-input input--lg" name="email" value="${memberDTO.email }" readonly="readonly">
            </div>
        </div>
        <h3 class="my-page__sub-title">추가 정보</h3> 
        <div class="modi-wrap">
            <div class="join-col">
                <div class="join-title">성별</div>
                <div class="join__radio-group">
                    <label class="radion-container">남자
                        <input type="radio" name="gender" value="0" id="gender_0">
                        <span class="checkmark"></span>
                    </label>
                    <label class="radion-container">여자
                        <input type="radio" name="gender" value="1" id="gender_1">
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>
            <div class="join-col">
                <div class="join-title">생년월일</div>
                <div class="join__birth">
                    <div class="join__birth-col">
                        <input type="text" class="join-input input--sm" name="year" placeholder="년(4자)" maxlength="4" id="year">
                    </div>
                    <div class="join__birth-col">
                        <input type="text" class="join-input input--sm" name="month" placeholder="월" maxlength="2" id="month">
                    </div>
                    <div class="join__birth-col">
                        <input type="text" class="join-input input--sm" name="day" placeholder="일" maxlength="2" id="day">
                    </div>
                </div>
            </div> 
        </div>
        </form>
        <div class="my-wrap--center">
            <div class="join-btn wd-btn" id="wd_btn">탈퇴하기</div>
            <div class="join-btn modi-btn" id="modi_btn">수정하기</div>
        </div>
    </div>
    
</section>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/mintProject/shop/js/myinfo.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#gender_'+$('#gender').val()).prop('checked', true);
	$('#year').val($('#birthday').val().substring(0,4));
	$('#month').val($('#birthday').val().substring(4,6));
	$('#day').val($('#birthday').val().substring(6,9));
});
</script>

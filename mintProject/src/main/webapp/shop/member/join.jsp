<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<section class="content join">
    <div class="page-location">
        <a href="/mintProject/shop/main/index">홈</a
        ><span style="margin: 0 5px;">></span><span>회원가입</span>
    </div>
    <div class="content__title-location">
        <h1 class="content__title">회원가입</h1>
    </div>
    <div class="content__type">
        <span>*필수입력사항</span>
    </div>
    <form id="join-form">
        <div class="join-content">
            <div class="join-col">
                <div class="join-title">아이디*</div>
                <input
                    type="text"
                    class="join-input input--lg"
                    name="id"
                    id="id"
                    placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"
                />
            </div>

            <div class="join-check" id="checkId">
                <div id="checkId-1">
                    6~12자의 영문 혹은 영문과 숫자만 사용
                </div>
                <div id="checkId-2">사용 가능 아이디</div>
            </div>

            <div class="join-col">
                <div class="join-title">비밀번호*</div>
                <input
                    type="password"
                    class="join-input input--lg"
                    name="pwd"
                    id="pwd"
                    placeholder="비밀번호를 입력해주세요"
                />
            </div>

            <div class="join-check" id="checkPwd">
                <div id="checkPwd-1">
                    8~16 글자 입력
                </div>
                <div id="checkPwd-2">
                    영문/숫자/특수문자(공백 제외)만 허용하며, 최소 1개씩 포함
                </div>
            </div>

            <div class="join-col">
                <div class="join-title">비밀번호확인*</div>
                <input
                    type="password"
                    class="join-input input--lg"
                    name="repwd"
                    id="repwd"
                    placeholder="비밀번호를 한번 더 입력해주세요"
                />
            </div>

            <div class="join-check" id="checkRepwd">
                <div id="checkRepwd-1">
                    동일한 비밀번호를 입력해주세요.
                </div>
            </div>

            <div class="join-col">
                <div class="join-title">이름*</div>
                <input
                    type="text"
                    class="join-input input--lg"
                    name="name"
                    id="name"
                    placeholder="고객님의 이름을 입력해주세요"
                />
            </div>

            <div class="join-check" id="checkName">
                <div id="checkName-1">
                    이름을 입력해주세요
                </div>
            </div>

            <div class="join-col">
                <div class="join-title">휴대폰</div>
                <input
                    type="text"
                    class="join-input input--lg"
                    name="tel"
                    maxlength="12"
                    placeholder="숫자만 입력해주세요"
                />
            </div>

            <div class="join-col">
                <div class="join-title">이메일*</div>
                <input
                    type="text"
                    class="join-input input--lg"
                    name="email"
                    id="email"
                    placeholder="ex) mintkurly@mint.com"
                />
                <div class="join-btn btn--primary btn-auth">인증번호 받기</div>
            </div>
            <div class="join-col">
                <div class="join-title"></div>
                <div class="join__email">
                    <input
                        type="text"
                        class="join-input input--lg"
                        name="emailCerti"
                        maxlength="6"
                        id="emailCerti"
                    />
                    <div class="time-count"></div>
                </div>
                <div class="join-btn btn--white btn-certiAuthKey">
                    인증번호 확인
                </div>
            </div>
            <div class="join-check" id="checkEmail">
                <div id="checkEmail-1">
                    인증 완료
                </div>
            </div>
            <div class="join-col">
                <div class="join-title">배송 주소</div>
                <div class="join-btn btn--primary btn-addr">주소 검색</div>
            </div>
            <div class="join-col">
                <div class="join-title"></div>
                <input
                    type="text"
                    class="join-input input--full"
                    name="addr1"
                    id="addr1"
                    readonly
                />
            </div>

            <div class="join-col">
                <div class="join-title"></div>
                <input
                    type="text"
                    class="join-input input--full"
                    name="addr2"
                    id="addr2"
                    placeholder="세부 주소를 입력해주세요"
                />
            </div>

            <div class="join-col">
                <div class="join-title">성별</div>
                <div class="join__radio-group">
                    <label class="radion-container"
                        >남자
                        <input type="radio" name="gender" value="0" />
                        <span class="checkmark"></span>
                    </label>
                    <label class="radion-container"
                        >여자
                        <input type="radio" name="gender" value="1" />
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>

            <div class="join-col">
                <div class="join-title">생년월일</div>
                <div class="join__birth">
                    <div class="join__birth-col">
                        <input
                            type="text"
                            class="join-input input--sm"
                            name="year"
                            placeholder="년(4자)"
                            maxlength="4"
                        />
                    </div>
                    <div class="join__birth-col">
                        <input
                            type="text"
                            class="join-input input--sm"
                            name="month"
                            placeholder="월"
                            maxlength="2"
                        />
                    </div>
                    <div class="join__birth-col">
                        <input
                            type="text"
                            class="join-input input--sm"
                            name="day"
                            placeholder="일"
                            maxlength="2"
                        />
                    </div>
                </div>
            </div>
        </div>
        <div class="join__submit-wrap">
            <div class="join-btn btn--primary btn--lg" id="writeBtn">
                가입 하기
            </div>
        </div>
    </form>
</section>
<div class="notice-modal hidden">
    <div class="notice-modal__overlay"></div>
    <div class="notice-modal__content">
        <div class="notice-modal__header">
            <span class="notice-modal__tit">알림메시지</span>
            <button class="notice-modal__close-btn"></button>
        </div>
        <div class="notice-modal__message"></div>
        <div class="notice-modal__footer">
            <button class="notice-modal__yes-btn">
                확인
            </button>
        </div>
    </div>
</div>

<script src="/mintProject/shop/js/authFunction.js"></script>
<script src="/mintProject/shop/js/join.js"></script>

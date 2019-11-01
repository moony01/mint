<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://kit.fontawesome.com/09d022f581.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/join.css">
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="../js/index.js"></script>
    <title>회원 가입</title>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <img src="https://res.kurly.com/pc/service/common/1908/delivery_190819.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" class="header__deliver-img">
        <ul class="my-page">
            <li class="my-page__item"><a href="/marketKurly/shop/member/join.jsp">회원가입</a></li>
            <li class="my-page__item"><a href="/marketKurly/shop/member/login.jsp">로그인</a></li>
            <li class="my-page__item">
                <a href="">고객센터</a>
                <ul class="qna__menu">
                    <li><a href="">공지사항</a></li>
                    <li><a href="">자주하는 질문</a></li>
                    <li><a href="">1:1 문의</a></li>
                    <li><a href="">상품 제안</a></li>
                </ul>
            </li>
            <li class="my-page__item"><a href="">배송안내</a></li>
        </ul>
        <div class="header__main-wrap">
            <a href="/marketKurly/shop/main/index.jsp"><img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고" class="header__main-logo"></a>
        </div>
    </header>
    <!-- 대메뉴 -->
    <nav class="gnb">
        <ul class="gnb__list">
            <li class="gnb__item"><a href=""><i class="fas fa-bars"></i>전체 카테고리</a></li>
            <li class="gnb__item"><a href="">신상품</a></li>
            <li class="gnb__item"><a href="">베스트</a></li>
            <li class="gnb__item"><a href="">알뜰쇼핑</a></li>
            <li class="gnb__item"><a href="">이벤트</a></li>
        </ul>
    </nav>
    <section class="content join">
        <div class="page-location">
            <a href="./index.html">홈</a><span style="margin: 0 5px;">></span><span>회원가입</span>
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
                    <input type="text" class="join-input input--lg" name="id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
                </div>
                <div class="join-col">
                    <div class="join-title">비밀번호*</div>
                    <input type="text" class="join-input input--lg" name="pwd" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="join-col">
                    <div class="join-title">비밀번호확인*</div>
                    <input type="text" class="join-input input--lg" name="repwd" placeholder="비밀번호를 한번 더 입력해주세요">
                </div>
                <div class="join-col">
                    <div class="join-title">이름*</div>
                    <input type="text" class="join-input input--lg" name="name" placeholder="고객님의 이름을 입력해주세요">
                </div>
                <div class="join-col">
                    <div class="join-title">휴대폰*</div>
                    <input type="text" class="join-input input--lg" name="tel" placeholder="숫자만 입력해주세요">
                </div>
                <div class="join-col">
                    <div class="join-title">이메일*</div>
                    <input type="text" class="join-input input--lg" name="email" placeholder="ex) mintkurly@mint.com">
                    <div class="join-btn btn--primary">인증번호 받기</div>
                </div>
                <div class="join-col">
                    <div class="join-title"></div>
                    <input type="text" class="join-input input--lg" name="emailCerti" readonly>
                    <div class="join-btn btn--white">인증번호 확인</div>
                </div>
                <div class="join-col">
                    <div class="join-title">배송 주소</div>
                    <div class="join-btn btn--primary btn-addr">주소 검색</div>
                </div>
                <div class="join-col">
                    <div class="join-title"></div>
                    <input type="text" class="join-input input--full" name="addr1" id="addr1" readonly>
                </div>
                
                <div class="join-col">
                    <div class="join-title"></div>
                    <input type="text" class="join-input input--full" name="addr2" id="addr2" placeholder="세부 주소를 입력해주세요">
                </div>

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
            <div class="join__submit-wrap">
                <div class="join-btn btn--primary btn--lg">가입 하기</div> 
            </div>
        </form>
    </section>
    <footer class="footer">

    </footer>
</body>
<script src="./js/join.js"></script>
</html>
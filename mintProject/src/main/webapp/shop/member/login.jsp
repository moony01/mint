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
    <link rel="stylesheet" href="../css/login.css">
    <script src="../js/index.js"></script>
    <title>로그인</title>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <img src="https://res.kurly.com/pc/service/common/1908/delivery_190819.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" class="header__deliver-img">
        <ul class="my-page">
            <li class="my-page__item login"><a href="/mintProject/shop/member/join.jsp">회원가입</a></li>
            <li class="my-page__item join"><a href="/mintProject/shop/member/login.jsp">로그인</a></li>
            <li class="my-page__item qna">
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
            <a href="/mintProject/shop/main/index.jsp"><img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고" class="header__main-logo"></a>
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
    <section class="content">
        <div class="page-location">
            <a href="./index.html">홈</a><span style="margin: 0 5px;">></span><span>로그인</span>
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
    <footer class="footer">

    </footer>
</body>
<script src="./js/join.js"></script>
</html>
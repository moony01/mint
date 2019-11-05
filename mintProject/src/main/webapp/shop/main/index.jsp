<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <!-- fontawome  -->
    <script src="https://kit.fontawesome.com/09d022f581.js" crossorigin="anonymous"></script>
    
   	<!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	
	
	 <!-- 다음 우편번호 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <link rel="stylesheet" href="/mintProject/shop/css/style.css">
    <link rel="stylesheet" href="/mintProject/shop/css/reset.css">
    <link rel="stylesheet" href="/mintProject/shop/css/service.css">
    <link rel="stylesheet" href="/mintProject/shop/css/login.css">
    <link rel="stylesheet" href="/mintProject/shop/css/join.css">
    
       
    <script src="/mintProject/shop/js/index.js"></script>
    
  
    <title>Document</title>
</head>
<body>
    <header class="header">
        <img src="https://res.kurly.com/pc/service/common/1908/delivery_190819.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" class="header__deliver-img">
        <ul class="my-page">
            <li class="my-page__item"><a href="/mintProject/shop/member/join">회원가입</a></li>
            <li class="my-page__item"><a href="/mintProject/shop/member/login">로그인</a></li>
            <li class="my-page__item my-page__qna">
                <a href="/mintProject/shop/service/notice/">고객센터</a>
                <ul class="qna__menu">
                    <li><a href="/mintProject/shop/service/notice">공지사항</a></li>
                    <li><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
                    <li><a href="/mintProject/shop/service/qna">1:1 문의</a></li>
                    <li><a href="/mintProject/shop/service/offer">상품 제안</a></li>
                </ul>
            </li>
            <li class="my-page__item"><a href="">배송안내</a></li>
        </ul>
        <div class="header__main-wrap">
            <a href="/mintProject/shop/main/index"><img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고" class="header__main-logo"></a>
        </div>
    </header>
    <nav class="gnb">
        <ul class="gnb__list">
            <li class="gnb__item"><a href=""><i class="fas fa-bars"></i>전체 카테고리</a></li>
            <li class="gnb__item"><a href="">신상품</a></li>
            <li class="gnb__item"><a href="">베스트</a></li>
            <li class="gnb__item"><a href="">알뜰쇼핑</a></li>
            <li class="gnb__item"><a href="">이벤트</a></li>
        </ul>
    </nav>
    
   <jsp:include page="${display }"/> 
    
    <footer class="footer">

    </footer>
</body>
</html>
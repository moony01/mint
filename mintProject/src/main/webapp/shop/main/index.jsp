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
    
    <!-- swiper api -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    
    <link rel="stylesheet" href="/mintProject/shop/css/style.css">
    <link rel="stylesheet" href="/mintProject/shop/css/reset.css">
    <link rel="stylesheet" href="/mintProject/shop/css/service.css">
    <link rel="stylesheet" href="/mintProject/shop/css/login.css">
    <link rel="stylesheet" href="/mintProject/shop/css/join.css">
    <link rel="stylesheet" href="/mintProject/shop/css/notice.css">
    <link rel="stylesheet" href="/mintProject/shop/css/productList.css">
    <link rel="stylesheet" href="/mintProject/shop/css/productView.css">
    
       
    <script src="/mintProject/shop/js/index.js"></script>
    
  
    <title>민트</title>
</head>
<body>
    <header class="header">
        <img src="https://res.kurly.com/pc/service/common/1908/delivery_190819.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" class="header__deliver-img">
        <ul class="my-page">
            <li class="my-page__item"><a href="/mintProject/shop/member/join">회원가입</a></li>
            <li class="my-page__item"><a href="/mintProject/shop/member/login">로그인</a></li>
            <li class="my-page__item my-page__qna">
                <a href="/mintProject/shop/service/notice?pg=1">고객센터</a>
                <ul class="qna__menu">
                    <li><a href="/mintProject/shop/service/notice?pg=1">공지사항</a></li>
                    <li><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
                    <li><a href="/mintProject/shop/service/qna">1:1 문의</a></li>
                    <li><a href="/mintProject/shop/service/offer">상품 제안</a></li>
                </ul>
            </li>
            <li class="my-page__item"><a href="">배송안내</a></li>
        </ul>
        <div class="header__main-wrap">
            <a href="/mintProject/shop/main/index"><img src="/mintProject/shop/storage/mint/icon/main_logo.png" alt="마켓컬리 로고" class="header__main-logo"></a>
<!--             <a href="/mintProject/shop/main/index"><img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고" class="header__main-logo"></a> -->
        </div>
    </header> 
    <nav class="gnb">
        <ul class="gnb__list">
            <li class="gnb__item">
                <a href=""><span><i class="fas fa-bars"></i>전체 카테고리</span></a>
                <div class="gnb__category">
                    <ul class="gnb__menu">
                        <li><a href="/mintProject/productList/getProductList?mainCategory=101&gubun=1&pg=1">농산물</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=211&gubun=2&pg=1">과일</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=212&gubun=2&pg=1">기본채소</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=213&gubun=2&pg=1">쌈채소</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=214&gubun=2&pg=1">브로콜리·특수채소</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=215&gubun=2&pg=1">피망·고추</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=216&gubun=2&pg=1">곡류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=217&gubun=2&pg=1">버섯류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=218&gubun=2&pg=1">견과류</a></li>
                    </ul>
                    <ul class="gnb__menu">
                        <li><a href="/mintProject/productList/getProductList?mainCategory=102&gubun=1&pg=1">수산물</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=221&gubun=2&pg=1">생선류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=222&gubun=2&pg=1">조개류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=223&gubun=2&pg=1">갑각류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=224&gubun=2&pg=1">해조류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=225&gubun=2&pg=1">건어물</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=226&gubun=2&pg=1">오징어</a></li>
                    </ul>
                    <ul class="gnb__menu">
                        <li><a href="/mintProject/productList/getProductList?mainCategory=103&gubun=1&pg=1">축산물</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=231&gubun=2&pg=1">소고기</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=232&gubun=2&pg=1">돼지고기</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=233&gubun=2&pg=1">닭고기</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=234&gubun=2&pg=1">계란류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=235&gubun=2&pg=1">오리고기</a></li>
                    </ul>
                    <ul class="gnb__menu">
                        <li><a href="/mintProject/productList/getProductList?mainCategory=104&gubun=1&pg=1">일반식품</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=241&gubun=2&pg=1">유제품</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=242&gubun=2&pg=1">만두류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=243&gubun=2&pg=1">라면</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=244&gubun=2&pg=1">과자</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=245&gubun=2&pg=1">국수</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=246&gubun=2&pg=1">어묵</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=247&gubun=2&pg=1">햄</a></li>
                    </ul>
                    <ul class="gnb__menu">
                        <li><a href="/mintProject/productList/getProductList?mainCategory=105&gubun=1&pg=1">반찬류</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=251&gubun=2&pg=1">김치</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=252&gubun=2&pg=1">국·찌개</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=253&gubun=2&pg=1">전·부침</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=254&gubun=2&pg=1">간편식</a></li>
                        <li><a href="/mintProject/productList/getProductList?subCategory=255&gubun=2&pg=1">통조림</a></li>
                    </ul>
                </div>
            </li>
            <li class="gnb__item"><a href="/mintProject/productList/getProductList?gubun=3&headGubun=1&pg=1"><span>신상품</span></a></li>
            <li class="gnb__item"><a href="/mintProject/productList/getProductList?gubun=3&headGubun=2&pg=1"><span>베스트</span></a></li>
            <li class="gnb__item"><a href="/mintProject/productList/getProductList?gubun=3&headGubun=3&pg=1"><span>알뜰쇼핑</span></a></li>
            <li class="gnb__item"><a href="/mintProject/productList/getProductList?gubun=3&headGubun=4&pg=1"><span>이벤트</span></a></li>
            <li><input type="text" class="gnb__item" id="sword_m" name="sword"></li>
        	<li><input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" onclick="search_from_main()" width="40px;" height="40px;"></li>
        </ul>
        <div class="cart_count">
        	<a class="btn_cart" href="/mintProject/shop/goods/cart"><img src="https://res.kurly.com/pc/ico/1908/ico_cart_x2_v2.png" alt="장바구니"></a>
        	<label>${memCart }</label> <!-- 로그인 시 해당 아이디의 장바구니 count(*) 를 세션에 담아 가져옴. -->
        </div>
    </nav>
    
   <jsp:include page="${display}"/>
    
    <footer class="footer">

    </footer>

</body>
<script type="text/javascript" src="/mintProject/shop/js/event.js"></script>
<script>
let memId = '${memId}';
let memName = '${memName}';
let memEmail = '${memEmail}';
checkMemId(memId, memName);
$('#logoutForm').append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">');
</script>
</html>

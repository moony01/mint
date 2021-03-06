<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/09d022f581.js" crossorigin="anonymous"></script>

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include datetimepicker(xdsoft) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">

	<!-- include moment.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
	
	
	<!-- 스윗 알러트 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

    <!-- 다음 우편번호 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
    <link rel="stylesheet" href="/mintProject/shop/css/reset.css">
    <link rel="stylesheet" href="/mintProject/admin/css/admin.css">
    <script></script>
    <title>관리자 페이지</title>
</head>
<body>
    <header class="header">
        <h1 onclick="location.href='/mintProject/admin/main/admin'" style="cursor: pointer;">
            관리자 페이지
        </h1>
        <div class="admin-info">
            <span>${memName } 님</span>
            <span onclick="location.href='/mintProject/shop/member/logout'" style="cursor: pointer;"><i class="fas fa-sign-out-alt"></i>로그아웃</span>
        </div>
    </header>
    <div class="admin-page">
        <nav class="navigation">
            <div class="mem-manage">  
                <div class="nav__item">
                    <i class="fas fa-user"></i>
                    <span>유저</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/member/memberList">회원 관리</a></li>
                    <li><a href="/mintProject/admin/member/supplierList">판매자 관리</a></li>
                </ul>            
            </div>
            <div class="prd-manage">
                <div class="nav__item">
                    <i class="fas fa-shopping-cart"></i>
                    <span>상품</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/productAdminList?pg=1">상품 관리</a></li> <!-- 일단 상품 등록 페이지로 연결 -->
                </ul>
            </div>
            <div class="event-manage">
                <div class="nav__item" >
                    <i class="fas fa-gift"></i>
                    <span>이벤트</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/service/event">이벤트 관리</a></li>
                </ul>
            </div>
            <div class="board-manage">
                <div class="nav__item">
                    <i class="fas fa-tasks"></i>
                    <span>게시판</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/service/faq">FAQ 관리</a></li>
                    <li><a href="/mintProject/admin/service/getAdminQnaBoardList?pg=1">1:1문의 관리</a></li>
                    <li><a href="/mintProject/admin/service/notice?pg=1">공지사항 관리</a></li>
                    <li><a href="/mintProject/admin/service/productQna">상품문의 관리</a></li>
                    <li><a href="/mintProject/admin/service/review">상품후기 관리</a></li>
                    <li><a href="/mintProject/admin/service/offer">상품제안 관리</a></li>
                </ul>
            </div>
            <div class="sales-manage">
                <div class="nav__item" >
                    <i class="fas fa-money-check-alt"></i>
                    <span>주문</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/sales/order">주문 관리</a></li>
                </ul>
            </div>
        </nav>
        <div class="main">
 
            <jsp:include page="${display }"/>
            <%-- <jsp:include page="faq.jsp"/> --%>
            
        </div>
    </div>
</body>
</html>
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

    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

    <!-- 다음 우편번호 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
    <link rel="stylesheet" href="/mintProject/shop/css/reset.css">
    <link rel="stylesheet" href="/mintProject/admin/css/admin.css">
    <script></script>
    <style>
        
    </style>
    <title>관리자 페이지</title>
</head>
<body>
    <header class="header">
        <h1>
            관리자 페이지
        </h1>
        <div class="admin-info">
            <span>MinT 님</span>
            <span><i class="fas fa-sign-out-alt"></i>로그아웃</span>
        </div>
    </header>
    <div class="admin-page">
        <nav class="navigation">
            <div class="mem-manage">  
                <div class="nav__item">
                    <i class="fas fa-user"></i>
                    <span>회원</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/member/memberList">회원 목록</a></li>
                    <li><a href="/mintProject/admin/member/supplierList">판매자 목록</a></li>
                    <li><a href="/mintProject/admin/member/supplierForm">판매자 등록</a></li>
                </ul>            
            </div>
            <div class="prd-manage">
                <div class="nav__item">
                    <i class="fas fa-shopping-cart"></i>
                    <span>상품</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/productManage/productWriteForm">상품 관리</a></li> <!-- 일단 상품 등록 페이지로 연결 -->
                </ul>
            </div>
            <div class="event-manage">
                <div class="nav__item" >
                    <i class="fas fa-gift"></i>
                    <span>이벤트</span>
                </div>
                <ul class="list">
                    <li><a href="">이벤트 관리</a></li>
                </ul>
            </div>
            <div class="board-manage">
                <div class="nav__item">
                    <i class="fas fa-tasks"></i>
                    <span>게시판</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/service/faq">faq 관리</a></li>
                    <li><a href="/mintProject/admin/service/qna">1:1문의 관리</a></li>
                    <li><a href="/mintProject/admin/service/notice">공지사항 관리</a></li>
                    <li><a href="/mintProject/admin/service/qna">상품 qna관리</a></li>
                    <li><a href="/mintProject/admin/service/review">후기관리</a></li>
                    <li><a href="/mintProject/admin/service/offer">상품제안 관리</a></li>
                </ul>
            </div>
            <div class="sales-manage">
                <div class="nav__item" >
                    <i class=""></i>
                    <span>매출</span>
                </div>
                <ul class="list">
                    <li><a href="/mintProject/admin/sales">매출 관리</a></li>
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
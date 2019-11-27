<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/mintProject/shop/css/service.css">    

<jsp:include page="mypage_main.jsp"/>

<seciton class="service">
    <div class="snb">
        <h2 class="snb__title">마이컬리</h2>
        <ul class="snb__list">
            <li class="snb__item current"><a href="">주문내역</a></li>
            <li class="snb__item"><a href="">늘 사는 것</a></li>
            <li class="snb__item"><a href="">상품 후기</a></li>
            <li class="snb__item"><a href="">적림금</a></li>
            <li class="snb__item"><a href="">개인 정보 수정</a></li>
            <li class="snb__item"><a href="">출석체크</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">주문내역</h2>
        <div class="searches" style="float: right; display:flex; justify-content: flex-end;">
	            <input type="text" name="daterange">
	            <div class="search">
	                <input type="button" class="searchButton" onclick="getOrderInfoByOption($(this))">
	                <i class="fa fa-search"></i>
	            </div>
	    </div>
        <table class="tb tb-orderInfo">
			<tr>
			    <th class="size-2">배송상태</th>
			    <th class="size-2">주문번호</th>
			    <th class="size-2">주문날짜</th>
			</tr>
		</table>
	</div>  
</seciton>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
<script src="/mintProject/shop/js/myOrderList.js"></script>
<script>
//date picker 적용
$(function() {
	  $('input[name="daterange"]').daterangepicker({
		locale: {
	        format: 'YY/MM/DD'
	    }
	  }, function(start, end, label) {
	  });
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="cart">

<div class="section_cart">
	<form id="cartList" name="cartList" action="/mintProject/shop/goods/order">
	<div class="cart_goods">
		<table class="" style="width: 100%;">
			<caption>장바구니 목록 제목</caption>
			<colgroup>
			<col style="width: 5%;">
			<col style="width: 25%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
			</colgroup>
			 
			<thead>
			<tr>
				<th id="thSelect"><input type="checkbox" class="allCheck ico_check" onchange="total_calcul()" checked></th>
				<th id="thSelect">전체선택 (<span class="prd_count">0</span>/<span class="prd_total_count">0</span>)</th>
				<th id="thInfo">상품 정보</th>
				<th id="thCount">수량</th>
				<th id="thCost">상품금액</th>
				<th id="thDelete">삭제선택</th>
			</tr>
			</thead>
			
			<tbody class="viewGoods">
				
			</tbody>
		</table>
	</div>
	
	<div class="">
		<label class="label_check"><input type="checkbox" class="allCheck ico_check" onchange="total_calcul()" checked></label>
		<span class="tit"> 전체선택 (<span class="prd_count">0</span>/<span class="prd_total_count">0</span>) </span>
		<button type="button" class="btn_delete selectBtn">선택 삭제</button>
		<button type="button" class="btn_delete soldOutBtn">품절 상품 삭제</button>
	</div>
	
	<div>
		<div id="totalPrdPrice">
			상품금액 <span>0</span>원
		</div>
		<p>-</p>
		<div id="totalDiscountPrice">
			상품할인금액 <span>0</span>원
		</div>
		<p>+</p>
		<div id="DeliveryPrice">
			배송비 <span>0</span>원
		</div>
		<p>=</p>
		<div id="totalSumPrice">
			<div>결제예정금액
				<span>0</span>원
			</div>
		</div>
		<div id="totalPoint">	
			<div>구매시
			 	<span>0</span>원 적립예정</div>
		</div>
	</div>
	
	<input type="button" id="placeAnOrder" value="주문하기">
	
	</form>
</div>

</section>

<script type="text/javascript" src="/mintProject/shop/js/cart.js"></script>
<script type="text/javascript">
document.getElementById('placeAnOrder').onclick = function(){
	var passPrice = parseInt($('#totalPrdPrice span').text());
	
	if(passPrice==0) {
		alert("결제할 항목을 선택하세요");
	}else {
		if(confirm("결제를 진행하시겠습니까?")) {
			$('#cartList').submit();
		}
	}
};
</script>






















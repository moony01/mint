<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="cart">

<div id="main">
	<div id="content" style="width: 100%;">
	<div class="section_cart">
		<form id="" name="" method="post" action="">
		
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
					<th id="thSelect"><input type="checkbox" name="allCheck" class="ico_check"></th>
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
			<label class="label_check"><input type="checkbox" name="allCheck" class="ico_check"></label>
			<span class="tit"> 전체선택 (<span class="prd_count">0</span>/<span class="prd_total_count">0</span>) </span>
			<button type="button" class="btn_delete">선택 삭제</button>
			<button type="button" class="btn_delete">품절 상품 삭제</button>
		</div>
		
		<div>
			<div id="totalPrdPrice">
				상품금액 <span>0</span>원
			</div>
			<p>-</p>
			<div>
				상품할인금액 <span>0</span>원
			</div>
			<p>+</p>
			<div>
				배송비 <span>0</span>원
			</div>
			<p>=</p>
			<div>
				<div>결제예정금액</div>
				<div>0</div>원
				<div>구매시 <span>0</span>원 적립예정</div>
			</div>
		</div>
		
		</form>
	</div>
	</div>
</div>

</section>

<script type="text/javascript" src="/mintProject/shop/js/cart.js"></script>























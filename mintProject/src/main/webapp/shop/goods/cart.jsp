<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.cart th, .cart td{vertical-align: middle;}
</style>
<%-- 기존 사용중이던 cart.jsp => 하기 승호님 레이아웃으로 변경됨. 
내용 확인 후 지워주세요. 

<section class="cart">

<div class="section_cart">
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
			
			<!-- DB에서 cart 데이터 불러오는 곳 -->
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

</div>
</section> --%>

<div class="wrap cart">
    <div class="my-cart__header">
        <div class="my-cart__tit">장바구니</div>
        <div class="my-cart__sub-tit">주문하실 상품명 및 수량을 정확하게 확인해 주세요. </div>
    </div>
    <div class="cart-goods">
        <table class="cart-tb">
            <tr class="cart-tb__header">
                <th>
                    <label for="" class="check-label checked" onclick="change_Allcheckbox($(this))">
                    	<input type="checkbox" class="check-box allCheck" checked>
                    </label>
                </th>
                <th id="thSelect">전체선택 (<span class="prd_count">0</span>/<span class="prd_total_count">0</span>)</th>
                <th id="thInfo">상품 정보</th>
				<th id="thCount">수량</th>
				<th id="thCost">상품금액</th>
            </tr>
			
			<!-- DB에서 cart 데이터 불러오는 곳 -->
			<tbody class="viewGoods">
			</tbody>
		
        </table>
        <div class="cart-goods__btns">
            <button class="cart-goods__btn-del btn_delete selectBtn">
            	   선택 삭제
            </button>
            <button class="cart-goods__btn-sold btn_delete soldOutBtn">
        	       품절 상품 삭제
            </button>
        </div>

        <div class="cart-amount">
            <div class="cart-amount__item">
                <div class="cart-amount__tit">상품 금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = js -->
                    <span id="amountPrice"></span> 원
                </div>
            </div>
            <div class="cart-amount__deco deco-minus">
                -
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">상품 할인금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = js -->
                    -<span id="amountSale"></span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                +
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">배송비</div>
                <div class="cart-amount__price">
                    <!-- amountNum = js -->
                    <span id="amountCourier">0</span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                =
            </div>
            <div class="cart-amount__item amount-total">
                <div class="cart-amount__tit">결제예정금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = js -->
                    <span id="amountTotal"></span> 원
                </div>
                
                <div id="totalPoint" align="center">	
					<div>구매시
				 	<span>0</span>원 적립예정</div>
					</div>
		        </div>
        </div>
       <input type="button" id="placeAnOrder" class="cart-goods__btn-write" value="주문하기">
           
    </div>
</div>

<script type="text/javascript" src="/mintProject/shop/js/cart.js"></script>
<script type="text/javascript">



//데이터 전송
document.getElementById('placeAnOrder').onclick = function(){
	//전송전 데이터 가공
	var form = document.createElement("form");
	form.setAttribute("id", "process");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("action", "/mintProject/shop/goods/order");
	
	//상품코드
	var input1 = document.createElement("input");
	input1.name = 'productCode';
	input1.type = 'hidden';
	let productCode = [];
	for(var i=0; i<prdCnt; i++) {
		if($('.prdCheck').eq(i).prop('checked')){
			let value = $('.productCode').eq(i).val();
			productCode.push(value);			
		}
	}
	input1.value = productCode;
	form.appendChild(input1);
	
	//수량
	var input2 = document.createElement("input");
	input2.name = 'ctCount';
	input2.type = 'hidden';
	let ctCount = [];
	for(var i=0; i<prdCnt; i++) {
		if($('.prdCheck').eq(i).prop('checked')){
			let value = $('.clk_count').eq(i).val();
			ctCount.push(value);
		}
	}
	input2.value = ctCount;
	form.appendChild(input2);
	
	//적립금
	var input3 = document.createElement("input");
	input3.name = 'totalPoint';
	input3.type = 'hidden';
	let point = $('#totalPoint span').text();
	input3.value = point;
	form.appendChild(input3);
	
	document.body.appendChild(form);
	
	var passPrice = parseInt($('#amountTotal').text());
	if(passPrice==3000) {
		alert("결제할 항목을 선택하세요");
	}else {
		if(confirm("결제를 진행하시겠습니까?")) {
			$('#process').submit();
			console.log(form);
		}
	}
};
</script>






















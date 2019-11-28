<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	.cart span, .cart td{vertical-align: middle;}
	#getDataBoxBtn{position: fixed; top: 20px; right: 0;}
	#postDataBoxBtn{position: fixed; top: 20px; right: 90px;}
</style>

<input type="button" id="getDataBoxBtn" value="getDataBox">
<div id="getDataBox" style="background: #eaeaea; display: none;">
	<div>상품 데이터</div>
	<c:if test="${list != null }">
		<c:forEach var="product" items="${list }">
			<div>상품이름 : <span class="mainSubject">${product.MAINSUBJECT }</span></div>
			<div>상품코드 : <span class="productCode">${product.PRODUCTCODE }</span></div>
			<div>상품썸네일 :  ${product.THUMBNAIL }</div>
			<div class="price">상품정가 : <span>${product.PRICE }</span></div>
			<div class="discountRate">상품할인율 : <span>${product.DISCOUNTRATE }</span></div>
			<div class="discountPrice">상품할인적용가 :  <span class="dp"></span></div>
			<div class="ctCount">수량 : <span>${product.CTCOUNT }</span></div>
			<br />
		</c:forEach>
	</c:if>
	<div>주문자 정보</div>
	<div>주문자 이름 : <span id="memberName">${memberDTO.name }</span></div>
	<div>주문자 휴대폰번호 :<span id="memberTel"> ${memberDTO.tel }</span></div>
	<div>주문자 이메일 : <span id="memberEmail">${memberDTO.email }</span></div>
	<div>주문자 회원등급 : ${memberDTO.memLevel }</div>
	<div>주문자 주소1 : ${memberDTO.addr1 }</div>
	<div>주문자 주소2 : ${memberDTO.addr2 }</div>
	<div>주문자 보유 포인트 : <span id="memberPoint">${memberDTO.point }</span></div>
	<br />
	<div>적립예정인 적립금 : <span id="totalPoint">${totalPoint }</span></div>
	<div>배송비 : <span id="deleveryPrice">${deleveryPrice }</span></div>
	<div>최종결제금액 : <span id="lastPrice"></span></div>
</div>

<div class="wrap">
	<div class="my-cart__header">
		<div class="my-cart__tit">주문서</div>
		<div class="my-cart__sub-tit">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</div>
	</div>
	
	<div class="title2"><h2>상품 정보</h2></div>
  
	<div class="cart-goods">
	<table class="order-tb">
		<tr class="order-tb__header">
			<th></th>
			<th>상품 정보</th>
			<th>상품 금액</th>
		</tr>
		<!-- 상품 데이터 뿌려주는곳 : START -->
		<c:if test="${list != null }">
			<c:forEach var="product" items="${list }">
			<tr class="order-tb__item">
				<td class="order-tb__thumb"><img src="/mintProject/shop/storage/mint/product/${product.THUMBNAIL }"></td>
				<td class="order-tb__desc">
					<div class="order-tb__name">${product.MAINSUBJECT }</div>
					<div class="order-tb__price"><span class="order-tb__num">${product.CTCOUNT }개 / 개 당 <span class="onePrdPrice"></span> 원</span></div>
				</td>
				<td class="order-tb__total"><span class="salesPrice"></span></td>
			</tr>
			</c:forEach>
		</c:if>
		<!-- 상품 데이터 뿌려주는곳 : END -->
	</table>
	</div>
  
	<div class="title2"><h2>주문자 정보</h2></div>
	<div class="cart-goods">
	<table class="info-tb">
		<tr class="info-tb__fst">
			<th class="size-2">보내는 분 *</th>
			<td class="size-10"><input type="text" value="${memberDTO.name }" class="read-only" readonly /></td>
		</tr>
		<tr class="info-tb__phone">
			<th class="size-2">휴대폰 *</th>
			<td class="size-10">
				<input type="text" class="tel1 read-only" value="" size="3" maxlength="3" readonly />
				<input type="text" class="tel2 read-only" value="" size="4" maxlength="4" readonly />
				<input type="text" class="tel3 read-only" value="" size="4" maxlength="4" readonly />
			</td>
		</tr>
		<tr class="info-tb__email">
			<th class="size-2">이메일 *</th>
			<td class="size-10"><input type="text" value="${memberDTO.email }" class="read-only" readonly /></td>
		</tr>
	</table>
	</div>

	<div class="sticky-wrap">
	<div class="contents-area">
		<div class="title2"><h2>배송 정보</h2></div>
		<div class="cart-goods">
		<table class="shipping-tb">
			<tr class="shipping-tb__addr">
				<th class="size-2">주소</th>
				<td class="size-10">
					<input type="text" class="shipping-tb__addr1" id="delivery_addr1" value="${memberDTO.addr1 }" readonly />
					<input type="text" class="shipping-tb__addr2" id="delivery_addr2" value="${memberDTO.addr2 }" />
					<button class="shipping-tb__search" id="addrSearchBtn">우편번호 찾기 </button>
				</td>
			</tr>
			<tr class="shipping-tb__name">
				<th class="size-2">수령인 이름 *</th>
				<td class="size-10"><input type="text" value="${memberDTO.name }" /></td>
			</tr>
			<tr class="shipping-tb__phone">
				<th class="size-2">휴대폰 *</th>
				<td class="size-10">
					<input type="text" class="tel1" value="" size="3" maxlength="3" />
					<input type="text" class="tel2" value="" size="4" maxlength="4" />
					<input type="text" class="tel3" value="" size="4" maxlength="4" />
				</td>
			</tr>
			<tr class="shipping-tb__ask">
				<th class="size-2">배송 요청사항</th>
				<td class="size-10">
					<textarea name="request" id="request" class="shipping-tb__textarea" maxlength="50" ></textarea>
				</td>
			</tr>
		</table>
		</div>
		<div class="title2"><h2>쿠폰 / 적립금</h2></div>
		<div class="cart-goods">
			<table class="point-tb">
			<tr>
				<th class="size-2">적립금 적용</th>
				<td class="size-10">
					<div class="pont-tb__point">
						<input type="text" id="myPoint" value="0" />원
						<label for="pointChk" class="check-label point-tb__checkbox">
							<input type="checkbox" class="check-box" name="pointChk" id="pointChk" />
						</label>
						<span>모두사용</span>
					</div>
					<div class="point-tb__having-point">보유 적립금 : ${memberDTO.point }원</div>
				</td>
			</tr>
			</table>
		</div>
    </div>

	<div class="sticky-area">
		<div class="title2"><h2>결제 금액</h2></div>
		<table class="bill-tb">
			<tr class="bill-tb__product-price">
				<th>상품 금액</th>
				<td><span></span> 원</td>
			</tr>
			<tr class="tb-hr">
				<th><hr class="tb-line" /></th>
				<td><hr class="tb-line" /></td>
			</tr>
			<tr class="bill-tb__col_sale">
				<th>상품할인금액</th>
				<td>- <span></span> 원</td>
			</tr>
			<tr class="bill-tb__col">
				<th>배송비</th>
				<td>
					<span>${deleveryPrice }</span> 원
				</td>
			</tr>
			<tr class="bill-tb__col_point">
				<th>적립금사용</th>
				<td><span class="pointUse"></span> 원</td>
			</tr>
	
			<tr class="tb-hr">
				<th><hr class="tb-line" /></th>
				<td><hr class="tb-line" /></td>
			</tr>
	
			<tr class="bill-tb__total-price">
				<th>최종결제금액</th>
				<td><span></span> 원</td>
			</tr>
	
			<tr class="bill-tb__earn-point">
				<td colspan="2">
					<span>구매 시 ${totalPoint }원 (
						<c:if test="${memberDTO.memLevel == 0 }">
							<span>5%</span>
						</c:if>
						<c:if test="${memberDTO.memLevel == 1 }">
							<span>7%</span>
						</c:if>
						<c:if test="${memberDTO.memLevel == 2 }">
							<span>10%</span>
						</c:if>
						) 적립예정
					</span>
				</td>
			</tr>
		</table>
	</div>
	</div>
	<button id="btnPayment" class="myorder-writeBtn" style="cursor: pointer;">결제하기</button>
</div>
<script src="/mintProject/shop/js/order.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//GET DATA BOX
	$('#getDataBoxBtn').click(function(){
		$('#getDataBox').slideToggle();
	});
	
	//주문상품 리스트
	$('.btn_show').click(function(){
		$('#orderGoodsList').slideToggle();
	});
});
</script>


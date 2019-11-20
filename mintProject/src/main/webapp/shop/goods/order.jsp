<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.cart span, .cart td{vertical-align: middle;}
</style>
<!-- 
	필요한 데이터
	
	*productData
	썸네일, 제목, 수량, 정가, 할인율
	
	*cartData
	수량
	
	*member데이터는 다 가져옴
	
	*추가로 받아야할 데이터
	할인적용가, 적립금, 배송비, 최종결제금액
 -->
<section class="cart">
<div class="user_form">
	<div id="dataBox" style="background: #eaeaea;">
		<div>상품 데이터</div>
		<c:if test="${list != null }">
			<c:forEach var="product" items="${list }">
				<div>상품이름 : ${product.MAINSUBJECT }</div>
				<div>상품코드 : ${product.PRODUCTCODE }</div>
				<div>상품썸네일 :  ${product.THUMBNAIL }</div>
				<div class="price">상품정가 : <span>${product.PRICE }</span></div>
				<div class="discountRate">상품할인율 : <span>${product.DISCOUNTRATE }</span></div>
				<div class="discountPrice">상품할인적용가 :  <span class="dp"></span></div>
				<br />
			</c:forEach>
		</c:if>

		<br />
		<div>주문자 정보</div>
		<div>주문자 이름 : ${memberDTO.name }</div>
		<div>주문자 휴대폰번호 : ${memberDTO.tel }</div>
		<div>주문자 이메일 : ${memberDTO.email }</div>
		<div>주문자 회원등급 : ${memberDTO.memLevel }</div>
		
		<div>적립금 : ${totalPoint }</div>
		
	</div>

	
	
	
	
	<div class="titleArea2"><h2>상품 정보</h2></div>
	<div class="page_aticle order_goodslist">
		<div class="show_tbl">
			<div class="inner_show">
				<div class="name">가재새우살 (냉동) 상품을 주문합니다.</div>
			</div>
		</div>
		<div id="orderGoodsList" style="display: none;">
			<table class="tbl" style="width: 100%;">
				<caption>상품 정보 상세보기</caption>
				<colgroup>
					<col style="width:120px">
					<col style="width:auto">
					<col style="width:186px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><span class="screen_out">상품이미지</span></th>
						<th scope="col" class="th_info">상품 정보</th>
						<th scope="col">상품금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td>
						<a href="/shop/goods/goods_view.php?&amp;goodsno=13127"><img src="//img-cf.kurly.com/shop/data/goods/1519716926659s0.jpg" width="150" class="goods-cart-product-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_300.gif'"></a>
					</td>
					<td class="info">
					<div class="name">
					가재새우살 (냉동)
					</div>
					<dl>
					<dt class="screen_out">단일상품</dt>
					<dd>1개 / 개 당 9,360원</dd>
					</dl>
					</td>
					<td class="price">
					9,360원
					</td>
					</tr>
				</tbody>
			</table>
		</div>
		<a class="btn_show"><span class="txt">상세보기</span><img src="https://res.kurly.com/pc/ico/1803/ico_arrow_open_28x16.png" alt="열기"></a>
		
	</div>
</div>
</section>
<script type="text/javascript" src="/mintProject/shop/js/order.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
var cnt = $(".price").length;
var price = new Array(cnt);
var discountRate = new Array(cnt);
var discountPriceMinus = new Array(cnt);
var discountPrice = new Array(cnt);
console.log("cnt : "+cnt);

for(var i=0; i<cnt; i++) {
	price[i] = $('.price span').eq(i).text();
	discountRate[i] = $('.discountRate span').eq(i).text();
	discountPriceMinus[i] = price[i]*(discountRate[i]/100);//할인된금액
	discountPrice[i] = parseInt(price[i] - discountPriceMinus[i]);
	$(".dp").eq(i).text(discountPrice[i]);
}

	
});





</script>
























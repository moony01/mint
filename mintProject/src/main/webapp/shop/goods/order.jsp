<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.cart span, .cart td{vertical-align: middle;}
</style>
<!-- 
	필요한 데이터
	
	*카트에서 이미 받은 데이터
	1. THUMBNAIL,//썸내일이미지
	2. MAINSUBJECT,//제목
	3. price2//상품할인적용가
	4. savingPrice//적립금
	
	*추가로 받아야할 데이터
	1.주문자 성함
	2.주문자 휴대폰번호
	3.주문자 이메일
	3.주문자 회원등급
 -->
<input type="hidden" name="mainSubject" value="${productDTO.mainSubject }">
<input type="hidden" name="productCode" value="${productDTO.productCode }">
<input type="hidden" name="thumbnail" value="${productDTO.thumbnail }">
<input type="hidden" name="price" value="${productDTO.price }">
<input type="hidden" name="discountRate" value="${productDTO.discountRate }">
<input type="hidden" name="discountPrice" value="${discountPrice }">
<input type="hidden" name="price2" class="prd_price_fix" value="${price2 }">
<input type="hidden" name="stock" class="stock" value="${productDTO.stock }">
<input type="hidden" name="savingPrice" value="${savingPrice }">
<section class="cart">
<div class="user_form">
	<div id="dataBox" style="background: #eaeaea;">
		<div>상품 데이터</div>
		<div>상품이름 : ${productDTO.mainSubject }</div>
		<div>상품코드 : ${productDTO.productCode }</div>
		<div>상품썸네일 :  ${productDTO.thumbnail }</div>
		<div>상품정가 : ${productDTO.price }</div>
		<div>상품할인율 : ${productDTO.discountRate }</div>
		<div>상품할인된금액 : ${discountPrice }</div>
		<div>상품할인적용가 : ${price2 }</div>
		<div>상품수량 : ${productDTO.stock }</div>
		
		<div>주문자 정보</div>
		<div>주문자 이름 : ${memberDTO.name }</div>
		<div>주문자 휴대폰번호 : ${memberDTO.tel }</div>
		<div>주문자 이메일 : ${memberDTO.email }</div>
		<div>주문자 회원등급 : ${memberDTO.memLevel }</div>
		
		<div>적립금 : ${savingPrice }</div>
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

























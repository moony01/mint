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
 
<input type="button" id="getDataBoxBtn" value="getDataBox">
<input type="button" id="postDataBoxBtn" value="postDataBox">
 
<div id="getDataBox" style="background: #eaeaea; display: none;">
	<div>상품 데이터</div>
	<c:if test="${list != null }">
		<c:forEach var="product" items="${list }">
			<div>상품이름 : <span class="mainSubject">${product.MAINSUBJECT }</span></div>
			<div>상품코드 : ${product.PRODUCTCODE }</div>
			<div>상품썸네일 :  ${product.THUMBNAIL }</div>
			<div class="price">상품정가 : <span>${product.PRICE }</span></div>
			<div class="discountRate">상품할인율 : <span>${product.DISCOUNTRATE }</span></div>
			<div class="discountPrice">상품할인적용가 :  <span class="dp"></span></div>
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
	
	<br />
	<div>적립금 : ${totalPoint }</div>
	<div>최종결제금액 : <span id="lastPrice"></span></div>
</div>

<div id="postDataBox" style="background: #eaeaea; display: none;">
	<div>보낼 데이터</div>
	
</div>

<section class="cart">
	<!-- 선택상품 테이블 -->
	<div class="product_form" style="border: 1px solid #585858; margin-top: 30px;">
		<div class="titleArea"><h2>상품 정보</h2></div>
		<div class="page_aticle order_goodslist">
			<div class="show_tbl">
				<div class="inner_show">
					<div class="name"><span id="topProductName"></span> 외<span id="productListCount"></span>개 상품을 주문합니다.</div>
				</div>
			</div>
			<div id="orderGoodsList" style="display: block; margin-top: 30px;">
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
						<c:if test="${list != null }">
							<c:forEach var="product" items="${list }">
								<tr>
									<td class="thumbNail">${product.THUMBNAIL }</td>
									<td class="mainSubject">${product.MAINSUBJECT }</td>
									<td><span class="salesPrice"></span></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<a class="btn_show"><span class="txt">상세보기</span><img src="https://res.kurly.com/pc/ico/1803/ico_arrow_open_28x16.png" alt="열기"></a>
		</div>
	</div>
	
	<div class="user_form" style="border: 1px solid #B40404; margin-top: 30px;">
		<div class="titleArea"><h2>주문자 정보</h2></div>
		<table class="goodsinfo_table">
		<tbody>
		<tr class="fst">
		<th>보내는 분 *</th>
		<td class="td_readonly">
			<input type="text" value="${memberDTO.name }" readonly="readonly" class="read_only">
		</td>
		</tr>
		<tr class="field_phone">
			<th>휴대폰 *</th>
			<td class="td_readonly">
				<input type="text" id="tel1" value="" size="3" maxlength="3" readonly="readonly" class="read_only">
				<span class="bar"><span></span></span>
				<input type="text" id="tel2" value="" size="4" maxlength="4" readonly="readonly" class="read_only">
				<span class="bar"><span></span></span>
				<input type="text" id="tel3" value="" size="4" maxlength="4" readonly="readonly" class="read_only">
			</td>
		</tr>
		<tr>
			<th>이메일 *</th>
			<td class="td_readonly">
				<input type="text" id="emaili" value="${memberDTO.email }" readonly="readonly" class="read_only">
				<p class="txt_guide">
					<span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span>
					<span class="txt txt_case2">정보 변경은 <span class="txt_desc">마이컬리 &gt; 개인정보 수정</span> 메뉴에서 가능합니다.</span>
				</p>
			</td>
		</tr>
		</tbody>
		</table>
	</div>
	
	<div class="delivery_form" style="border: 1px solid #08088A; margin-top: 30px;">
		<div class="delevery_addr_form">
			<input type="text" id="delivery_addr1" value="${memberDTO.addr1 }" />
			<input type="text" id="delivery_addr2" value="${memberDTO.addr2 }" />
			<input type="button" class="btn-addr" value="주소 변경하기" />
		</div>
	</div>
	
	
	
	<input type="button" id="btnPayment" value="결제하기" />
</section>

<script type="text/javascript" src="/mintProject/shop/js/order.js"></script>
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
























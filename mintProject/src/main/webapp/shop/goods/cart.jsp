<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="cart">

<div id="main">
	<div id="content">
	<div class="section_cart">
		<form id="" name="" method="post" action="">
		
		<div class="cart_goods">
			<table class="">
				<caption>장바구니 목록 제목</caption>
				<colgroup><col style="width: 375px;"> <col style="width: 432px;"> <col style="width: 115px;"> <col style="width: 110px;"> <col style="width: auto;"></colgroup>
				 
				<thead>
				<tr>
					<th id="thSelect">
						<div class="all_select">
							<label class="label_check"> <input type="checkbox" name="allCheck" class="ico_check"> </label>
							<span class="tit"> 전체선택 (0/0)</span>
						</div>
					</th>
					<th id="thInfo">상품 정보</th>
					<th id="thCount">수량</th>
					<th id="thCost">상품금액</th>
					<th id="thDelete">삭제선택</th>
				</tr>
				</thead>
			</table>
		</div>
		
		<div class="">
			<label class="label_check"><input type="checkbox" name="allCheck" class="ico_check"></label>
			<span class="tit"> 전체선택 (0/0) </span>
			<button type="button" class="btn_delete">선택 삭제</button>
			<button type="button" class="btn_delete">품절 상품 삭제</button>
		</div>
		
		</form>
	</div>
	</div>
</div>

</section>

<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type: 'post',
			url: '/mintProject/shop/goods/getCartList',
			data: ,
		});
	});
</script>























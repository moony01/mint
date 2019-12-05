<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <div class="my-page__top-article">

</div> -->
<seciton class="service">
    <div class="snb">
        <h2 class="snb__title">마이페이지</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/mintProject/shop/mypage/myOrderList">주문내역</a></li>
            <li class="snb__item"><a href="">늘 사는 것</a></li>
            <li class="snb__item current"><a href="/mintProject/shop/mypage/review">상품 후기</a></li>
            <li class="snb__item"><a href="">적립금</a></li>
            <li class="snb__item"><a href="/mintProject/shop/mypage/myinfo_pwd">개인 정보 수정</a></li>
            <li class="snb__item"><a href="/mintProject/shop/mypage/attendance">출석체크</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">상품후기</h2>
        <div class="review-notice">
            <span>후기 작성 시 50포인트를 적립해드립니다.</span><br>
             <!-- <span>* 후기 작성은 배송 완료일로부터 30일 이내 가능합니다. </span> -->
        </div>
        <ul class="review-tab">
            <li>
                <a href="/mintProject/shop/mypage/review">작성가능 후기</a>
            </li>
            <li>
                <a href="" class="cur-tab">작성완료 후기</a>
            </li>
        </ul>
        <ul class="review-list" id = "orderArea">
        </ul>
    </div>
</seciton>
<script type="text/javascript">
function getReview () {
	$.ajax({
		method: "GET",
		type: 'json',
		dataType: "json",
		url: "/mintProject/api/review",
		success:function(data) {
			drawReview(data);
		}
	});
}
function drawOrder(data) {
	var status = {
		0:"입금전",
		1:"입금 완료",
		2:"배송 중",
		3:"배송 완료",
	}
	var html = '';
	data.forEach(function(item){
		if (item.STATUS == 3 && item.REVIEWSTATUS == 1) {
		html += '<li class="review-item">' +
        '<div class="review-item__tit">주문번호 ' + item.ORDERNUMBER + '</div>' +
        '<div class="review-item__content">' +
	        '<img src="/mintProject/shop/storage/mint/product/' + item.IMG + '" alt="" class="review-item__thumb">' +
            '<div class="review-item__desc">' +
                '<div class="review-item__name" style="cursor:pointer;">' + item.TITLE + '</div>' +
                '<input type="hidden" id="" value="'+item.SUBCATEGORY+'">'+
	            '<input type="hidden" id="" value="'+item.PRODUCTCODE+'">'+
                '<div class="reivew-item__count">' + item.QTY + '개 구매</div>' +
            '</div>' +
            '<div class="review-item__delivery-day">' + status[item.STATUS] + " " + item.LOGTIME + 
            '</div>' +
        '</div>' +
    '</li>';
			
		}
	})
	$("#orderArea").empty().append(html);
	
	$('.review-item__name').click(function(){
		var productCode = $(this).next().next().val();
		var subCategory = $(this).next().val();
		location.href="/mintProject/shop/product/productView?productCode="+productCode+"&subCategory="+subCategory+"#review";
	});
}
function getOrder() {
	$.ajax({
		method: "GET",
		type: 'json',
		dataType: "json",
		url: "/mintProject/api/order",
		success:function(data) {
			drawOrder(data);
		}
	});
}
$(function(){
	//getReview();
	getOrder();
	
})
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="my-page__top-article">
</div>
<section class="service">
    <div class="snb">
        <h2 class="snb__title">마이컬리</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="">주문내역</a></li>
            <li class="snb__item"><a href="">늘 사는 것</a></li>
            <li class="snb__item current"><a href="">상품 후기</a></li>
            <li class="snb__item"><a href="">적림금</a></li>
            <li class="snb__item"><a href="">개인 정보 수정</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">후기 작성</h2>
        <div class="my-wrap">
            <form action="/mintProject/api/review/write"  enctype="multipart/form-data"  method = "POST">
            <input type="hidden" name = "productCode" value = "${productCode }" id="productCode">
            <input type="hidden" name = "orderNumber" value = "${orderNumber }" id="orderNumber">
                <table class="review-write">
                    <tr class="review-write__thumb">
                        <th id = "imgArea"></th>
                        <td id = "titleArea"></td> 
                    </tr>
                    <tr class="review-write__col">
                        <th>제목</th>
                        <td>
                            <input type="text" name = "subject" id = "subject" placeholder="제목을 입력해주세요">
                        </td>
                    </tr>
                    <tr class="review-write__col">
                        <th>별점</th>
                        <td>
                            <div class="rating">
                                <input type="radio" id="star5" name="star" value="50" /><label for="star5"></label>
                                <input type="radio" id="star4" name="star" value="40" /><label for="star4"></label>
                                <input type="radio" id="star3" name="star" value="30" /><label for="star3"></label>
                                <input type="radio" id="star2" name="star" value="20" /><label for="star2"></label>
                                <input type="radio" id="star1" name="star" value="10" /><label for="star1"></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="review-write__col">
                        <th>후기작성</th>
                        <td>
                            <textarea name="content" id="content"></textarea>
                        </td>
                    </tr>
                    <tr class="review-write__col">
                        <th>사진등록</th>
                        <td>
                            <div class="board-write__file">
                                <input type="file" name="img" id="">
                            </div>
                        </td>
                    </tr>
                </table>
                <button type="submit" class="review-write__write-btn">등록하기</button>
            </form>
        </div>
    </div>
</section>
<script type="text/javascript">
let productCode = $('#productCode').val();
let orderNumber = $('#orderNumber').val();
function drawOrder(data) {
	var order = {};
	data.forEach(function(item){
	if (productCode == item.PRODUCTCODE) // orderlist에 있는 productCode와 이전 페이지에서 넘겨받은 productCode를 비교해서 같은 productCode면 화면에 출력 
			order = item;
	});
	$("#imgArea").append('<img src="/mintProject/shop/storage/mint/product/' + order.IMG + '" alt="">');
	$("#titleArea").append(order.TITLE);
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
	getOrder();
})
</script>
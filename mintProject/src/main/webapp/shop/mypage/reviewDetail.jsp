<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section class="service-view">
    <h2 class="service__main-title">상품 후기
        <span class="title_sub">민트는 상품에 대한 고객 여러분의 생생한 의견을 듣고 더 나은 상품을 준비하기 위해 최선을 다하겠습니다.</span>
    </h2>
    <table class="notcie-view">
        <tr class="notcie-view__subject">
            <th class="notice-view__title">제목</th>
            <td colspan="3" id="subject"></td>
        </tr>
        <tr class="notcie-view__author">
            <th class="notice-view__title">작성자</th>
            <td colspan="3" id="id"></td>
        </tr>
        <tr class="notcie-view__author">
            <th class="notice-view__title">작성일</th>
            <td id="logtime"></td>
            <th class="notice-view__title">평점</th>
            <td id="star"></td>
        </tr>
        <tr class="notice-view__conent" style="vertical-align:top;">
            <td colspan="4">
            	<div id=imgArea></div>
            	<pre id="content"></pre>
            </td>
        </tr>
        <!-- <tr class="notice-view__conent" style="vertical-align:top;">
            <td colspan="2" id="imgArea" style="vertical-align:top;">
            </td>
            <td colspan="2" style="vertical-align:top;"><textarea  id="content" style="margin-top: 0px;vertical-align:top;border: 0px;"></textarea>
            </td>
        </tr> -->
    </table>
    
    <div class="content_btm_wrap">
	    <div class="service__write-btn" onclick="window.history.back();">목록</div>
    </div>
</section>
<script type="text/javascript">
var seq = "${seq}";
function drawReview(data) {
	var review = {};
	data.forEach(function(item){
		if (item.seq == seq)
			review = item;
	})
	$("#id").text(review.id);
	$("#subject").text(review.subject);
	$("#logtime").text(review.logtime);
	$("#star").text(review.star);
	$("#content").text(review.content);
	if(review.imgName != null){
		$("#imgArea").empty().append('<br><img src="/mintProject/shop/storage/member/review/' + review.imgName + '" alt="" style="vertical-align:unset; width: 300px;">');
	}
	
}
getReview(seq);

function getReview(seq) {
	$.ajax({
		method: "GET",
		type: 'json',
		data : {'seq' : seq},
		dataType: "json",
		url: "/mintProject/api/review/detail",
		success:function(data) {
			console.log(data);
			drawReview(data);
		}
	});
}
</script>










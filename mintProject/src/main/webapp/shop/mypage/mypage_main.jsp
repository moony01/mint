<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.mypage_top {
    width: 100%;
    padding: 50px 0;
    margin-bottom: -20px;
    background-color: #f7f7f7;
}

.mypage_top .mypagetop_user {
    overflow: hidden;
    width: 1050px;
    margin: 0 auto;
}

.mypage_top .inner_mypagetop {
    overflow: hidden;
    width: 100%;
}

.mypage_top .grade_user {
    float: left;
    width: 1000px;
    height: 200px; 
    padding: 28px 0 30px 30px;
    background-color: #fff;
}


.mypage_top .list_mypage {
    float: right;
    width: 602px;
}

</style>	
	
<div id="myPageTop" class="page_aticle mypage_top">
	<div class="mypagetop_user">
		<div class="inner_mypagetop">
			<div class="grade_user">
				<div class="grade">
					<span class="memLevel"></span>
					<div class="">
						<div class="user">
							<strong class="name">${memName }</strong> <span>님</span>
						</div>
						<div class="pointRate"></div>
					</div>
					<div class="point">누적 적립금</div>
				</div>
				
			</div>
			
			<!-- <ul class="list_mypage">
				<li class="user_reserve">
					<div class="link">
						<div class="tit">
							적립금
							
						</div>
						<a href="/shop/mypage/mypage_emoney.php" class="info"> 5,000 원
							<img
							src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"
							alt="자세히 보기"> <span class="date">소멸 예정 0 원</span>
						</a>
					</div>
				</li>
				<li class="user_coupon">
					<div class="link">
						<div class="tit">
							쿠폰
							
						</div>
						<a href="/shop/mypage/mypage_coupon.php" class="info">0 개 <img
							src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"
							alt="자세히 보기"></a>
					</div>
				</li>
				
				<li class="user_kurlypass">
					<div class="link">
					<div class="tit">컬리패스</div>
						
						<a href="/shop/mypage/kurlypass.php" class="info info_link">
							알아보기 <img
							src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"
							alt="자세히 보기">
						</a>
					</div>
				</li>
			</ul> -->
		</div>
		
	</div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script>
let memLevel = ${memLevel }; 
let pointRate;
if(memLevel == 0) {
	memLevel = '일반';
	pointRate = '5%';
} else if(memLevel == 1) {
	memLevel = '우수';
	pointRate = '7%';
} else if(memLevel == 2) {
	memLevel = '최우수';
	pointRate = '10%';
}

$('.memLevel').text(memLevel);
$('.pointRate').append(pointRate + ' 적립');

$.ajax({
	type:'post',
	url: '/mintProject/shop/mypage/getPoint',
	dataType: 'text',
	success: function(result){
		$('.point').append(result + ' point');
		
	},
	error: function(){}
});
</script>
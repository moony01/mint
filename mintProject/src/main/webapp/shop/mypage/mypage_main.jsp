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
    width: 800px;
    height: 200px; 
    padding: 28px 0 30px 30px;
    background-color: #fff;
}
.mypage_top .grade_point {
	margin: 0 0 0 10px;
    float: left;
    width: 200px;
    height: 200px; 
    padding: 28px 0 30px 30px;
    background-color: #fff;
}

.mypage_top .list_mypage {
    float: right;
    width: 602px;
}

.name {
	margin: 0 0 0 10px; 
    font-weight: 700;
    font-size: 20px;
}

.text {
	margin: 0 0 0 10px; 
	font-size: 16px;
    line-height: 28px;
}

.grade-icon{
    display: inline-block;
    border: 1px solid #949296;
    color: #949296; 
    height: 80px;
    line-height: 80px;
    padding: 0 8px;
    border-radius: 12px;
    font-weight: 500;
    margin-right: 5px;
    width: 80px; 
    font-size: 15pt;
    text-align: center;
}

.grade-icon-2{
    display: inline-block;
    border: 1px solid #949296;
    background-color: #f4f4f4;
    color: #949296; 
  	height: 30px;
    line-height: 26px;
    padding: 0 8px;
    border-radius: 12px;
    font-weight: 500;
    margin-top: 40px;
    margin-right: 25px;
    width: 200px;
    font-size: 12pt;
    text-align: center;
   	float: right;
}

.date{
	display: block;
    padding-top: 12px;
    font-size: 12px;
    color: #999;
    line-height: 16px;
}
</style>	
	
<div id="myPageTop" class="page_aticle mypage_top">
	<div class="mypagetop_user">
		<div class="inner_mypagetop">
			<div class="grade_user">
				<div>
					<span class="grade-icon memLevel"></span>
					<div style="display: inline-block;">
						<strong class="name" >${memName }</strong><span class="text">님</span>
						<div class="pointRate text"></div>
					</div>
				</div>
				<div>
				<span class="grade-icon-2">전체 등급 보기</span>
				<span class="grade-icon-2">다음 달 예상 등급 보기</span>
				</div>
			</div>
			
			<div class="grade_point">
				적립금
				<div class="point name"><span class="text"> point</span></div>
				<span class="date">소멸 예정 0 원</span>
			</div>
		
		</div>
		
	</div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script>
let level; 
let pointRate;
if(${memLevel } == 0) {
	level = '일반';
	pointRate = '5%';
} else if(${memLevel } == 1) {
	level = '우수';
	pointRate = '7%';
} else if(${memLevel } == 2) {
	level = '최우수';
	pointRate = '10%';
} else if (${memLevel } == 5) {
	level = '관리자';
}

$('.memLevel').text(level);
if(${memLevel } != 5) {
	$('.pointRate').append(pointRate + ' 적립');
	
}

$.ajax({
	type:'post',
	url: '/mintProject/shop/mypage/getPoint',
	dataType: 'text',
	success: function(result){
		if(${memLevel } != 5) {
			$('.point').prepend(result);
		}
	},
	error: function(){}
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/mintProject/shop/css/service.css" />
<div id="myPageTop" class="page_aticle mypage_top">
    <div class="mypagetop_user">
        <div class="inner_mypagetop">
            <div class="grade_user">
                <div class="users-desc">
                    <span class="grade-icon memLevel"></span>
                    <div class="mypage-info">
                        <strong class="name">${memName }</strong
                        ><span class="text">님</span>
                        <div class="pointRate text"></div>
                    </div>
                </div>
                <div class="grades">
                    <span class="grade-icon-2">전체 등급 보기</span>
                    <span class="grade-icon-2">다음 달 예상 등급 보기</span>
                </div>
            </div>

            <div class="grade_point">
                적립금
                <div class="point name">
                    <span class="text"> point</span>
                </div>
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

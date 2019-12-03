<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/mintProject/shop/css/service.css" />
<div id="myPageTop" class="page_aticle mypage_top">
    <div class="mypagetop_user">
        <div class="inner_mypagetop">
            <div class="grade_user">
                <div class="users-desc">
                    <span class="grade-icon-1 memLevel"></span>
                    <div class="mypage-info">
                        <strong class="name">${memName }</strong
                        ><span class="text">님</span>
                        <div class="pointRate text"></div>
                    </div>
                </div>
                <div class="grades">
                    <span class="grade-icon-2" id="allBenefits"
                        >전체 등급 보기</span
                    >
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
<div class="notice-modal hidden">
    <div class="notice-modal__overlay"></div>
    <div class="notice-modal__content member-benefit">
        <div class="member-benefit__wrapper">
            <div class="notice-modal__close-btn" id="modal-close"></div>
            <img
                src="/mintProject/shop/storage/mint/icon//member-benefit.png"
                alt=""
            />
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


    const modal = document.querySelector('.notice-modal'),
        overlay = modal.querySelector('.notice-modal__overlay'),
        closeBtn = modal.querySelector('#modal-close'),
        benefitOpenBtn = document.querySelector("#allBenefits");


    function closeModal() {
        modal.classList.add('hidden');
    }

    function openModal() {
        modal.classList.remove('hidden');
    }

    benefitOpenBtn.addEventListener("click",openModal)
    overlay.addEventListener('click', closeModal);
    closeBtn.addEventListener('click', closeModal);
</script>

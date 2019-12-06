let productCode = $('#productCode').val();
let sort = "NEW";

(function (){
	
    const minusBtn =document.querySelector(".minus");
    const plusBtn = document.querySelector(".plus");

    const qty = document.querySelector(".qty");
    const total = document.querySelector(".total");
    
    const goodsPrice = document.querySelector(".goods-price");
    const gradePoint = document.querySelector(".grade-point");

    const pointCount = document.querySelector(".point");

    let qtyCount = qty.value;

    

    // number타입 데이터를 100단위 마다 콤마 형식으로 포맷 시켜 반환하는 함수
    function makeComma(num){
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");            
    }
    // comma제거하고 숫자로 반환하는 함수
    function removeComma(str){
        return parseInt(str.replace(",",""));
    }

    

    const price = removeComma(goodsPrice.innerText);
    const point = removeComma(gradePoint.innerText);

    pointCount.innerText = makeComma(point);
    total.innerText = makeComma(price);
    
   
    plusBtn.addEventListener("click",function(){
    	
        let curPoint = removeComma(pointCount.innerText);
        pointCount.innerText = makeComma(curPoint+point);
        

        qtyCount++;
        qty.value = qtyCount;   
        total.innerText = makeComma(price*qtyCount);

    });

    minusBtn.addEventListener("click",function(){
        if(qtyCount <= 1) return;
        let curPoint = removeComma(pointCount.innerText);
        pointCount.innerText = makeComma(curPoint-point);

        qtyCount--;
        qty.value =qtyCount
        total.innerText = makeComma(price*qtyCount);
        
    })
    
    // 상품문의
    getProductQnaList()
    .then(printProductQnaList)
    .catch();
    
    // 상품후기
    getReview(sort)
    .then(drawReview)
    .then(getReviewStarAvg)
    .catch();
    
})();

// 상품후기
function drawReview(data){
	
	let pg_review = data.pg;
	let totalArticle_review = data.totalArticle;
	let currentPage_review = pg_review;
	
	$('#review_pagination li').remove();
	
	var html = '<tr class="review-tb__head"><th class="size-1">번호</th><th class="size-2">별점</th><th class="size-6">제목</th><th class="size-1">작성자</th><th class="size-2">작성일</th></tr>';
	$.each(data.list, function(index, item){
	console.log(item);
	html+= '<tr class="review-tb__view moveReviewDetail" data = "' + item.SEQ + '" id="review_seq">';
	html+= '<td>' + item.RN + '</td>';
	html+= '<td>';
	html+= '<div class="star-sm-' + item.STAR + '"></div>';
	html+= '</td>';
	html+= '<td>' + item.SUBJECT + '</td>';
	html+= '<td>' + item.ID + '</td>';
	html+= '<td>' + item.LOGTIME + '</td>';
	html+= '</tr>';
	})
	$("#reviewArea").empty().append(html);
	
	$(".moveReviewDetail").click(function(){
		location.href = "/mintProject/shop/mypage/review/detail?seq=" + $(this).attr("data");
	})
	
	reviewPaging(totalArticle_review,currentPage_review);
}

$("#writeReview").click(function(){
	location.href = "/mintProject/shop/mypage/review";
});


function getReview(sort,pg_review) {
	return $.ajax({
		method: "POST",
		type: 'json',
		dataType: "json",
		url: "/mintProject/api/review/product",
		data : {'sort' : sort, 'productCode' : $('#productCode').val(), 'pg' : pg_review }
	});
}

function getReviewByPage(pg_review){
	sort = $('#sort').val();
	getReview(sort,pg_review)
	.then(drawReview)
	.catch();
}

$("#sort").change(function(){
	sort = $(this).val();
	getReview(sort)
	.then(drawReview)
	.catch();
});

function convertStar(num) {
	if (num == 0) return 0;
	else if (num >0 && num < 5) return 5;
	else if (num >=5 && num < 10) return 5;
	else if (num >=10 && num < 15) return 10;
	else if (num >=15 && num < 20) return 15;
	else if (num >=20 && num < 25) return 20;
	else if (num >=25 && num < 30) return 25;
	else if (num >=30 && num < 35) return 30;
	else if (num >=35 && num < 40) return 35;
	else if (num >=40 && num < 45) return 40;
	else if (num >=45 && num < 50) return 45;
	else return 50;
}
function getReviewStarAvg() {
	return $.ajax({
				method: "POST",
				type: 'json',
				data : {'productCode' : $('#productCode').val() },
				dataType: "json",
				url: "/mintProject/api/review/star/avg",
				success:function(data) {
					$('.review_cnt').text('고객후기('+data.map.COUNT+')');
					$('.reivew__users-count').text(data.map.COUNT);
					if(data.map.COUNT == '0'){
						$("#starAvg").text('0');
						$("#starImgArea").addClass("star-lg-"+convertStar(0));
					} else {
						$("#starAvg").text((Number(data.map.STAR)/10).toFixed(1));
						$("#starImgArea").addClass("star-lg-"+convertStar(data.map.STAR));
					}
				}
			});
}

// 상품문의 - 페이지 이동
function getProductQnaListByPage(pg_qna){
	getProductQnaList(pg_qna)
	.then(printProductQnaList)
	.catch();
}

// 상품문의 - 데이터 불러오기
function getProductQnaList(pg_qna){
	return $.ajax({
		type : 'post',
    	url : '/mintProject/shop/product/productQnaBoardList',
    	data : {'productCode' : $('#productCode').val(), 'pg' : pg_qna, 'subCategory' : $('#subCategory').val()},
    	dataType : 'text',
	});
}

// 상품문의 - 화면에 뿌리기 + 이벤트
function printProductQnaList(result){
	
	$('#qna-tb').remove();
	$('.pagination qna li').remove();
	
	$('#qna').html(result.trim());
	
	$('.qna_cnt').text('상품문의('+$('#totalArticle').val()+')');
	
	let pg_qna = $('#pg_qna').val();
	let totalArticle = parseInt($('#totalArticle').val());
	let currentPage = pg_qna;
	let addr = $('#addr').val(); 
	
	$('#qna_write_btn').on('click', function(){
		location.href='/mintProject/shop/service/productQnaWriteForm?productCode='+$('#productCode').val()+'&subCategory='+$('#subCategory').val();
	});
	
    const qnaViewList = document.querySelectorAll(".qna-tb__view"),
          qnaContentList = document.querySelectorAll(".qna-tb__content");

    for(let i=0; i<qnaViewList.length; i++){
        qnaViewList[i].addEventListener("click",function(){
        	var writer = $(this).children(':first').next().next().next().text();
        	var lock = $(this).children(':first').next().next().children(':first').attr('class');
        	
        	if(lock == null || writer==$('#sessionId').val()){
        		qnaContentList[i].classList.toggle("tb-on");
		            
		            const answer = qnaContentList[i].nextElementSibling;
		            if(answer){
		            	const isAnswer = answer.className.includes("qna-tb__answer");
		            	if(isAnswer){
			                answer.classList.toggle("tb-on");
			            }
		            }
		            
        	} else {
        		alert('비밀글입니다');
        	}
        });
    }
    qnaPaging(totalArticle,currentPage,addr);
	
}

function initSwiper(){
    const swiper = new Swiper('.swiper-container', {
        slidesPerView: 1,
        // spaceBetween: 10,
        slidesPerGroup: 1,
        loop: true,
        loopFillGroupWithBlank: true,
        
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    });
}

initSwiper();



// 테이블 이벤트
function reivewInit(){
    const reviewViewList = document.querySelectorAll(".review-tb__view");
    const reviewContents = document.querySelectorAll(".review-tb__content");
    const reviewImages = document.querySelectorAll(".review-img");

    const reviewViewListLength = reviewViewList.length;
    const reviewImagesLength = reviewImages.length;

    function resetContets(index){
        for(let i=0; i<reviewViewListLength; i++){
            if(i===index) continue;
            reviewContents[i].classList.remove("tb-on");
        }    
    }

    function resetImages(){
        for(let i=0; i<reviewImagesLength; i++){
            reviewImages[i].classList.remove("bigger");   
        }
    }
   

    function addAttachImage(){
        for(let i=0; i<reviewViewListLength; i++){
            const hasImage = reviewContents[i].querySelector("img");
            
            if(hasImage){
                const image = document.createElement("img");
                image.setAttribute("src","/mintProject/shop/storage/mint/icon/attach.gif");
                image.style.marginLeft="10px";
                reviewViewList[i].querySelectorAll("td")[2].appendChild(image);
            }
        }
    }
    
 
    for(let i=0; i<reviewViewListLength; i++){
        reviewViewList[i].addEventListener("click",function(){
            resetContets(i);
            resetImages();
            reviewContents[i].classList.toggle("tb-on");             
        });
    }



    for(let i=0; i<reviewImagesLength; i++){
        reviewImages[i].addEventListener("click",function(){
            reviewImages[i].classList.toggle("bigger");
            
        })
    }

    addAttachImage();
}

reivewInit();


(function(){
    const saveBtn = document.querySelector(".btn-save"),
          modal = document.querySelector(".notice-modal"),
          overlay = modal.querySelector(".notice-modal__overlay"),
          closeBtn = modal.querySelector(".notice-modal__close-btn"),
          yesBtn = modal.querySelector(".notice-modal__yes-btn");

    function closeModal(){
        modal.classList.add("hidden")
    }


    function openModal(){
    	$('.notice-modal__message').html("");
    	if($("#sessionId").val() == ""){
    		$('.notice-modal__message').text("로그인 하신 후 장바구니 등록을 해주세요.")
    	}else{
    		//장바구니 등록하는 당시에 재고보다 장바구니에 넣을 물품이 더 클 경우 방지 
			$.ajax({
        		type : "post",
        		url : "/mintProject/shop/goods/addCartList",
        		data : {'productCode' : $('#productCode').val(),
        			    'ctCount' : $('.qty').val(),
        			    'stock' : $('#stock').val()
        				},
        		dataType : "json",
        		success : function(data){
        			if(data.gubun=='1'){
        				$('.notice-modal__message').text("이미 동일한 상품이 장바구니에 존재합니다.");
        			}else if(data.gubun=='2'){
        				console.log($('#thumbImg').prop('src'));
        				$('.notice-modal__message').append($('<img>',{
        					src : $('#thumbImg').prop('src'),
        					height : "70px",
        					width : "70px"
        				})).append("&emsp;장바구니에 담겼습니다.");
        				
        				$('.gnb__cart-count').text(data.memCart);
        			}else if(data.gubun=='3'){
        				$('.notice-modal__message').text("재고보다 장바구니에 등록할 갯수가 부족합니다.");
        			}
        		},
        		error : function(error){
        			
        		}
        		
        	});
    	}
    	 modal.classList.remove("hidden");
    }
    saveBtn.addEventListener("click",openModal);
    overlay.addEventListener("click",closeModal);
    closeBtn.addEventListener("click",closeModal);
    yesBtn.addEventListener("click",closeModal);

})();


// 상품문의 - 페이징
function qnaPaging(totalArticle, currentPage, addr){
	let pageBlock = 5;
	let pageSize = 5;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	
	if(endPage > totalPage){
		endPage = totalPage;
	}

	if(startPage > pageBlock){
		$('.prev').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getProductQnaListByPage(' +(startPage-1)+ ')',
			text: '<'
		})).appendTo('#qna_pagination');
	}

	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getProductQnaListByPage('+i+')',
			text: i
		})).appendTo('#qna_pagination');
		
 		if(i == currentPage) {
 			$('.pg').attr('class', 'page-item active');
		} else {
			$('.pg').removeAttr('class', 'active');
		}	
	}
	
	if(endPage < totalPage) {
		$('.next').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getProductQnaListByPage('+(endPage+1)+')',
			text: '>'
		})).appendTo('#qna_pagination');
	}

}


//상품후기 - 페이징
function reviewPaging(totalArticle, currentPage){
	let pageBlock = 5;
	let pageSize = 5;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	
	if(endPage > totalPage){
		endPage = totalPage;
	}

	if(startPage > pageBlock){
		$('.prev').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getReviewByPage(' +(startPage-1)+ ')',
			text: '<'
		})).appendTo('#review_pagination');
	}

	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getReviewByPage('+i+')',
			text: i
		})).appendTo('#review_pagination');
		
 		if(i == currentPage) {
 			$('.pg').attr('class', 'page-item active');
		} else {
			$('.pg').removeAttr('class', 'active');
		}	
	}
	
	if(endPage < totalPage) {
		$('.next').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getReviewByPage('+(endPage+1)+')',
			text: '>'
		})).appendTo('#review_pagination');
	}

}

//재입고 알림 신청
$("#stockAlarm_btn").click(function(){
	if($("#sessionId").val() == ""){
		$(function(){
			swal({
				text : "로그인 후 이용할 수 있습니다.",
				showConfirmButton: true,
				//confirmButtonColor: '#8CD4F5',
				timer : 1600
			})
		});
	}else{
		$.ajax({
			type : "post",
			url : "/mintProject/shop/product/setProductAlarm",	
			data : "productCode="+$("#productCode").val(),
			dataType : "json",
			success : function(data){
				$(".notice-modal").removeClass("hidden");
				if(data.gubun=='1'){
					$('.notice-modal__message').text("이미 재입고 신청알림이 등록되었습니다.");
				}else if(data.gubun=='2'){
					$('.notice-modal__message').text("재입고 알림 신청이 되었습니다.");
				}
			},
			error : function(){
				
			}
		});
	}
});


	













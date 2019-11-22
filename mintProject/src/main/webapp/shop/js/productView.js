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
        if(qtyCount <= 0) return;
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
    
})();

// 상품문의 - 페이지 이동
function getProductQnaListByPage(pg){
	getProductQnaList(pg)
	.then(printProductQnaList)
	.catch();
}

// 상품문의 - 데이터 불러오기
function getProductQnaList(pg){
	return $.ajax({
		type : 'post',
    	url : '/mintProject/shop/product/productQnaBoardList',
    	data : {'productCode' : $('#productCode').val(), 'pg' : pg},
    	dataType : 'text',
	});
}

// 상품문의 - 화면에 뿌리기 + 이벤트
function printProductQnaList(result){
	
	$('#qna-tb').remove();
	$('.pagination qna li').remove();
	
	$('#qna').html(result.trim());
	
	$('.qna_cnt').text('상품문의('+$('#totalArticle').val()+')');
	
	let pg = $('#pg').val();
	let totalArticle = parseInt($('#totalArticle').val());
	let currentPage = pg;
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
		            const isAnswer = answer.className.includes("qna-tb__answer");
		            
		            if(isAnswer){
		                answer.classList.toggle("tb-on");
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
		$.ajax({
    		type : "post",
    		url : "/mintProject/shop/goods/addCartList",
    		data : {'productCode' : $('#productCode').val(),
    			    'ctCount' : $('.qty').val()		
    				},
    		dataType : "json",
    		success : function(data){
    			if(data.gubun=='1'){
    				$('.notice-modal__message').text("상품이 이미 카트에 담겨져 있습니다.");
    				
    			} else {
    				console.log('떠라');
    				console.log($('#thumbImg').prop('src'));
    				$('.notice-modal__message').append($('<img>',{
    					src : $('#thumbImg').prop('src'),
    					height : "70px",
    					width : "70px"
    				})).append("&emsp;&emsp;상품이 카드에 오오");

    			}
    		},
    		error : function(error){
    			
    		}
    		
    	});
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














(function (){
    const minusBtn =document.querySelector(".minus");
    const plusBtn = document.querySelector(".plus");

    const qty = document.querySelector(".qty");
    const total = document.querySelector(".total");
    
    const goodsPrice = document.querySelector(".goods-price");
    const gradePoint = document.querySelector(".grade-point");

    const pointCount = document.querySelector(".point");

    const totalInput = document.querySelector("#total");
    const pointInput = document.querySelector("#point");

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

    totalInput.value = price;
    pointInput.value = point;

        
    pointCount.innerText = makeComma(point);
    total.innerText = makeComma(price);
    
   
    plusBtn.addEventListener("click",function(){
        let curPoint = removeComma(pointCount.innerText);
        pointCount.innerText = makeComma(curPoint+point);
        totalInput.value = removeComma(pointCount.innerText);
        

        qtyCount++;
        qty.value = qtyCount;   
        total.innerText = makeComma(price*qtyCount);
        pointInput.value = removeComma(total.innerText);

    });


    minusBtn.addEventListener("click",function(){
        if(qtyCount <= 0) return;
        let curPoint = removeComma(pointCount.innerText);
        pointCount.innerText = makeComma(curPoint-point);
        totalInput.value = removeComma(pointCount.innerText);

        qtyCount--;
        qty.value =qtyCount
        total.innerText = makeComma(price*qtyCount);
        pointInput.value = removeComma(total.innerText);
        
    })

})();

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
          modal = document.querySelector(".modal"),
          overlay = modal.querySelector(".modal__overlay"),
          closeBtn = modal.querySelector(".modal__close-btn"),
          yesBtn = modal.querySelector(".modal__yes-btn");

    function closeModal(){
        modal.classList.add("hidden")
    }


    function openModal(){
        modal.classList.remove("hidden");
    }

    saveBtn.addEventListener("click",openModal);
    overlay.addEventListener("click",closeModal);
    closeBtn.addEventListener("click",closeModal);
    yesBtn.addEventListener("click",closeModal);

})();


function qnaInit(){
    const qnaViewList = document.querySelectorAll(".qna-tb__view"),
          qnaContentList = document.querySelectorAll(".qna-tb__content");


    for(let i=0; i<qnaViewList.length; i++){
        qnaViewList[i].addEventListener("click",function(){
            qnaContentList[i].classList.toggle("tb-on");
            
            const answer = qnaContentList[i].nextElementSibling;
            const isAnswer = answer.className.includes("qna-tb__answer");
            
            if(isAnswer){
                answer.classList.toggle("tb-on");
            }
        });
    }

}
qnaInit();















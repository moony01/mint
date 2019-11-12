<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="wrap">
    <div class="product__menu">
        <div class="product__title"><img src="/mintProject/shop/storage/mint/icon/corn.png" alt="">농산물</div>
        <div class="just-flex">
            <ul class="product__list">
                <li class="cur-product"><a href="">전체보기</a></li>
                <li><a href="">과일</a></li>
                <li><a href="">기본채소</a></li>
                <li><a href="">쌈채소</a></li>
                <li><a href="">브로콜리·특수채소</a></li>
                <li><a href="">피망·고추</a></li>
                <li><a href="">곡류</a></li>
                <li><a href="">버섯류</a></li>
                <li><a href="">견과류</a></li>
            </ul>
            <div class="product__sort">
                <span class="sort up">신상품순</span>
                <ul class="sort__list">
                    <li><a href="">추천순</a></li>
                    <li><a href="">신상품순</a></li>
                    <li><a href="">인기상품순</a></li>
                    <li><a href="">낮은 가격순</a></li>
                    <li><a href="">높은 가격순</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="product__main">
        <div class="product__item">
            <div class="product__thumb">
                <img class="discount-rate" src="./image/distate-20.png" alt="">
                <img class="thumb" src="https://img-cf.kurly.com/shop/data/goods/1531901452450l0.jpg" alt="">
                <div class="cart-btn">
                    <img src="./image/cart.png" alt="">
                </div>
            </div>
            <div class="product__info">
                <div class="product__name">무농약 깐 생강</div>
                <div class="product__cost">
                    <span class="product__dc">3,000원</span>
                    <span class="product__price">2,000원</span>
                </div>
                <div class="product__disc">요리의 풍미를 더하는 간편 향신채(1봉/50g)</div>
            </div>
        </div>

        <div class="product__item">
            <div class="product__thumb">
                <img class="thumb" src="https://img-cf.kurly.com/shop/data/goods/1572931731508l0.jpg" alt="">
                <div class="cart-btn">
                    <img src="./image/cart.png" alt="">
                </div>
            </div>
            <div class="product__info">
                <div class="product__name">김장용 해남 절임 배추 20kg (예약일 수령)</div>
                <div class="product__cost">
                    <span class="product__price">29,500원</span>
                </div>
                <div class="product__disc">요리의 풍미를 더하는 간편 향신채(1봉/50g)</div>
            </div>
        </div>

        <div class="product__item">
            <div class="product__thumb">
                <img class="thumb" src="https://img-cf.kurly.com/shop/data/goods/1572931125846l0.jpg" alt="">
                <div class="cart-btn">
                    <img src="./image/cart.png" alt="">
                </div>
            </div>
            <div class="product__info">
                <div class="product__name">[김장세트] 4인가족 간편 김장 패키지 (예약일 수령)</div>
                <div class="product__cost">
                    <span class="product__price">20,000원</span>
                </div>
                <div class="product__disc">두 번에 걸쳐 골고루 절여 아삭한</div>
            </div>
        </div>               
    </div>
</section>
<script>
    const sort = document.querySelector(".sort");
    const sortList = document.querySelector(".sort__list");
    sort.addEventListener("click",()=>{
        const hasUp = sort.classList.contains("up");
        if(hasUp){
            sort.classList.remove("up");
            sort.classList.add("down");
            sortList.classList.toggle("on")
        }else{
            sort.classList.remove("down");
            sort.classList.add("up");
            sortList.classList.toggle("on")
        }
    });

</script>
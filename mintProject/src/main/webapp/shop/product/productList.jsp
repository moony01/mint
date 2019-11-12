<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
    	<c:if test="${list != null}">
    		<c:forEach var="list" items="${list}">
		        <div class="product__item">
		            <div class="product__thumb">
		            	<c:if test="${list.discountRate == 20}">
		            		<img class="discount-rate" src="./image/distate-20.png" alt="">
		            	</c:if>
		                <img class="thumb" src="https://img-cf.kurly.com/shop/data/goods/1531901452450l0.jpg" alt="">
		                <div class="cart-btn">
		                    <img src="./image/cart.png" alt="">
		                </div>
		            </div>
		            <div class="product__info">
		                <div class="product__name">무농약 깐 생강</div>
		                <div class="product__cost">
		                	<c:if test="${list.discountRate == 20}">
		                		<span class="product__dc">${list.price * 0.8}</span>
		                	</c:if>
		                    <span class="product__price">${list.price}</span>
		                </div>
		                <div class="product__disc">요리의 풍미를 더하는 간편 향신채(1봉/50g)</div>
		            </div>
		        </div>
        	</c:forEach>
        </c:if>
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
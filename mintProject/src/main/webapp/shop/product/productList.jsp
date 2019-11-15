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
                	<c:if test="${gubun == 1}">
                		<li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=1&gubun=${gubun}">신상품순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=2&gubun=${gubun}">인기상품순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=3&gubun=${gubun}">낮은 가격순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=4&gubun=${gubun}">높은 가격순</a></li>
	            	</c:if>
	            	<c:if test="${gubun == 2}">
                		<li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=1&gubun=${gubun}">신상품순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=2&gubun=${gubun}">인기상품순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=3&gubun=${gubun}">낮은 가격순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=4&gubun=${gubun}">높은 가격순</a></li>
	            	</c:if>
	            	<c:if test="${gubun == 3}">
                		<li><a href="/mintProject/productList/getProductList?selectGubun=1&gubun=${gubun}">신상품순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?selectGubun=2&gubun=${gubun}">인기상품순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?selectGubun=3&gubun=${gubun}">낮은 가격순</a></li>
	                    <li><a href="/mintProject/productList/getProductList?selectGubun=4&gubun=${gubun}">높은 가격순</a></li>
	            	</c:if>                
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
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-20.png" alt="">
		            	</c:if>
		            	<c:if test="${list.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-30.png" alt="">
		            	</c:if>
		            	<c:if test="${list.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-40.png" alt="">
		            	</c:if>
		            	<c:if test="${list.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-50.png" alt="">
		            	</c:if>
		                <img class="thumb" src="/mintProject/shop/storage/${list.thumbnail}" alt="">
		                <div class="cart-btn">
		                    <a href="/mintProject/shop/goods/cart"><img src="/mintProject/shop/storage/mint/icon/cart_test.png" alt="" style="width: 28px"></a>
		                </div>
		            </div>
		            <div class="product__info">
		                <div class="product__name">${list.mainSubject }</div>
		                <div class="product__cost"> 
		                	<c:if test="${list.discountRate != 0}">
		                		<span class="product__dc">
		                			<fmt:formatNumber type="currency" value="${list.price}" currencyCode="KRW" pattern="#,###"/>
								</span>			                	
		                		<%-- <span class="product__dc">${list.price}</span> --%>
		                		<span class="product__price">
		                			<fmt:formatNumber type="currency" value = "${list.price - (list.price * (list.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원
		                		</span><!-- 원가 - 원가*0.할인율 -->
		                	</c:if>
		                	<c:if test="${list.discountRate == 0}">
		                		<span class="product__price">
		                			<fmt:formatNumber type="currency" value = "${list.price}" currencyCode="KRW" pattern="#,###"/>원
		                		</span><!-- 원가 - 원가*0.할인율 -->
		                	
		                	</c:if>
		                	<c:if test="${list.discountRate == null}">
		                		 <span class="product__price">${list.price}원</span>
		                	</c:if>
		                </div>
		                <div class="product__disc">${list.subSubject }</div>
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
    
   /*  console.log(${selectGubun})
    const gubun = ${selectGubun};
    const sortText = ["신상품순","인기상품순","낮은 가격순","높은 가격순"]; */
    /* sort.textContent = sortText[gubun-1];  */
  
 

</script>
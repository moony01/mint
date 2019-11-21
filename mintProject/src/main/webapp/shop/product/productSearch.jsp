<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/mintProject/shop/js/index.js"></script>

<div class="search_wrap">
<div class="product__name" style="font-size: 30px; text-align: center;"> 
	상품검색
</div>
<div class="product__disc" style="text-align: center; margin-bottom: 50px;">
신선한 민트의 상품을 검색해보세요.
</div>
<div class="search_box">
	<input type="text" class="gnb__item inp" id="sword_spg" name="sword" value="${sword }"><input type="button" class="review__write-btn search_btn" value="검색하기" style="border: none;" onclick="search_from_spage()">
	<div class=""></div>
</div>

<div class="product__main">
		<c:if test="${resultCnt == '0' }">
			<div class="product__item">
				<span>검색된 상품이 없습니다.</span>
			</div>
		</c:if>
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
		                <!-- 삼품 이미지 클릭 시 상품 상세뷰 페이지로 이동 -->         
	                	<a href="/mintProject/shop/product/productView?productCode=${list.productCode}&subCategory=${list.subCategory}">
	                		<img class="thumb" src="/mintProject/shop/storage/mint/product/${list.thumbnail}" alt="">
	                	</a>
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
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main class="main">
    <!-- 배너 -->
    <div class="main__banner">
        <div class="swiper-container main__banner-slide">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="">
                        <img
                            src="//img-cf.kurly.com/shop/data/main/1/pc_img_1574925170.jpg"
                            alt=""
                        />
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="">
                        <img
                            src="//img-cf.kurly.com/shop/data/main/1/pc_img_1572599646.jpg"
                            alt=""
                        />
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="">
                        <img
                            src="//img-cf.kurly.com/shop/data/main/1/pc_img_1572494957.jpg"
                            alt=""
                        />
                    </a>
                </div>
            </div>
        </div>
        <button class="banner-slide-btn banner-btn--left" id="banner-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn.png"
                alt=""
            />
        </button>
        <button class="banner-slide-btn banner-btn--right" id="banner-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn.png"
                alt=""
            />
        </button>
    </div>

    <!-- 이 상품 어때요 슬라이더 -->
    <div class="main__event">
        <div class="main__event-tit"> 이 상품 어때요? </div>
        <div class="swiper-container main__event-slide1 slide_pc1">
            <div class="swiper-wrapper">
            <!-- 컨텐트가 슬라이더 안에 들어가는 아이템들 짝수 단위로 넣어주세요
                            컨테트는 swiper-slide요소 안에 있어야 돼요-->
            <c:forEach items="${recList }" var="recProduct">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <c:if test="${recProduct.discountRate == 10}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 20}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
		            	</c:if>

                        <a href="/mintProject/shop/product/productView?productCode=${recProduct.productCode}&subCategory=${recProduct.subCategory}">
                            <img
                                src="/mintProject/shop/storage/mint/product/${recProduct.thumbnail}"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">${recProduct.mainSubject }</span>
                            <span class="info-price"><fmt:formatNumber type="currency" value = "${recProduct.price - (recProduct.price * (recProduct.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원</span>
                            <c:if test="${recProduct.discountRate != 0}">
                            <span class="info-cost"><fmt:formatNumber type="currency" value="${recProduct.price}" currencyCode="KRW" pattern="#,###"/>원</span>
                        	</c:if>
                        </div>
                    </div>
                </div>
			</c:forEach>
            </div>
        </div>
        
        <div class="swiper-container main__event-slide1 slide_mobile1">
            <div class="swiper-wrapper">
            <!-- 컨텐트가 슬라이더 안에 들어가는 아이템들 짝수 단위로 넣어주세요
                            컨테트는 swiper-slide요소 안에 있어야 돼요-->
            <c:forEach items="${recList }" var="recProduct">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <c:if test="${recProduct.discountRate == 10}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 20}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${recProduct.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
		            	</c:if>

                        <a href="/mintProject/shop/product/productView?productCode=${recProduct.productCode}&subCategory=${recProduct.subCategory}">
                            <img
                                src="/mintProject/shop/storage/mint/product/${recProduct.thumbnail}"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">${recProduct.mainSubject }</span>
                            <span class="info-price"><fmt:formatNumber type="currency" value = "${recProduct.price - (recProduct.price * (recProduct.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원</span>
                            <c:if test="${recProduct.discountRate != 0}">
                            <span class="info-cost"><fmt:formatNumber type="currency" value="${recProduct.price}" currencyCode="KRW" pattern="#,###"/>원</span>
                        	</c:if>
                        </div>
                    </div>
                </div>
			</c:forEach>
            </div>
        </div>
        
        <button class="event-slide-btn slide-btn--right" id="event1-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn-default.png"
                alt=""
            />
        </button>
        <button class="event-slide-btn slide-btn--left" id="event1-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn-default.png"
                alt=""
            />
        </button>
    </div>

    <!-- 일일 특가 -->
    <div class="main__special">
        <div class="main__special-tit">
            <h3>일일 특가</h3>
            <div class="tit-desc">
                매일 오전 11시, 베스트 상품 24HR한정특가!
            </div>
            <div class="main__special-deco">
                <img
                    src="https://res.kurly.com/pc/service/main/1907/ico_hook.png"
                    alt=""
                />
                망설이면 늦어요!
            </div>
        </div>

        <div class="main__special-content">
            <a class="main__special-thumb" href="">
                <div class="ds-thumbnail special-thumb"></div>
                <div class="main__special-count">
                    <div class="special-count" id="dscd">
					  <span class="timeel hours">00</span>
					  <span class="timeel timeRefHours">시간</span>
					  <span class="timeel minutes">00</span>
					  <span class="timeel timeRefMinutes">분</span>
					  <span class="timeel seconds">00</span>
					  <span class="timeel timeLeft">초 남음</span>
					</div>
                </div>
            </a>
            <div class="main__special-info">
                <div class="ds-mainsubject main__special-subject"></div>
                <div class="ds-subsubject main__special-desc"></div>
                <div class="main__speical-total">
                    <span class="ds-eventprice main__special-price"></span>
                    <span class="ds-price main__special-cost"></span>
                </div>
            </div>
        </div>
    </div>

    <!-- 알뜰 상품 슬라이더 -->
    <div class="main__event">
        <div class="main__event-tit">
            <a href="/mintProject/productList/getProductList?gubun=3&headGubun=3&pg=1">알뜰 상품</a>
        </div>
        <div class="swiper-container main__event-slide2 slide_pc2">
            <div class="swiper-wrapper">
            <c:forEach items="${saleList }" var="saleProduct">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <c:if test="${saleProduct.discountRate == 10}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 20}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
		            	</c:if>

                        <a href="/mintProject/shop/product/productView?productCode=${saleProduct.productCode}&subCategory=${saleProduct.subCategory}">
                            <img
                                src="/mintProject/shop/storage/mint/product/${saleProduct.thumbnail}"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">${saleProduct.mainSubject }</span>
                            <span class="info-price"><fmt:formatNumber type="currency" value = "${saleProduct.price - (saleProduct.price * (saleProduct.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원</span>
                            <c:if test="${saleProduct.discountRate != 0}">
                            <span class="info-cost"><fmt:formatNumber type="currency" value="${saleProduct.price}" currencyCode="KRW" pattern="#,###"/>원</span>
                        	</c:if>
                        </div>
                    </div>
                </div>
			</c:forEach>
            </div>
        </div>
        
        <div class="swiper-container main__event-slide2 slide_mobile2">
            <div class="swiper-wrapper">
            <c:forEach items="${saleList }" var="saleProduct">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <c:if test="${saleProduct.discountRate == 10}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 20}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${saleProduct.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
		            	</c:if>

                        <a href="/mintProject/shop/product/productView?productCode=${saleProduct.productCode}&subCategory=${saleProduct.subCategory}">
                            <img
                                src="/mintProject/shop/storage/mint/product/${saleProduct.thumbnail}"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">${saleProduct.mainSubject }</span>
                            <span class="info-price"><fmt:formatNumber type="currency" value = "${saleProduct.price - (saleProduct.price * (saleProduct.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원</span>
                            <c:if test="${saleProduct.discountRate != 0}">
                            <span class="info-cost"><fmt:formatNumber type="currency" value="${saleProduct.price}" currencyCode="KRW" pattern="#,###"/>원</span>
                        	</c:if>
                        </div>
                    </div>
                </div>
			</c:forEach>
            </div>
        </div>
        
        <button class="event-slide-btn slide-btn--right" id="event2-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn-default.png"
                alt=""
            />
        </button>
        <button class="event-slide-btn slide-btn--left" id="event2-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn-default.png"
                alt=""
            />
        </button>
    </div>

    <!-- 이벤트 소식 -->
    <div class="main__news">
        <div class="main__event-tit">
            <a href="/mintProject/shop/goods/event">이벤트 소식</a>
        </div>
        <ul class="news__list">
	   
	           <%--  <li class="news__item">
	                <a href="/mintProject/shop/goods/eventProductList?seq=${eventList.seq}&pg=1"
	                    ><img
	                        style="background-image:url(/mintProject/shop/storage/mint/event/${eventList.eventThumbnail})"
	                        class="news__thumb"
	                /></a>
	                <div class="news__subject">${eventList.subject}</div>
	                
	            </li> --%>
	
		
        </ul>
    </div>

    <!-- 신상품 슬라이더 -->
    <div class="main__event">
        <div class="main__event-tit">
            <a href="/mintProject/productList/getProductList?gubun=3&headGubun=1&pg=1">오늘의 신상품</a>
        </div>
        <div class="swiper-container main__event-slide3 slide_pc3">
            <div class="swiper-wrapper">
            <c:forEach items="${newList }" var="newProduct">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <c:if test="${newProduct.discountRate == 10}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 20}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
		            	</c:if>

                        <a href="/mintProject/shop/product/productView?productCode=${newProduct.productCode}&subCategory=${newProduct.subCategory}">
                            <img
                                src="/mintProject/shop/storage/mint/product/${newProduct.thumbnail}"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">${newProduct.mainSubject }</span>
                            <span class="info-price"><fmt:formatNumber type="currency" value = "${newProduct.price - (newProduct.price * (newProduct.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원</span>
                            <c:if test="${newProduct.discountRate != 0}">
                            <span class="info-cost"><fmt:formatNumber type="currency" value="${newProduct.price}" currencyCode="KRW" pattern="#,###"/>원</span>
                        	</c:if>
                        </div>
                    </div>
                </div>
			</c:forEach>
              
            </div>
        </div>
        
        <div class="swiper-container main__event-slide3 slide_mobile3">
            <div class="swiper-wrapper">
            <c:forEach items="${newList }" var="newProduct">
                <div class="swiper-slide">
                    <div class="main__event-content">
                        <c:if test="${newProduct.discountRate == 10}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 20}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
		            	</c:if>
		            	<c:if test="${newProduct.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
		            	</c:if>

                        <a href="/mintProject/shop/product/productView?productCode=${newProduct.productCode}&subCategory=${newProduct.subCategory}">
                            <img
                                src="/mintProject/shop/storage/mint/product/${newProduct.thumbnail}"
                                alt=""
                                class="main__event-thumb"
                            />
                        </a>
                        <div class="main__event-info">
                            <span class="info-name">${newProduct.mainSubject }</span>
                            <span class="info-price"><fmt:formatNumber type="currency" value = "${newProduct.price - (newProduct.price * (newProduct.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원</span>
                            <c:if test="${newProduct.discountRate != 0}">
                            <span class="info-cost"><fmt:formatNumber type="currency" value="${newProduct.price}" currencyCode="KRW" pattern="#,###"/>원</span>
                        	</c:if>
                        </div>
                    </div>
                </div>
			</c:forEach>
              
            </div>
        </div>
        
        <button class="event-slide-btn slide-btn--right" id="event3-pre">
            <img
                src="/mintProject/shop/storage/mint/icon/prev-btn-default.png"
                alt=""
            />
        </button>
        <button class="event-slide-btn slide-btn--left" id="event3-next">
            <img
                src="/mintProject/shop/storage/mint/icon/next-btn-default.png"
                alt=""
            />
        </button>
    </div>
</main>

<script src="/mintProject/shop/js/main.js"></script>
<script type="text/javascript" src="/mintProject/shop/js/event.js"></script>

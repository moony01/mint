<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<section class="product-view">
	<input type="hidden" id="productCode" value="${productDTO.productCode }">
	<input type="hidden" id="subCategory" value="${productDTO.subCategory }">
	<input type="hidden" id="sessionId" value="${memId }">
    <div class="goods-info">
        <div class="goods-info__thumb">
            <img id="thumbImg" src="/mintProject/shop/storage/mint/product/${productDTO.thumbnail}" alt="">
        </div>
        <div class="goods-info__contents">
            <div class="goods-name">
                ${productDTO.mainSubject}
            </div>
            <div class="goods-desc">
                ${productDTO.subSubject}
            </div>
            
            <c:if test="${productDTO.discountRate != 0}">
            	<div class="goods-price">
                	<span>
                		<fmt:formatNumber type="currency" value = "${productDTO.price - (productDTO.price * (productDTO.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>
                	</span>
                	<span class="won">원</span>
                	<span class="goods-price__dc">${productDTO.discountRate}%</span>
            	</div>
            	<!-- 원가 -->
            	<div class="goods-original-price">
                	${productDTO.price}원
            	</div>
            </c:if>
             <c:if test="${productDTO.discountRate == 0}">
             	<div class="goods-price">
                	<span>
                		<fmt:formatNumber type="currency" value = "${productDTO.price}" currencyCode="KRW" pattern="#,###"/>
                	</span>
                	<span class="won">원</span>
                	<span class="goods-price__dc"></span>
            	</div>
             </c:if>
             
			<c:choose>
				<c:when test="${memLevel ==  0}">
					<div class="goods-grade">
                		<span class="grade-icon">일반 5%</span>
                		<span class="grade-txt">개당 <span class="grade-point"><fmt:formatNumber type="currency" value = "${productDTO.price * 0.05}" currencyCode="KRW" pattern="#,###"/></span>원 적립</span>
            		</div>
				</c:when>
				<c:when test="${memLevel ==  1 }">
					<div class="goods-grade">
                		<span class="grade-icon">우수 7%</span>
                		<span class="grade-txt">개당 <span class="grade-point"><fmt:formatNumber type="currency" value = "${productDTO.price * 0.07}" currencyCode="KRW" pattern="#,###"/></span>원 적립</span>
            		</div>
				</c:when>
				<c:when test="${memLevel ==  2 }">
					<div class="goods-grade">
               			<span class="grade-icon">최우수 10%</span>
                		<span class="grade-txt">개당 <span class="grade-point"><fmt:formatNumber type="currency" value = "${productDTO.price * 0.1}" currencyCode="KRW" pattern="#,###"/></span>원 적립</span>
            		</div>
				</c:when>
				<c:when test="${memLevel ==  null }">
					<div class="goods-grade">
               			<span>로그인 후 적립혜택을 확인할 수 있습니다 </span>
                		<span class="grade-txt"><span class="grade-point"><fmt:formatNumber type="currency" value ="" currencyCode="KRW" pattern="#,###"/></span></span>
            		</div>
				</c:when>
			</c:choose>
            <dl class="goods-col">
                <dt>판매 단위</dt>
                <dd>${productDTO.unit}</dd>
            </dl>
            <dl class="goods-col">
                <dt>중량/용량</dt>
                <dd>${productDTO.weight}</dd>
            </dl>
           <!--  <dl class="goods-col">
                <dt>원산지</dt>
                <dd>국내산</dd>
            </dl> -->
            <dl class="goods-col">
                <dt>안내사항</dt>
                <dd>
                    ${productDTO.information}
                </dd>
            </dl>
            <dl class="goods-col">
                <dt>구매수량</dt>
                <dd>
                    <span class="goods-count">
                        <button class="minus"></button>
                        <input type="text" value="1" class="qty" readonly>
                        <button class="plus"></button>
                    </span>
                </dd>
            </dl>
            <div class="goods-total"> 
                <div class="goods-total__price">
                    <span class="goods-total__tit">총 상품 금액:</span>
                    <span class=total></span>
                    <span class=won>원</span>
                </div>
                <c:choose>
                	<c:when test="${memLevel !=  null}">
                		<div class="goods-total__point">
                    		<span class="point-logo">적립</span>
                    		<span class="point-txt">구매 시 <span class="point"></span>원 적립</span>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<div class="goods-total__point" style="display:none;">
                    		<span class="point-logo">적립</span>
                    		<span class="point-txt"><span class="point"></span></span>
                		</div>
                	</c:otherwise>
                </c:choose>
            </div>
            <div class="goods-total__btns">
                <!-- 벨류는 자동으로 변경됨 -->
                <!-- btn-off 이벤트 설정 못하게 하는 클래스 -->
                <c:if test="${productDTO.stock <= 0}">
                	<div class="g-btn btn-alaram btn-on" id="stockAlarm_btn">재입고 알림</div>
                </c:if>
                <c:if test="${productDTO.stock != 0}">
                	<div class="g-btn btn-alaram btn-off">재입고 알림</div>
                </c:if>
                <div class="g-btn btn-always">늘 사는 것</div>
                <c:if test="${productDTO.stock <= 0}">
                	<div class="g-btn btn-save btn-save--off">장바구니 담기</div>
                </c:if>
                <c:if test="${productDTO.stock != 0}">
                	<div class="g-btn btn-save">장바구니 담기</div>
                </c:if>
            </div>
        </div>
    </div>

	<c:if test="${list.size() == 10 }">
	    <div class="goods-rel">
	        <div class="goods-rel__title">
	            관련된 상품들
	        </div>
	        <div class="swiper-container">
	            <ul class="swiper-wrapper">
	                <!-- swiper-slide안에 총 5개 관련된 상품 뿌릴 수 있음! -->
	                <li class="swiper-slide">
	                    <div class="goods-rel__slide-group">
	                    	<c:forEach var="i" begin="0" end="4" step="1">
								<div class="goods-rel__slide-item">
		                            <div class="goods-rel__img">
		                                <a href="/mintProject/shop/product/productView?productCode=${list.get(i).getProductCode()}&subCategory=${list.get(i).getSubCategory()}"><img src="/mintProject/shop/storage/mint/product/${list.get(i).getThumbnail()}" alt=""></a>
		                            </div>
		                            <div class="goods-rel__content">
		                                <span class="goods-rel__tit">${list.get(i).getMainSubject()}</span>
		                                <span class="goods-rel__price">${list.get(i).getPrice()}원</span>
		                            </div>
	                        	</div>
							</c:forEach>
	                    </div>
	                </li>
	               <li class="swiper-slide">
	                    <div class="goods-rel__slide-group">
	                    	<c:forEach var="i" begin="5" end="9" step="1">
								<div class="goods-rel__slide-item">
		                            <div class="goods-rel__img">
		                                <a href="/mintProject/shop/product/productView?productCode=${list.get(i).getProductCode()}&subCategory=${list.get(i).getSubCategory()}"><img src="/mintProject/shop/storage/mint/product/${list.get(i).getThumbnail()}" alt=""></a>
		                            </div>
		                            <div class="goods-rel__content">
		                                <span class="goods-rel__tit">${list.get(i).getMainSubject()}</span>
		                                <span class="goods-rel__price">${list.get(i).getPrice()}원</span>
		                            </div>
	                        	</div>
							</c:forEach>
	                    </div>
	                </li>
	            </ul>
	            
	            <div class="swiper-button-prev"><i class=xi-angle-left></i></div>
	            <div class="swiper-button-next"><i class="xi-angle-right"></i></div>  
	        </div>
	    </div>
	</c:if>
	
    <section class="goods-detail">
        <div id="description">
            <ul class="goods-detail__tab">
                <li><a href="#description">상품설명</a></li>
                <li><a href="#image">상품이미지</a></li>
                <li><a href="#info">상세정보</a></li>
                <li><a href="#review" class="review_cnt"></a></li>
                <li><a href="#qna" class="qna_cnt"></a></li>
            </ul>
        
            <div class="goods-detail__content">        	
                 <div class="goods--align">
          			${productDTO.description }
 				</div>
            </div>
        </div>
        

        <div id="image">
            <ul class="goods-detail__tab">
                <li><a href="#description">상품설명</a></li>
                <li><a href="#image">상품이미지</a></li>
                <li><a href="#info">상세정보</a></li>
                <li><a href="#review" class="review_cnt"></a></li>
                <li><a href="#qna" class="qna_cnt"></a></li>
            </ul>
            <div class="goods-detail__content">
               <!--  <img src="/mintProject/shop/storage/mint/icon/aa.jpg" alt=""> -->
               <div class="goods--align">
          			<img src="/mintProject/shop/storage/mint/product/${productDTO.productImage }" alt="">
 				</div>
            </div>
        </div>

        <div id="info">
            <ul class="goods-detail__tab">
                <li><a href="#description">상품설명</a></li>
                <li><a href="#image">상품이미지</a></li>
                <li><a href="#info">상세정보</a></li>
                <li><a href="#review" class="review_cnt"></a></li>
                <li><a href="#qna" class="qna_cnt"></a></li>
            </ul>
            <div class="goods-detail__content">
 				<div class="goods--align">
 					${productDTO.details }
 				</div>

            </div>
        </div>

        <div id="review">
            <ul class="goods-detail__tab">
                <li><a href="#description">상품설명</a></li>
                <li><a href="#image">상품이미지</a></li>
                <li><a href="#info">상세정보</a></li>
                <li><a href="#review" class="review_cnt"></a></li>
                <li><a href="#qna" class="qna_cnt"></a></li>
            </ul>
            <div class="review__wrap">
                <div class="review__total-container">
                    <div class="review__total">
                        <div class="reivew-r1">
                            <div class="review-txt1">사용자 총 평점</div>
                            <div class="review-txt2">(총 <span class="reivew__users-count"></span>개 고객후기 기준)</div>
                        </div>
                        <div class="review-r2">
                            
                            <div class="review-star" id = "starImgArea"></div>
                            <!-- ex)
                                lg는 크기 뒤에 숫지는 스타 갯수 
                                star-lg-5은 0.5개
                                star-lg-10은 1개
                                star-lg-50은 5개
                            -->
                            <div class="review-avg">
                                <span class="review-avg__point" id = "starAvg">4.8</span>
                                <span class="review-avg__max-point">/5<span class="dot">점</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="review__view">
                <div class="reivew__view-hedaer">
                    <div class="reivew__view-title">
                        고객후기
                    </div>
                    <div class="review__view-btns">
                        <select name="" id="sort" class="review__sort">
                            <option value="NEW">최근 등록순</option>
                            <option value="SORT">평점 높은순</option>
                        </select>
                        <div class="review__write-btn" id = "writeReview">
                            고객후기 작성
                        </div>
                    </div>
                </div>
                <table class="review-tb" id = "reviewArea">
                    
                </table>
                <div class="paging-wrap">
				    <ul class="pagination review" id="review_pagination">
				        <li class="page-item prev"></li>
				        <li class="page-item next"></li>
				    </ul>
				</div>
            </div>

        </div>

        <div id="qna"></div>   
    </section>
</section>

<!-- 모달 -->
<div class="notice-modal hidden">
    <div class="notice-modal__overlay"></div>
    <div class="notice-modal__content">
        <div class="notice-modal__header">
            <span class="notice-modal__tit">알림메시지</span>
            <button class="notice-modal__close-btn"></button>
        </div>
        <div class="notice-modal__message">
            <span></span>
        </div>
        <div class="notice-modal__footer">
            <button class="notice-modal__yes-btn">
                확인
            </button>
        </div>
    </div>
</div>

<script src="/mintProject/shop/js/productView.js"></script>

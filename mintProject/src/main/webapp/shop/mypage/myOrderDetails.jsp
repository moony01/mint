<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="wrap">
    <div class="my-cart__header">
        <div class="my-cart__tit">주문 내역</div>
    </div>
    <div class="order-state">
        <div class="order-state__state" id="order-state-0">입금전</div>
        <div class="order-state__arrow">
            <i class="fas fa-arrow-right"></i>
        </div>
        <div class="order-state__state" id="order-state-1">배송준비</div>
        <div class="order-state__arrow">
            <i class="fas fa-arrow-right"></i>
        </div>
        <div class="order-state__state" id="order-state-2">배송중</div>
        <div class="order-state__arrow">
            <i class="fas fa-arrow-right"></i>
        </div>
        <div class="order-state__state" id="order-state-3">배송완료</div>
    </div>
    <div class="title2">
        <h2>상품 정보</h2>
    </div>
    <div class="cart-goods">
        <table class="order-tb">
            <tr class="order-tb__header">
                <th></th>
                <th>상품 정보</th>
                <th>상품 금액</th>
            </tr>
            <c:forEach var="data" items="${productList }">
            	<tr class="order-tb__item">
                <td class="order-tb__thumb">
                    <img
                        src="/mintProject/shop/storage/mint/product/${data.THUMBNAIL }"
                        alt=""
                    />
                </td>
                <td class="order-tb__desc">
                    <div class="order-tb__name">${data.MAINSUBJECT }</div>
                    <div class="order-tb__price">
                        <span class="order-tb__num">${data.QTY }개 / 개 당 <fmt:formatNumber value="${data.ORGPRICE}" pattern="##,###,###"/>원</span><br/><br/>
                        <span class="order-tb__num">총 <fmt:formatNumber value="${data.DCPRICE}" pattern="##,###,###"/>원 할인</span>
                    </div>
                </td>
                <td class="order-tb__total"><fmt:formatNumber value="${data.PRICE}" pattern="##,###,###"/> 원</td>
            </tr>
            <c:set var="originalPrice" value="${originalPrice + (data.QTY * data.ORGPRICE) }"/>
            <c:set var="totalDCPrice" value="${totalDCPrice + data.DCPRICE}"/>
            </c:forEach>
        </table>
    </div>
    <div class="title2">
        <h2>주문자 정보</h2>
    </div>
    <div class="cart-goods">
        <table class="info-tb">
            <tr class="info-tb__fst">
                <th class="size-2">보내는 분 *</th>
                <td class="size-10">
                    <input
                        type="text"
                        value="${orderDetails.MEMNAME }"
                        readonly
                        class="read-only"
                    />
                </td>
            </tr>
            <tr class="info-tb__phone">
                <th class="size-2">휴대폰 *</th>
                <td class="size-10">
                    <input type="text" value="${orderDetails.MEMTEL }" readonly class="read-only" style="width: 140px;" />
                </td>
            </tr>
            <tr class="info-tb__email">
                <th class="size-2">이메일 *</th>
                <td class="size-10">
                    <input
                        type="text"
                        value="${orderDetails.MEMEMAIL }"
                        readonly
                        class="read-only"
                    />
                </td>
            </tr>
        </table>
    </div>

    <div class="sticky-wrap">
        <div class="contents-area">
            <div class="title2">
                <h2>배송 정보</h2>
            </div>
            <div class="cart-goods">
                <table class="shipping-tb">
                    <tr class="shipping-tb__addr">
                        <th class="size-2">주소</th>
                        <td class="size-10">
                            <input
                                type="text"
                                class="shipping-tb__addr1"
                                id="addr1"
                                value="${orderDetails.ADDR1 }"
                                readonly
                            />
                            <input
                                type="text"
                                class="shipping-tb__addr2 read-only"
                                id="addr2"
                                value="${orderDetails.ADDR2 }"
                                readonly
                            />
                        </td>
                    </tr>
                    <tr class="shipping-tb__name">
                        <th class="size-2">수령인 이름 *</th>
                        <td class="size-10">
                            <input type="text" value="${orderDetails.NAME }" readonly/>
                        </td>
                    </tr>
                    <tr class="shipping-tb__phone">
                        <th class="size-2">휴대폰 *</th>
                        <td class="size-10">
                            <input type="text" value="${orderDetails.TEL }" style="width:163px; padding-left:8px; text-align:left;" readonly>
                        </td>
                    </tr>
                    <tr class="shipping-tb__ask">
                        <th class="size-2">배송 요청사항</th>
                        <td class="size-10">
                            <textArea class="shipping-tb__textarea" maxlength="50" style="resize: none;" readonly>${orderDetails.REQUEST }</textArea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="sticky-area">
            <div class="title2">
                <h2>결제 금액</h2>
            </div>
            <table class="bill-tb">
                <tr class="bill-tb__product-price">
                    <th>상품 금액</th>
                    <td><fmt:formatNumber value="${originalPrice }" pattern="##,###,###"/> 원</td>
                </tr>

                <tr class="tb-hr">
                    <th>
                        <hr class="tb-line" />
                    </th>
                    <td>
                        <hr class="tb-line" />
                    </td>
                </tr>

                <tr class="bill-tb__col">
                    <th>상품할인금액</th>
                    <td>- <fmt:formatNumber value="${totalDCPrice }" pattern="##,###,###"/> 원</td>
                </tr>
                <tr class="bill-tb__col">
                    <th>배송비</th>
                    <td><fmt:formatNumber value="${orderDetails.DPRICE }" pattern="##,###,###"/> 원</td>
                </tr>
                <!-- <tr class="bill-tb__col">
                    <th>쿠폰사용</th>
                    <td>0 원</td>
                </tr> -->
                <tr class="bill-tb__col">
                    <th>적립금사용</th>
                    <td><fmt:formatNumber value="${orderDetails.POINTUSE }" pattern="##,###,###"/> 원</td>
                </tr>

                <tr class="tb-hr">
                    <th>
                        <hr class="tb-line" />
                    </th>
                    <td>
                        <hr class="tb-line" />
                    </td>
                </tr>

                <tr class="bill-tb__total-price">
                    <th>최종결제금액</th>
                    <td><fmt:formatNumber value="${orderDetails.FPRICE }" pattern="##,###,###"/> 원</td>  
                </tr>

                <tr class="bill-tb__earn-point">
                    <td colspan="2">            
                        <span>이 구매로 <fmt:formatNumber value="${orderDetails.POINTADD}" pattern="##,###,###"/> 원 적립</span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
	$('#order-state-${orderDetails.STATUS}').addClass('current-state');
});
</script>
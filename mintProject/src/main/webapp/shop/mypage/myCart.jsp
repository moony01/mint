<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .cart th, .cart td{vertical-align: middle;}
    
</style>

<div class="wrap cart">
    <div class="my-cart__header">
        <div class="my-cart__tit">장바구니</div>
        <div class="my-cart__sub-tit">주문하실 상품명 및 수량을 정확하게 확인해 주세요. </div>
    </div>
    <div class="cart-goods">
        <table class="cart-tb">
            <tr class="cart-tb__header">
                <th>
                    <label for="" class="allCheck"> <!-- check-label onclick="total_calcul()"-->
                        <input type="checkbox" class="check-box allCheck" name="" id="" checked>
                    </label>
                </th>
                <th id="thSelect">전체선택 (<span class="prd_count">0</span>/<span class="prd_total_count">0</span>)</th>
                <th id="thInfo">상품 정보</th>
				<th id="thCount">수량</th>
				<th id="thCost">상품금액</th>

            </tr>
			
			<!-- DB에서 cart 데이터 불러오는 곳 -->
			<tbody class="viewGoods">
				
			</tbody>
			
            <!-- <tr class="cart-tb__item">
                <td class="cart-tb__check">
                    ë¼ë²¨ í´ë¦­íë©´ í´ëì¤ checkedë¥¼ ì¤ì¼íê³  ëìì ë¼ë²¨ì ìëcheck-box(input checkbox)ë
                    chceked = true í´ì¤ì¼í¨
                    <label for="" class="check-label">
                        <input type="checkbox" class="check-box" name="" id="">
                    </label>
                </td>
                <td class="cart-tb__thumb">
                    <img src="https://img-cf.kurly.com/shop/data/goods/1573785305699i0.jpg" alt="">
                </td>
                <td class="cart-tb__desc">
                    <div class="cart-tb__name">신선 사과</div>
                    <div class="cart-tb__price">
                        <span class="cart-tb__num">4,200원</span>
                    </div>
                </td>
                <td class="cart-tb__count">
                    <span class="goods-count">
                        <button class="minus"></button>
                        <input type="text" value="1" class="qty" readonly>
                        <button class="plus"></button>
                    </span>
                </td>
                <td class="cart-tb__total">8,400원</td>
            </tr> -->

        </table>
        <div class="cart-goods__btns">
            <button class="cart-goods__btn-del">
               선택 삭제
            </button>
            <button class="cart-goods__btn-sold">
               품절 상품 삭제
            </button>
        </div>

        <div class="cart-amount">
            <div class="cart-amount__item">
                <div class="cart-amount__tit">상품 금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = jsì© -->
                    <span id="amountPrice">80,400</span> 원
                </div>
            </div>
            <div class="cart-amount__deco deco-minus">
                -
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">상품 할인금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = jsì© -->
                    -<span id="amountSale">80,400</span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                +
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">배송비</div>
                <div class="cart-amount__price">
                    <!-- amountNum = jsì© -->
                    <span id="amountCourier">0</span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                =
            </div>
            <div class="cart-amount__item amount-total">
                <div class="cart-amount__tit">결제예정금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = jsì© -->
                    <span id="amountTotal">73,200</span> 원
                </div>
            </div>
        </div>
        <button class="cart-goods__btn-write">
           주문하기
        </button>
    </div>
</div>


<script type="text/javascript" src="/mintProject/shop/js/cart.js"></script>
<script type="text/javascript">


//데이터 전송
/* document.getElementById('placeAnOrder').onclick = function(){

}; */
</script>

<div class="wrap">
    <div class="my-cart__header">
        <div class="my-cart__tit">장바구니</div>
        <div class="my-cart__sub-tit">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</div>
    </div>
    <div class="cart-goods">
        <table class="cart-tb">
            <tr class="cart-tb__header">
                <th>
                    <label for="" class="check-label" id="checkAll">
                        <input type="checkbox" class="check-box" name="" id="">
                    </label>
                </th>
                <th>전체 선택</th>
                <th>상품 정보</th>
                <th>수량</th>
                <th>상품금액</th>
            </tr>

            <tr class="cart-tb__item">
                <td class="cart-tb__check">
                    <!-- 라벨 클릭하면 클래스 checked를 줘야하고 동시에 라벨에 있는check-box(input checkbox)도
                    chceked = true 해줘야함 -->
                    <label for="" class="check-label">
                        <input type="checkbox" class="check-box" name="" id="">
                    </label>
                </td>
                <td class="cart-tb__thumb">
                    <img src="https://img-cf.kurly.com/shop/data/goods/1573785305699i0.jpg" alt="">
                </td>
                <td class="cart-tb__desc">
                    <div class="cart-tb__name">[파스키에] 크로아상</div>
                    <div class="cart-tb__price">
                        <span class="cart-tb__num">4,200 원</span>
                    </div>
                </td>
                <td class="cart-tb__count">
                    <span class="goods-count">
                        <button class="minus"></button>
                        <input type="text" value="1" class="qty" readonly>
                        <button class="plus"></button>
                    </span>
                </td>
                <td class="cart-tb__total">8,400원</td>
            </tr>

            <tr class="cart-tb__item">
                <td class="cart-tb__check">
                    <label for="" class="check-label">
                        <input type="checkbox" class="check-box" name="" id="">
                    </label>
                </td>
                <td class="cart-tb__thumb">
                    <img src="https://img-cf.kurly.com/shop/data/goods/152930980935i0.jpg" alt="">
                </td>
                <td class="cart-tb__desc">
                    <div class="cart-tb__name">[사미헌] 감자탕</div>
                    <div class="cart-tb__price">
                        <span class="cart-tb__num">9,900 원</span>
                        <span class="cart-tb__cost">11,000 원</span>
                    </div>
                </td>
                <td class="cart-tb__count">
                    <span class="goods-count">
                        <button class="minus"></button>
                        <input type="text" value="1" class="qty" readonly>
                        <button class="plus"></button>
                    </span>
                </td>
                <td class="cart-tb__total">8,400원</td>
            </tr>
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
                    <!-- amountNum = js용 -->
                    <span id="amountPrice">80,400</span> 원
                </div>
            </div>
            <div class="cart-amount__deco deco-minus">
                -
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">상품할인금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = js용 -->
                    -<span id="amountSale">80,400</span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                +
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">배송비</div>
                <div class="cart-amount__price">
                    <!-- amountNum = js용 -->
                    <span id="amountCourier">0</span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                =
            </div>
            <div class="cart-amount__item amount-total">
                <div class="cart-amount__tit">결제예정금액</div>
                <div class="cart-amount__price">
                    <!-- amountNum = js용 -->
                    <span id="amountTotal">73,200</span> 원
                </div>
            </div>
        </div>
        <button class="cart-goods__btn-write">
            주문하기
        </button>
    </div>
</div>
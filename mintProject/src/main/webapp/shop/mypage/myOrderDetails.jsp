<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="wrap">
    <div class="my-cart__header">
        <div class="my-cart__tit">주문 내역</div>
    </div>
    <div class="order-state">
        <div class="order-state__state">입금전</div>
        <div class="order-state__arrow">
            <i class="fas fa-arrow-right"></i>
        </div>
        <div class="order-state__state">배송준비</div>
        <div class="order-state__arrow">
            <i class="fas fa-arrow-right"></i>
        </div>
        <div class="order-state__state current-state">배송중</div>
        <div class="order-state__arrow">
            <i class="fas fa-arrow-right"></i>
        </div>
        <div class="order-state__state">배송완료</div>
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
            <tr class="order-tb__item">
                <td class="order-tb__thumb">
                    <img
                        src="//img-cf.kurly.com/shop/data/goods/1529309809590s0.jpg"
                        alt=""
                    />
                </td>
                <td class="order-tb__desc">
                    <div class="order-tb__name">[사미헌] 감자탕</div>
                    <div class="order-tb__price">
                        <span class="order-tb__num">1개 / 개 당 9,900 원</span>
                    </div>
                </td>
                <td class="order-tb__total">8,400원</td>
            </tr>
            <tr class="order-tb__item">
                <td class="order-tb__thumb">
                    <img
                        src="//img-cf.kurly.com/shop/data/goods/1574400021312s0.jpg"
                        alt=""
                    />
                </td>
                <td class="order-tb__desc">
                    <div class="order-tb__name">[사미헌] 감자탕</div>
                    <div class="order-tb__price">
                        <span class="order-tb__num">1개 / 개 당 9,900 원</span>
                    </div>
                </td>
                <td class="order-tb__total">8,400원</td>
            </tr>
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
                        value="김덕배"
                        readonly
                        class="read-only"
                    />
                </td>
            </tr>
            <tr class="info-tb__phone">
                <th class="size-2">휴대폰 *</th>
                <td class="size-10">
                    <input type="text" value="010" readonly class="read-only" />
                    <input
                        type="text"
                        value="1234"
                        readonly
                        class="read-only"
                    />
                    <input
                        type="text"
                        value="4567"
                        readonly
                        class="read-only"
                    />
                </td>
            </tr>
            <tr class="info-tb__email">
                <th class="size-2">이메일 *</th>
                <td class="size-10">
                    <input
                        type="text"
                        value="gamja123@naver.com"
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
                                value="충남 당진시 합덕읍 감자마을1길 12 [31812]"
                                readonly
                            />
                            <input
                                type="text"
                                class="shipping-tb__addr2"
                                id="addr2"
                                value="감자 아파트 104동 102호"
                            />
                            <button
                                class="shipping-tb__search"
                                id="addrSearchBtn"
                            >
                                우편번호 찾기
                            </button>
                        </td>
                    </tr>
                    <tr class="shipping-tb__name">
                        <th class="size-2">수령인 이름 *</th>
                        <td class="size-10">
                            <input type="text" value="김덕배" />
                        </td>
                    </tr>
                    <tr class="shipping-tb__phone">
                        <th class="size-2">휴대폰 *</th>
                        <td class="size-10">
                            <input type="text" value="010" maxlength="4" />
                            <input type="text" value="1234" maxlength="4" />
                            <input type="text" value="4567" maxlength="4" />
                        </td>
                    </tr>
                    <tr class="shipping-tb__ask">
                        <th class="size-2">배송 요청사항</th>
                        <td class="size-10">
                            <textarea
                                name=""
                                id=""
                                class="shipping-tb__textarea"
                                maxlength="50"
                            ></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="title2">
                <h2>쿠폰 / 적립금</h2>
            </div>
            <div class="cart-goods">
                <table class="point-tb">
                    <tr>
                        <th class="size-2">쿠폰 적용</th>
                        <td class="size-10">
                            <span>사용 가능한 쿠폰이 없습니다</span>
                        </td>
                    </tr>
                    <tr>
                        <th class="size-2">적립금 적용</th>
                        <td class="size-10">
                            <div class="pont-tb__point">
                                <input
                                    type="text"
                                    value="0"
                                    class="point-tb__input"
                                />원
                                <label
                                    for=""
                                    class="check-label point-tb__checkbox"
                                >
                                    <input
                                        type="checkbox"
                                        class="check-box"
                                        name=""
                                        id=""
                                    />
                                </label>
                                <span>모두사용</span>
                            </div>
                            <div class="point-tb__having-point">
                                <span>보유 적립금 : 6,616원</span>
                            </div>
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
                    <td>34,000 원</td>
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
                    <td>- 2,200 원</td>
                </tr>
                <tr class="bill-tb__col">
                    <th>배송비</th>
                    <td>0 원</td>
                </tr>
                <tr class="bill-tb__col">
                    <th>쿠폰사용</th>
                    <td>0 원</td>
                </tr>
                <tr class="bill-tb__col">
                    <th>적립금사용</th>
                    <td>0 원</td>
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
                    <td>31,800 원</td>
                </tr>

                <tr class="bill-tb__earn-point">
                    <td colspan="2">
                        <span>구매 시 1,590 원 (5%) 적립예정</span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <button class="myorder-writeBtn">결제하기</button>
</div>

<script>
$(document).ready(function(){
	console.log(`${list}`);
});
</script>
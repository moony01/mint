<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<seciton class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
           <li class="snb__item"><a href="/mintProject/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item current"><a href="/mintProject/shop/service/qna">1:1 문의</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/offer">상품 제안</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">1:1문의</h2>
        <form id="offerWriteForm" enctype="multipart/form-data">
            <div class="board-write">
                <div class="board-write__subject">
                    <div class="board-write__title">제목</div>
                    <div class="board-write__subject-inputs">
                            <select name="" id="" class="board-write__subject-select">
                                <option value="">선택해주세요.</option>
                                <option value="">배송지연/불만</option>
                                <option value="">반품문의</option>
                                <option value="">A/S문의</option>
                                <option value="">환불문의</option>
                                <option value="">주문결제문의</option>
                                <option value="">회원정보문의</option>
                                <option value="">취소문의</option>
                                <option value="">교환문의</option>
                                <option value="">상품정보문의</option>
                                <option value="">기타</option>
                            </select>
                            <input type="text" class="board-write__subject-txt">
                    </div>
                </div>
                <div class="board-write__order-num">
                    <div class="board-write__title">주문 번호</div>
                    <div class="board-write__order-inputs">
                        <div class="orders">
                            <span>문의하실 주문번호를 선택하세요</span>
                            <table>
                                <tr>
                                    <th class="size-2">주문번호</th>
                                    <th class="size-2">주문일자</th>
                                    <th class="size-4">상품명</th>
                                    <th class="size-2">수량</th>
                                    <th class="size-2">주문금액</th>
                                </tr>
                                <!-- 예시 -->
                                <tr class="orders__list">
                                    <td>20191212313</td>
                                    <td>2019-33-29</td>
                                    <td>만냥</td>
                                    <td>23</td>
                                    <td>13</td>
                                </tr>
                                <tr class="orders__list">
                                    <td>2017141414</td>
                                    <td>스걸</td>
                                    <td>만냥</td>
                                    <td>23</td>
                                    <td>13</td>
                                </tr>
                                <tr class="orders__list">
                                    <td>안녕</td>
                                    <td>스걸</td>
                                    <td>만냥</td>
                                    <td>23</td>
                                    <td>13</td>
                                </tr>
                                <!-- 여기까지 예시임 -->

                            </table>
                            <img src="https://www.kurly.com/shop/data/skin/designgj/img/common/popup_close.gif" class="orders-close">
                        </div>
                        <input type="text" class="board-write__order-txt" id="orderTxt" readonly>
                        <input type="button" value="주문조회" class="board-write__order-btn" id="orderBtn">
                    </div>
                </div>
                <div class="board-write__content">
                    <div class="board-write__title">내용</div>
                    <textarea name="content" id="content"></textarea>
                </div>
                <div class="board-write__upload">
                    <div class="board-write__title">이미지</div>
                    <div class="board-write__file">
                        <input type="file" name="" id="">
                    </div>
                </div>
            </div>
            <div class="board-write__write-btn">등록</div>
            
        </form>
    </div>
</seciton>
<script src="/mintProject/shop/js/qnaWrite.js"></script>
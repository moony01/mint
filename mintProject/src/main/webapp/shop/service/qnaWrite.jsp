<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<seciton class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item current"><a href="/shop/service/qna">1:1 문의</a></li>
            <li class="snb__item"><a href="/shop/service/offer">상품 제안</a></li>
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
                        <input type="text" class="board-write__order-txt">
                        <input type="button" value="주문조회" class="board-write__order-btn">
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
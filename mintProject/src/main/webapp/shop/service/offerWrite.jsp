<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<seciton class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item"><a href="/shop/service/qna">1:1 문의</a></li>
            <li class="snb__item current"><a href="/shop/service/offer">상품 제안</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">상품 제안</h2>
        <ul class="service__manual">
            <li>
                <p class="txt">마켓컬리에서 추가적으로 판매되면 좋을 상품을 제안해주세요.</p>
            </li>
            <li>
                <p class="txt">고객님의 의견을 발 빠르게 반영하여 더욱 편리한 마켓컬리가 되겠습니다.</p>
            </li>
            <li>
                <p class="txt">주의)알콜 제품은 법령상 온라인 판매가 불가하오니, 이 점 참고하여 작성부탁드립니다.</p>
            </li>
            <li>
                <p class="txt">담당 MD가 제안해주신 의견을 실시간으로 모니터링할 예정이나, 별도 답변 안내는 되지 않음을 양해부탁드립니다.</p>
            </li>
        </ul>
        <form id="offerWriteForm" enctype="multipart/form-data">
            <div class="board-write">
                <div class="board-write__subject">
                    <div class="board-write__title">제목</div>
                    <div class="board-write__subject-inputs">
                            <select name="" id="" class="board-write__subject-select">
                                <option value="">선택</option>
                                <option value="">신선제품</option>
                                <option value="">정육/달걀</option>
                                <option value="">양념/반찬</option>
                                <option value="">Home Dining</option>
                                <option value="">Deli/Bakery</option>
                                <option value="">Daily+</option>
                                <option value="">기타</option>
                            </select>
                            <input type="text" class="board-write__subject-txt">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<section class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/mintProject/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item"><a href="/mintProject/qnaboard/getQnaBoardList">1:1 문의</a></li>
            <li class="snb__item current"><a href="/mintProject/shop/service/offer">상품 제안</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">상품 제안</h2>
        <ul class="service__manual">
            <li>
                <p class="txt">MINT에서 추가적으로 판매되면 좋을 상품을 제안해주세요.</p>
            </li>
            <li>
                <p class="txt">고객님의 의견을 발 빠르게 반영하여 더욱 편리한 MINT가 되겠습니다.</p>
            </li>
            <li>
                <p class="txt">주의)알콜 제품은 법령상 온라인 판매가 불가하오니, 이 점 참고하여 작성부탁드립니다.</p>
            </li>
            <li>
                <p class="txt">담당 MD가 제안해주신 의견을 실시간으로 모니터링할 예정이며, 내부 회의를 거쳐 상품 입점 여부가 결정되므로 답변 안내는 지연될 수 있음을 양해 부탁 드립니다.</p>
            </li>
        </ul>
        <form id="offerWriteForm" enctype="multipart/form-data">
            <input type="hidden" name="viewSeq" value="${seq }">
            <input type="hidden" name="pg" value="${pg }">
            <div class="board-write">
                <div class="board-write__subject">
                    <div class="board-write__title">제목*</div>
                    <div class="board-write__subject-inputs">
                            <select name="category" id="" class="board-write__subject-select">
                                <option value="선택">선택</option>
                                <option value="농산물">농산물</option>
                                <option value="수산물">수산물</option>
                                <option value="축산물">축산물</option>
                                <option value="일반식품">일반식품</option>
                                <option value="반찬류">반찬류</option>
                                <option value="기타">기타</option>
                            </select> 
                            <div class="div-offer-category"></div>
                            <input type="text" name="subject" class="board-write__subject-txt">
                            <div class="div-offer-subject"></div>
                    </div>
                </div>
                <div class="board-write__content">
                    <div class="board-write__title">내용*</div>
                    <textarea name="content" id="content"></textarea>
                    <div class="div-offer-content"></div>
                </div>
                <div class="board-write__upload">
                    <div class="board-write__title">이미지</div>
                    <div class="board-write__file">
                        <input type="file" name="img" id="img" style="display: inline-block;">
                        <div id="viewImg" style="display:inline-block; float: right;"></div>
                    </div>
                </div>
            </div>
            <div class="board-write__write-btn">등록</div>
            
        </form>
    </div>
</section>
<script src='/mintProject/shop/js/offer.js'></script>
<script>
let suggestBoardDTO = `${suggestBoardDTO}`;
let options = document.querySelector(".board-write__subject-select");
let subject = `${suggestBoardDTO.subject}`;
let category = `${suggestBoardDTO.category}`;
let content = `${suggestBoardDTO.content}`;
let imgName = `${suggestBoardDTO.imgName}`;

getOfferBoardView();
</script>
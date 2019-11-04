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
        <table class="tb tb-qna">
            <tr>
                <th class="size-1">번호</th>
                <th class="size-2">카테고리</th>
                <th class="size-6">제목</th>
                <th class="size-2">작성일</th>
                <th class="size-1">상태</th>
            </tr>
            <tr class="tb-content">
                <td>공지</td>
                <td>안녕</td>
                <td>김치</td>
                <td>2019-11-22</td>
                <td>대기중</td>
            </tr>
            <tr class="tb-content">
                <td>공지</td>
                <td>안녕</td>
                <td>김치</td>
                <td>2019-11-22</td>
                <td>대기중</td>
            </tr>
        </table> 
        <div class="paging">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#"><</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
            </ul>
        </div>
        <div class="service__write-btn">글쓰기</div>
    </div>
</seciton>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        <h2 class="service__main-title">1:1문의
        </h2>
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
        <div class="service__write-btn clearfix">글쓰기</div>
    </div>
</seciton>
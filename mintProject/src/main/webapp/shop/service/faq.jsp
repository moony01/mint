<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- FAQ페이지 접속용 hidden pg -->
<input type="hidden" name="pg" id="pg" value="${pg }">
<section class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/mintProject/shop/service/notice">공지사항</a></li>
            <li class="snb__item current"><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item"><a href="/mintProject/qnaboard/getQnaBoardList">1:1 문의</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/offer">상품 제안</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">자주하는 질문
            <span class="title_sub">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
        </h2>
		<form id="faqBoardForm">
	        <select name="category" id="categorySelect" class="select-box">
	            <option value="9">선택</option>
	            <option value="0">회원 문의</option>
	            <option value="1">주문/결제</option>
	            <option value="2">취소/교환/반품</option>
	            <option value="3">배송 문의</option>
	            <option value="4">쿠폰/적립금</option>
	            <option value="5">서비스 이용 및 기타</option>
	        </select>
	        <table class="tb tb-fqa">
	            <tr>
	                <th class="size-1">번호</th>
	                <th class="size-2">카테고리</th>
	                <th class="size-9">제목</th>
	            </tr>
	            <%-- ajax로 게시물 들어가는 곳 --%>
	        </table>
	        <div class="paging">
	            <ul class="pagination">
				<%-- 페이징 처리 들어가는 곳 --%>
	            </ul>  	
	        </div>
	        <div class="service__search">
	        	<input type="hidden" name="pg" value="${pg}">
	            <div class="service__sel-box">
	            </div>
	            <div class="service__serch-box">
	                <input type="text" name="keyword" id="searchTerm">
	                <div id="searchButton" class="service__seach-btn">
	                    <i class="fas fa-search"></i>
	                </div>
	            </div>
	        </div>
		</form>
    </div>
</section>
<script type="text/javascript" src="/mintProject/shop/js/faq.js"></script>
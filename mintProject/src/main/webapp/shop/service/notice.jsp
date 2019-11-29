<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item current"><a href="/mintProject/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item"><a href="/mintProject/qnaboard/getQnaBoardList">1:1 문의</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/offer">상품 제안</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">공지사항
            <span class="title_sub">민트의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
        </h2>
        <table class="tb tb-notice" width="100%" cellpadding="0" cellspacing="0">
        	<colgroup>
        		<col width="50">
        		<col style="padding-left: 10px; text-align: left;">
        		<col width="100">
        		<col width="100">
        		<col width="30">
        	</colgroup>
            <tr>
                <th class="size-1">번호</th>
                <th class="size-6">제목</th>
                <th class="size-2">작성자</th>
                <th class="size-2">작성일</th>
                <th class="size-1">조회수</th>
            </tr>
            <c:if test="${list != null}">
            	<c:forEach var="noticeBoardDTO" items="${list }">
            		<tr class="tb-content">
            			<td>${noticeBoardDTO.seq }</td>
            			<td><a href="javascript:void(0)" id="${noticeBoardDTO.seq }" class="sub_click_view">${noticeBoardDTO.subject }</a></td>
            			<td>${noticeBoardDTO.id }</td>
            			<td>${noticeBoardDTO.logtime }</td>
            			<td>${noticeBoardDTO.hit }</td>
            		</tr>
            	</c:forEach>
            </c:if>
        </table> 
        <div class="paging">
            <ul class="pagination">
                ${noticeBoardPaging.pagingHTML }
            </ul>
        </div>
        
        <form id="noticeBoardSearchForm">
        	<input type="hidden" name="pg" value="${pg }">
        	<div class="service__search">
	            <div class="service__sel-box">
	                <span>검색어</span>
	                <input type="checkbox" name="check" id="chkName" value="id">
	                <span>이름</span>
	                <input type="checkbox" name="check" id="chkSub" value="subject" checked>
	                <span>제목</span>
	                <input type="checkbox" name="check" id="chkContent" value="content">
	                <span>내용</span>
	            </div>
	            <div class="service__serch-box">
	                <input type="text" name="keyword" value="${keyword }">
	                <div id="noticeSearchBtn" class="service__seach-btn">
	                    <i class="fas fa-search si"></i>
	                </div>
	            </div>
	    	</div>
        </form>

    </div>
</section>
<script type="text/javascript" src="/mintProject/shop/js/notice.js"></script>
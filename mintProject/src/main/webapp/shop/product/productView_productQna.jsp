<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/mintProject/shop/css/productView.css">
<ul class="goods-detail__tab">
                <li><a href="#description">상품설명</a></li>
                <li><a href="#image">상품이미지</a></li>
                <li><a href="#info">상세정보</a></li>
                <li><a href="#review" class="review_cnt"></a></li>
                <li><a href="#qna" class="qna_cnt"></a></li>
            </ul>
            <div class="reivew__view-hedaer">
                <div class="reivew__view-title">상품 문의</div>
                <div class="review__view-btns">
                    <div class="review__write-btn" id="qna_write_btn">상품문의</div>
                </div>
            </div>
<input type="hidden" id="pg_qna" value="${pg }">
<input type="hidden" id="totalArticle" value="${totalArticle }">
<input type="hidden" id="addr" value="${addr }">
<table class="qna-tb">
<tr class="qna-tb__head">
    <th class="size-1">번호</th>
    <th class="size-1">답변상태</th>
    <th class="size-7">제목</th>
    <th class="size-1">작성자</th>
    <th class="size-1">작성일</th>
</tr>
<c:if test="${list != null }">
<c:forEach var="data" items="${list }">
<tr class="qna-tb__view">
    <td>${totalArticle - data.RN + 1}</td>
    <td><c:if test="${data.REPLYSTATUS == '0' }">답변대기</c:if><c:if test="${data.REPLYSTATUS == '1' }">답변완료</c:if></td>
    <td><c:if test="${data.SECRETSTATUS == '1' }"><i class="fas fa-lock"></i></c:if>${data.SUBJECT }</td>
    <td>${data.ID }</td>     
    <td>${data.LOGTIMEQ }</td>
</tr>
<tr class="qna-tb__content">
    <td colspan="5">${data.CONTENT }<c:if test="${data.REPLYSTATUS == '0' }">
    	<input type="button" style="display: inline-block; float: right; border: none; margin-left: 5px;" class="review__write-btn" value="삭제">
    	<input type="button" style="display: inline-block; float: right; border: none;" class="review__write-btn" value="수정" >
    	</c:if>
    </td>	
</tr>
<c:if test="${data.REPLYSTATUS == '1' }">
<tr class="qna-tb__answer">
    <td colspan="5"><pre style="overflow: auto; white-space: pre-line; word-break: break-all;">${data.REPLYCONTENT }</pre></td> 
</tr>
</c:if>
</c:forEach>
</c:if>
</table>
<div class="paging-wrap">
    <ul class="pagination qna" id="qna_pagination">
        <li class="page-item prev"></li>
        <li class="page-item next"></li>
    </ul>
</div>
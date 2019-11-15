<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<section class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/mintProject/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item current"><a href="/mintProject/qnaboard/getQnaBoardList">1:1 문의</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/offer">상품 제안</a></li>
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
			<c:if test="${list != null}">
				 <c:forEach var="list" items="${list}">
					 <tr class="tb-content">
	                	<td>${list.seq}</td>
	                	<c:choose>
							<c:when test="${list.category == '1'}"><td>배송지연/불만</td></c:when>
							<c:when test="${list.category == '2'}"><td>컬리패스(무료배송)</td></c:when>
							<c:when test="${list.category == '3'}"><td>반품문의</td></c:when>
							<c:when test="${list.category == '4'}"><td>A/S문의</td></c:when>
							<c:when test="${list.category == '5'}"><td>환불문의</td></c:when>
							<c:when test="${list.category == '6'}"><td>주문결제문의</td></c:when>
							<c:when test="${list.category == '7'}"><td>회원정보문의</td></c:when>
							<c:when test="${list.category == '8'}"><td>취소문의</td></c:when>
							<c:when test="${list.category == '9'}"><td>교환문의</td></c:when>
							<c:when test="${list.category == '10'}"><td>상품정보문의</td></c:when>
							<c:when test="${list.category == '11'}"><td>기타문의</td></c:when>
						</c:choose>
	                	<td>${list.subject}</td>
	                	<td><fmt:formatDate value="${list.logtimeQ}" pattern="yyyy-MM-dd"/></td>
	                 	<c:choose>
							<c:when test="${list.replyStatus == '0'}"><td>대기중</td></c:when>
							<c:when test="${list.replyStatus == '1'}"><td>작성완료</td></c:when>
	                	</c:choose> 
	            	</tr>
	            	<tr class="qna-view__conent">
                    	<td colspan="5">
                    		<c:if test="${list.fileName != null }">
                    			<img alt="" src="/mintProject/shop/storage/${list.fileName}" width="200px" height="250px"><br>
                    		</c:if>
                    		<pre><p>${list.content}</p></pre>
                    	
	                    	<c:if test="${list.replyStatus == 0 }">
	                    		<div style="display: flex;  flex-direction:row-reverse;" >
	                    			<input type="button" id="delBtn" value="삭제" onclick="qnaDelete(${list.seq})" style="background-color: white; border: 1px solid #45b8ac; align-content: center; line-height: 20px;">
	                    			<input type="button" id="updateBtn" value="수정" onclick="location.href='/mintProject/qnaboard/qnaBoardModifyForm?seq=${list.seq}'" style="background-color: white; border: 1px solid #45b8ac; align-content: center; line-height: 20px;"> 
	                    		</div>
	                    	</c:if>
                    	</td>
                	</tr>
                	<c:if test="${list.replyStatus == '1'}">
                		 <tr class="qna-view__answer">
                    		<td colspan="1" class="">Mint</td>
                    		<td colspan="4" class=""><p>${list.replyContent}</p></td>
                		</tr>
                	</c:if>
            	</c:forEach>
           </c:if> 
            
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
        <div class="service__write-btn clearfix" style="background-color: #45b8ac"  onclick="location.href='/mintProject/qnaboard/getQnaBoardWriteForm'">글쓰기</div>
    </div>
</section>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script src="/mintProject/shop/js/qna.js"></script>
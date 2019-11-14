<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      
<section class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/mintProject/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/qna">1:1 문의</a></li>
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
        <table class="tb tb-qna">
            <tr>
                <th class="size-1">번호</th>
                <th class="size-2">카테고리</th>
                <th class="size-6">제목</th>
                <th class="size-2">작성일</th>
                <th class="size-1">상태</th>
            </tr>       
               
            <c:forEach var="suggestBoardDTO" items="${list }" >
	           <tr class="tb-content">
	               <td>${suggestBoardDTO.seq }</td>
	               <td>${suggestBoardDTO.category }</td>
	               <td>${suggestBoardDTO.subject }</td>
	               <td><fmt:formatDate value="${suggestBoardDTO.logtimeQ }" pattern="yyyy.MM.dd"/></td>
	               <c:if test="${suggestBoardDTO.replyStatus == 0 }"><td>대기중</td></c:if>
	               <c:if test="${suggestBoardDTO.replyStatus == 1 }"><td>답변완료</td></c:if>    
	           </tr>
	           
	           <tr class="qna-view__conent"> 
	            	<td colspan="5">
                    	<c:if test="${suggestBoardDTO.imgName != null }">
                    		<img alt="" src="/mintProject/shop/storage/${suggestBoardDTO.imgName}" width="400px" height="300px"><br>
                    	</c:if>
                    	<pre><p>${suggestBoardDTO.content }</p></pre>
                    	<div style="display: flex;  flex-direction:row-reverse;" >
                    		<input type="button" class="btnDelete" value="삭제" style="background-color: white; border: 1px solid #795C90; align-content: center; line-height: 20px;">
                    		<input type="button" value="수정" style="background-color: white; border: 1px solid #795C90; align-content: center; line-height: 20px;"
                    		onclick="location.href='/mintProject/shop/service/offerModify?pg=${pg}&seq=${suggestBoardDTO.seq }'"> 
                    	</div>
                    </td>       	
	           </tr>   	
	           
	           <c:if test="${suggestBoardDTO.replyStatus == 1 }">
	           	<tr class="qna-view__answer">
		           	<td colspan="1" class="">Mint</td>
                    <td colspan="4" class=""><p>${suggestBoardDTO.replyContent }</p></td>
	           	</tr>	           
		       </c:if>
	               	
			</c:forEach>
            
        </table> 
        <div class="paging">
            <ul class="pagination">
               <li class="page-item prev"></li>
               <li class="page-item next"></li>
            </ul>
        </div>
        <div class="service__write-btn" onclick="location.href='/mintProject/shop/service/offerWrite'">글쓰기</div>
    </div>
</section>
<script>
let totalArticle = ${totalArticle};
let currentPage = ${pg};
let addr = '${addr}';

window.onload = function(){ paging(totalArticle, currentPage, addr);}

</script> 
<script src='/mintProject/shop/js/qna.js'></script>
<script src='/mintProject/shop/js/offer.js'></script>
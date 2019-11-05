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
            <c:forEach var="suggestBoardDTO" items="${list }" >
	           <tr class="tb-content">
	               <td>${suggestBoardDTO.seq }</td>
	               <td>${suggestBoardDTO.category }</td>
	               <td>${suggestBoardDTO.subject }</td>
	               <td><fmt:formatDate value="${suggestBoardDTO.logtimeQ }" pattern="yyyy.MM.dd"/></td>
	               <c:if test="${suggestBoardDTO.replyStatus == 0 }"><td>대기중</td></c:if>
	               <c:if test="${suggestBoardDTO.replyStatus == 1 }"><td>답변완료</td></c:if>    
	           </tr>
	           
	           <tr class="tb-view">
	            	<td	colspan="2">${suggestBoardDTO.content }</td>
	           </tr>   	
	           
	           <c:if test="${suggestBoardDTO.replyStatus == 1 }">
	           	<tr class="tb-view">
	               	<td colspan="1"><img src="https://www.kurly.com/shop/data/skin/designgj/img/common/faq_a.gif"></td>
	                <td colspan="2">${suggestBoardDTO.replyContent }</td>
					
	           	</tr>	           
		       </c:if>
	               	
			</c:forEach>
            
        </table> 
        <div class="paging">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#"><</a></li>
                <li class="page-item active"><a class="page-link before" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
            </ul>
        </div>
        <div class="service__write-btn" onclick="location.href='../service/offerWrite'">글쓰기</div>
    </div>
</section>
<script>
let totalArticle = ${totalArticle};
let currentPage = ${pg};
let pageBlock = 3;
let pageSize = 3;
let totalPage = (totalArticle+pageSize-1) / pageSize;
let startPage = (currentPage-1)/pageBlock * pageBlock +1; 
let endPage = startPage + pageBlock -1;
if(endPage > totalPage) endPage = totalPage;

if(startPage > pageBlock){
	$('.page-link before').attr('href', '/mintProject/shop/service/offer?pg='+(startPage-1));
	// 이전
}

for(i = startPage; i <= endPage ; i++) {
//	$('.page-link').attr('href', '/mintProject/shop/service/offer?pg='+i);
	//i			
}

if(endPage < totalPage) $('.page-link').attr('href', '/mintProject/shop/service/offer?pg='+ (endPage+1));
// +"'> 다음 </a> ]



</script>
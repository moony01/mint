<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main__title">
    <h2 class="out">상품제안 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="">>상품제안 관리</a>
    <span class="ar-title">></span>
    <a href="" class="now-title">게시판 답변</a>                
</div>
<div class="container">
	
    <table class="table table-bordered write-tb">
        <tr>
            <th>카테고리</th>
            <td colspan="3" class="table--left">${suggestBoardDTO.category }</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3" class="table--left">${suggestBoardDTO.subject }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${suggestBoardDTO.id }</td>
            <th>작성일</th>
            <td><fmt:formatDate value="${suggestBoardDTO.logtimeQ }" pattern="yyyy.MM.dd"/></td>
        </tr>
        <tr class="write-tb__content">
            <th>내용</th>
            <td colspan="3" class="table--left">
                <pre>${suggestBoardDTO.content }</pre>
            </td>
        </tr>
	        <tr class="write-tb__answer">
      	 	 <form name="offerAnswerForm">
	       	 	<input type="hidden" id="seq" name="seq" value="${seq }"/>
	            <th>답변</th>
	            <td colspan="3" class="table--left">
	            	<c:if test="${suggestBoardDTO.replyStatus == '0' }">
	            		<textarea name="replyContent" id="summernote"></textarea>
	            	</c:if>
	            	<c:if test="${suggestBoardDTO.replyStatus == '1' }">
	           		 	${suggestBoardDTO.replyContent}
	            	</c:if>
	            </td>
      	 	 </form>
	        </tr>
    </table>
    <div class="write-tb__btns">
    	<c:if test="${suggestBoardDTO.replyStatus == '0' }">
       	 <button type="button" class="btn btn-primary btn-lg btn-reply">답변하기</button>
        </c:if>
        <button type="button" class="btn btn-success btn-lg btn-list" onclick="location.href='/mintProject/admin/service/offer'">목록으로</button>
    </div>   
</div>
<script src="/mintProject/admin/js/offer.js"></script>
<script>
    $(document).ready(function(){
        $('#summernote').summernote({
            placeholder:"내용을 입력해주세요",
            height: 450,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true   
        });
    });
</script>
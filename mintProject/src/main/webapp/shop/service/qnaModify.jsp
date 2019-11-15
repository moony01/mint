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
        <h2 class="service__main-title">1:1문의</h2>
        <form id="offerModifyForm" name="offerWriteForm" method="post" enctype="multipart/form-data" action="/mintProject/qnaboard/qnaBoardModify">
        <input type="hidden" name="seq" value="${qnaBoardDTO.seq}">
            <div class="board-write">
                <div class="board-write__subject">
                    <div class="board-write__title">제목</div>
                    <div class="board-write__subject-inputs">
	                    <select name="category" id="category" class="board-write__subject-select" >
	                        <option value="1">배송지연/불만</option>
	                        <option value="2">컬리패스(무료배송)</option>
	                        <option value="3">반품문의</option>
	                        <option value="4">A/S문의</option>
	                        <option value="5">환불문의</option>
	                        <option value="6">주문결제문의</option>
	                        <option value="7">회원정보문의</option>
	                        <option value="8">취소문의</option>
	                        <option value="9">교환문의</option>
	                        <option value="10">상품정보문의</option>
	                        <option value="11">기타</option>
	                    </select>
                            <input type="text" class="board-write__subject-txt" name="subject" value="${qnaBoardDTO.subject}">
                    </div>
                </div>
                <div class="board-write__order-num">
                    <div class="board-write__title">주문 번호</div>
                    <div class="board-write__order-inputs">
                        <div class="orders">
                            <span>문의하실 주문번호를 선택하세요</span>
                            <table>
                                <tr>
                                    <th class="size-2">주문번호</th>
                                    <th class="size-2">주문일자</th>
                                    <th class="size-4">상품명</th>
                                    <th class="size-2">수량</th>
                                    <th class="size-2">주문금액</th>
                                </tr>
                                <!-- 예시 -->
                                <c:if test="${list != null}">
                                	 <c:forEach var="list" items="${list}">
										 <tr class="orders__list">
                                    		<td>${list.orderNumber}</td>
                                    		<td>${list.logtime}</td>
                                    		<%-- <td><fmt:formatDate value="${list.logtime}" pattern="yyyy-MM-dd"/></td> --%>
                                    		<td>일단보류</td>
		                                    <td>${list.qty}</td>
		                                    <td>${list.price}</td>
		                                </tr>                                
                               		</c:forEach>
                                </c:if>
                            </table>
                            <img src="https://www.kurly.com/shop/data/skin/designgj/img/common/popup_close.gif" class="orders-close">
                        </div>
                        <input type="text" class="board-write__order-txt" id="orderTxt" name= "orderNumber" value="${qnaBoardDTO.orderNumber}" readonly="readonly">
                        <input type="button" value="주문조회" class="board-write__order-btn" style="background-color: #45b8ac" id="orderBtn">
                    </div>
                </div>
                <div class="board-write__content">
                    <div class="board-write__title">내용</div>
                    <textarea name="content" id="content">${qnaBoardDTO.content}</textarea>
                </div>
                <div class="board-write__upload">
                    <div class="board-write__title">이미지</div>
                    <div class="board-write__file">
                        <input type="file" name="img" id="img" >
            				<c:if test="${qnaBoardDTO.fileName != null}">
								저장된 파일명 : ${qnaBoardDTO.fileName}            				
            				</c:if>            
                    </div>
                </div>
            </div>
            <div class="board-modify__modify-btn">전송</div>
        </form>
    </div>
</section>
<script src="/mintProject/shop/js/qnaWrite.js"></script>
<script>
	const currnetCategory = ${qnaBoardDTO.category}-1;
	const category = document.querySelector("#category");
	console.dir(category);
	category[currnetCategory].selected = true;
	
	 $(".board-modify__modify-btn").click(function(){
	    	if($(".board-write__subject-txt").val() == ""){
	    		alert("제목을 입력하세요.");
	    		$(".board-write__subject-txt").focus();	
	    	}else if($("#content").val() == ""){
	    		alert("내용을 입력하세요.");
	    		$("#content").focus();
	    	}else{
	    		$("form[id=offerModifyForm]").submit();
	    	}
	    });
	
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
    
<section class="wrap">
	<c:if test="${list != null}">
   		<c:forEach var="list" items="${list}">
   			<div class="event__thumb">
   				<c:if test="${list.eventStatus == 1}">
	   				<!-- 이벤트 배너 이미지 클릭 시 상품 리스트 페이지로 이동 -->         
	               	<a href="/mintProject/goods/getEventProductList?gubun=3&seq=${list.seq}&pg=1">
	               		<img class="event-thumb" src="/mintProject/shop/storage/mint/event/${list.eventThumbnail}" alt="">
	               	</a>
               	</c:if>
   			</div>
   		</c:forEach>
    </c:if>
</section>

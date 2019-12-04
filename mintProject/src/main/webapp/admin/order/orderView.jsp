<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="main__title">
        <h2 class="out">주문 관리</h2>
       <a href="" class="pa-title"><i class="fas fa-money-check-alt"></i><span>주문 관리</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">주문 상세보기</a> 
    </div>
      
	    
		 <div class="container">	
		  	<h2 class="main__title">주문자 정보</h2>
	        <table class="table table-bordered table-member">
	            <tr class="th--dark">
	                <th class="col-md-3">아이디</th>
	                <td colspan="2">${list.get(0).ID }</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">주문자명 </th>
	                <td colspan="2">${list.get(0).NAME }</td>
	            </tr>
	            
	             <tr class="th--dark">
	                <th class="col-md-3">휴대폰</th>
	                <td colspan="2">${list.get(0).TEL }</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">주소</th>
	                <td colspan="2">${list.get(0).ADDR1 } ${list.get(0).ADDR2 }</td>
	            </tr>
	              
	            <tr class="th--dark">
	                <th class="col-md-3">주문날짜</th>
	                <td colspan="2">${list.get(0).LOGTIME }</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">배송 요청사항</th>
	                <td colspan="2">${list.get(0).REQUEST }</td>
	            </tr>
	        </table>
	      </div> 
	      
	      <div class="container">	
		  	<h2 class="main__title">주문 상세 내역</h2>
	        <table class="table table-bordered table-orderDetails">
	        	<tr class="th--dark">
	                <th class="col-md-3">상품</th>
	                <th class="col-md-4">상품명</th>
	                <th class="col-md-2">수량</th>
	                <th class="col-md-2">금액</th> 
	            </tr>
	            
	        	<c:forEach items="${list}" var="orderDetails">
		        	<tr class="th--dark">
		                <td colspan="1"><img src="/mintProject/shop/storage/mint/product/${orderDetails.THUMBNAIL }"  style="height: 200px;"></td>
		                <td colspan="1">${orderDetails.MAINSUBJECT }</td>
		                <td colspan="1">${orderDetails.QTY }</td>
		                <td colspan="1"><fmt:formatNumber value="${orderDetails.PRICE}" pattern="#,###"/>원</td>
		            </tr>
		            
		            <c:set var="originalPrice" value="${originalPrice + (orderDetails.PRICE * orderDetails.QTY) }"/>
		            <fmt:formatNumber var="discountRate" value="${orderDetails.DISCOUNTRATE}" pattern="#.##"/>
		            <c:set var="discount" value="${discountRate / 100 }"/>
		            <c:set var="discountPrice" value="${discountPrice + (orderDetails.QTY * (orderDetails.PRICE * discount))}"/>
	          	</c:forEach>
	        </table>
	      </div>
	      
	       <div class="container">	
		  	<h2 class="main__title">결제 내역</h2>
	        <table class="table table-bordered table-payment">
	        	<tr class="th--dark">
	                <th class="col-md-3">상품 금액</th>
	                <td colspan="1"> <fmt:formatNumber value="${originalPrice }" pattern="#,###"/>원</td> 
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">할인 금액</th>
	                <td colspan="1"><fmt:formatNumber value="${discountPrice }" pattern="#,###"/>원</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">적립금 사용</th>
		                <td colspan="1">
			                <c:if test="${list.get(0).POINTUSE != null }">
		                	<fmt:formatNumber value="${list.get(0).POINTUSE }" pattern="#,###"/>원
		                	</c:if>
		                	<c:if test="${list.get(0).POINTUSE == null }">
		                	0원
		                	</c:if>
	                	</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">배송비</th>
	                	<td colspan="1"><fmt:formatNumber value="${list.get(0).DPRICE }" pattern="#,###"/>원</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">총 결제 금액 </th>
	                <td colspan="1"><fmt:formatNumber value="${list.get(0).FPRICE}" pattern="#,###"/>원</td>
	            </tr>
	        </table>
	      </div>
	      
	    <div class="modal-footer">
	        <button type="button" class="btn btn-primary" 
	        	onclick="location.href='/mintProject/admin/sales/order'" style="margin-right : 85px;">목록으로</button>
	    </div>
	      
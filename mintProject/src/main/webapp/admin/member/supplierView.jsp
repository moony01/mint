<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="main__title">
        <h2 class="out">회원 관리</h2>
       <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>판매자 관리</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">판매자 상세보기</a> 
    </div>
		 <div class="container">	
	        <table class="table table-bordered table-member">
	            <tr class="th--dark">
	                <th class="col-md-1">사업자 번호</th>
	                <td colspan="2">${supplierDTO.supplierCode}</td>
	            </tr>
	            
	             <tr class="th--dark">
	                <th class="col-md-1">상호명</th>
	                <td colspan="2">${supplierDTO.id}</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-1">카테고리</th>
	                <td colspan="2">${supplierDTO.category}</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-1">연락처</th>
	                <td colspan="2">${supplierDTO.tel}</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-1">주소</th>
	                <td colspan="2">${supplierDTO.addr1} ${supplierDTO.addr2 }</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-1">상태</th>
	                <td colspan="2">${supplierDTO.status}</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th colspan="3" class="col-md-1" >판매중인 상품</th>
	            </tr>
	            <tr class="th--dark">
	                <th class="col-md-1" >상품코드</th>
	                <th class="col-md-1" >상품명</th>
	                <th class="col-md-1" >평균별점</th>
	            </tr>
	            
                <c:forEach items="${list }" var="product">
	                <tr class="th--dark">
	                	<td class="col-md-1">${product.productCode }</td>
	                	<td class="col-md-1">${product.mainSubject }</td>
	                	<td class="col-md-1">${product.star }</td>
                	</tr>
                </c:forEach>
	        </table>
		  </div> 
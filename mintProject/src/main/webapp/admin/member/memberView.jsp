<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="main__title">
        <h2 class="out">회원 관리</h2>
       <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>판매자 관리</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">회원 상세보기</a> 
    </div>
		 <div class="container">	
		  	<h2 class="main__title">회원 상세정보</h2>
	        <table class="table table-bordered table-member">
	            <tr class="th--dark">
	                <th class="col-md-3">회원명</th>
	                <td colspan="2">${memberDTO.name}</td>
	            </tr>
	            
	             <tr class="th--dark">
	                <th class="col-md-3">아이디</th>
	                <td colspan="2">${memberDTO.id}</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">연락처</th>
	                <td colspan="2">${memberDTO.tel}</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">주소</th>
	                <td colspan="2">${memberDTO.addr1} ${memberDTO.addr2 }</td>
	            </tr>
	            
	            <tr class="th--dark">
	                <th class="col-md-3">회원등급</th>
	                <c:if test="${memberDTO.memLevel == '0'}"><td colspan="2">일반</td></c:if>
	                <c:if test="${memberDTO.memLevel == '1'}"><td colspan="2">우수</td></c:if>
	                <c:if test="${memberDTO.memLevel == '2'}"><td colspan="2">최우수</td></c:if>
	                <c:if test="${memberDTO.memLevel == '5'}"><td colspan="2">관리자</td></c:if>
	            </tr>
	            
	            
	            <tr class="th--dark">
	                <th class="col-md-3">포인트</th>
	                <td colspan="2">${memberDTO.point}</td>
	            </tr>
	            
	            
	            <tr class="th--dark">
	                <th class="col-md-3">가입일</th>
	                <td colspan="2"><fmt:formatDate value="${memberDTO.logtime}" pattern="YY/MM/dd"/></td>
	            </tr>
	           
	        </table>
	        </div> 
	    
	    <div class="modal-footer">
	        <button type="button" class="btn btn-primary" 
	        	onclick="location.href='/mintProject/admin/member/memberList'" style="margin-right : 93px;">목록으로</button>
	    </div>

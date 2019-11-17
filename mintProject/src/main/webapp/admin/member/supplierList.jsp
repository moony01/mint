<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="main__title">
        <h2 class="out">회원 관리</h2>
        <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>판매자 관리</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">판매자 목록</a>        
    </div>
    <form name="supplier">
	    <div class="container">
	        <div class="main__select" style="display:inline-block; justify-content: flex-start;">
	            <select name="" id="" class="select-box" onchange="getListByOption($(this))">
	                <option value="0">전체</option>
	                <option value="1">상호명 오름차순</option>
	                <option value="2">별점 내림차순</option>
	                <option value="3">상태</option>
	                <option value="4">계약일 내림차순</option>
	            </select>
	        </div>
	        
	        <div class="searches" style="float: right; display:flex; justify-content: flex-end;">
	            <input type="text" name="daterange">
	            <div class="search">
	                <input type="button" class="searchButton" onclick="getListBySearch($(this))">
	                <i class="fa fa-search"></i>
	            </div>
	        </div>
	        
	        <table class="table table-bordered table-member">
	            <tr class="th--dark">
	                <th class="col-md-1"><input type="checkbox" name="" id=""></th>
	                <th class="col-md-1">카테고리</th>
	                <th class="col-md-6">상호명</th>
	                <th class="col-md-1">평균 별점</th>
	                <th class="col-md-1">계약 시작일</th>
	                <th class="col-md-1">상태</th>
	            </tr>
	
	      		<!-- 여기에 컬럼 추가 -->
	    
	        </table>
	        <div class="paging">
	            <ul class="pagination">
	                  <li class="page-item prev"></li>
	                  <li class="page-item next"></li>
	            </ul>
	        </div>
	        <div class="main__btns">
	                <div class="searches">
	                	<label style="text-align: center;">상호명 검색</label> &emsp; 
	                	<input type="text" name="searchValue" placeholder="검색 해주세요">
	                    <div class="search">
	                        <input type="button" class="searchButton" onclick="getListBySearch($(this))">
	                            <i class="fa fa-search"></i>
	                        </input>
	                    </div>
	                </div>
	            <div>
	                <button type="button" class="btn btn-primary">상태 변경</button>
	            </div>
	        </div>
	    </div>
    </form>
    
<script src="/mintProject/admin/js/member.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
<script>
//date picker 적용
let from; 
let to; 

$(function() {
	  $('input[name="daterange"]').daterangepicker({
	   // opens: 'left',
		locale: {
	        format: 'YY/MM/DD'
	    }
	  }, function(start, end, label) {
		  from = start.format('YY/MM/DD');
		  to = end.format('YY/MM/DD');
	  });
});

</script>
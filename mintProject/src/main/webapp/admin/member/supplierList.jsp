<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.searches{
	float: right;
   display:flex;
   justify-content :flex-end;
   margin-bottom:15px;
}

.daterange-search-btn{
   cursor:pointer;
   display:flex;
   justify-content:center;
   align-items:center;
   background-color: black;
   color:white;
}
</style> 

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
	                <option value="3">상태</option>
	                <option value="4">계약일 내림차순</option>
	            </select>
	        </div>
	        
	        <div class="searches">
	            <input type="text" name="daterange" class="daterange-txt">
	            <div class="search">
	                <p class="searchButton daterange-search-btn" onclick="getListBySearch($(this))">
	                <i class="fa fa-search"></i>
	                </p>
	            </div>
	        </div>
	        
	        <table class="table table-bordered table-member">
	            <tr class="th--dark">
	                <th class="col-md-1"><input type="checkbox" class="checkbox-all"></th>
	                <th class="col-md-1">카테고리</th>
	                <th class="col-md-6">상호명</th>
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
	            <div>
	                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">상태 변경</button>
	            </div>
                <div class="searches">
                	<label style="text-align: center; vertical-align: middle;">상호명 검색</label> &emsp; 
                	<input type="text" name="searchValue" class="daterange-txt" placeholder="검색 해주세요">
                    <div class="search">
                        <p class="searchButton daterange-search-btn" onclick="getListBySearch($(this))">
                            <i class="fa fa-search"></i>
                        </p>
                    </div>
                </div>
	        </div>
	    </div>
    </form>
    
	<!-- Modal -->
	<form id="supplierUpdate">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h2 class="modal-title" id="exampleModalLabel">판매자 상태 변경</h2>
	       	  <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button> -->
	      </div>
	      <div class="modal-body">
	        	해당 판매자의 상태를 
	        	<select name="status" id="" class="select-box">
	        		<option value="0">판매중</option>
	        		<option value="1">판매중지</option>
	        		<option value="2">계약만료</option>
	        	</select>
	        	로 변경합니다. 
	        	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary btn-update">변경하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	</form>

<script src="/mintProject/admin/js/memberList.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
<script>
//date picker 적용
$(function() {
  $('input[name="daterange"]').daterangepicker({
	locale: {
        format: 'YY.MM.DD'
    }
  }, function(start, end, label) {
  });
});
</script>
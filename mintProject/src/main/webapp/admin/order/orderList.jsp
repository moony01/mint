<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.nonClick{color: grey;}
.nonClick:hover {color: grey;}

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
        <h2 class="out">주문 관리</h2>
        <a href="" class="pa-title"><i class="fas fa-money-check-alt"></i><span>주문 관리</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">주문 목록</a>        
    </div>
    <form name="order">
    	<input type="hidden" name="pg" value=${pg }>
	    <div class="container">
	        <div class="main__select" style="display:inline-block; justify-content: flex-start;">
	            <select name="" id="" class="select-box" onchange="getListByOption($(this))">
	                <option value="5">전체</option>
	                <option value="0">입금 전</option>
	                <option value="1">입금 완료</option>
	                <option value="2">배송 중</option>
	                <option value="3">배송 완료</option>
	                <option value="4">취소/환불</option>
	            </select>
	        </div>
	        
	        <div class="searches">
	            <input type="text" name="daterange" style="padding-left: 23px; width:150px;">
	            <div class="search">
	                <p class="searchButton daterange-search-btn" onclick="getListBySearch($(this))">
	                <i class="fa fa-search"></i>
	                </p>
	            </div>
	        </div>
	        
	        <table class="table table-bordered table-order">
	            <tr class="th--dark">
	                <th class="col-md-3">주문번호</th>
	                <th class="col-md-2">아이디</th>
	                <th class="col-md-2">주문일자</th>
	                <th class="col-md-2">상태</th>
	            </tr>
	
	           <!-- 여기에 컬럼 추가 -->
	    
	        </table>
	        <div class="paging">
	            <ul class="pagination">
	                  <li class="page-item prev"></li>
	                  <li class="page-item next"></li>
	            </ul>
	        </div>
	    </div>
	  
    </form>
<script src="/mintProject/admin/js/order.js"></script>   
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
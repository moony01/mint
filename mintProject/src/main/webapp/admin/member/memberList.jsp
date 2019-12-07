<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
    pageEncoding="UTF-8"%>
    
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
        <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>회원 관리</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">회원 목록</a>        
    </div>
    <form name="member">
	    <div class="container">
	        <div class="main__select" style="display:inline-block; justify-content: flex-start;">
	            <select name="" id="" class="select-box" onchange="getListByOption($(this))" style="width: 100.5px; ">
	                <option value="0">전체</option>
	                <option value="1">아이디 알파벳순</option>
	                <option value="2">회원레벨 내림차순</option>
	                <option value="3">수신동의(Y)</option>
	                <option value="4">가입일 최신순</option>
	            </select>
	        </div>
	        
	        <div class="searches">
	            <input type="text" name="daterange" class="daterange-txt" style="padding-left: 23px; width:150px;">
	            <div class="search">
	                <p class="searchButton daterange-search-btn" onclick="getListBySearch($(this))">
	                <i class="fa fa-search"></i>
	                </p>
	            </div>
	        </div>
	         
	        <table class="table table-bordered table-member">
	            <tr class="th--dark">
	                <th class="col-md-1"><input type="checkbox" class="checkbox-all"></th>
	                <th class="col-md-1">회원레벨</th>
	                <th class="col-md-4">아이디</th>
	                <th class="col-md-1">SMS 동의여부</th>
	                <th class="col-md-1">가입일</th>
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
	                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">포인트 지급</button>
	                
	            </div>
	        </div>
	    </div>
    </form>
    
    <!-- Modal -->
   
    <form id="memberUpdate">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h2 class="modal-title" id="exampleModalLabel">회원 포인트 지급</h2>
	       	  <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button> -->
	      </div>
	      <div class="modal-body">
	        	해당 회원에게 <input type="text" name="point" class="select-box">
	        	포인트를 지급합니다. 
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
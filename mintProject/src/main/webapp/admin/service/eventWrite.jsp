<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.subtitle{
	display: block;
	height: 50px;
	font-size: 1.5em;
}
.thumb{
	max-width:70px;
	max-height:80px;
}
.date-button{
	width: 22px;
    height: 22px;
    border: 1px solid #333;
    background: #333;
    text-align: center;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    font-size: 13px;
}

.center_button{
	text-align: center;
	padding-bottom: 30px;
}


.table td, .table th{
	vertical-align: middle !important;
}
</style>
	<div class="main__title">
	    <h2 class="out">이벤트</h2>
	    <a href="" class="pa-title"><i class="fas fa-gift"></i><span>이벤트</span></a>
	    <span class="ar-title">></span>        
	    <a href="">이벤트 관리</a>
	    <span class="ar-title">></span>
	    <a href="" class="now-title">이벤트 등록</a>                     
	</div>
	<div class="container">
	    <span class="subtitle">기본정보</span>
	<form id="eventWriteForm">
		<%-- 수정용 pg, seq, type --%>
	   	<input type="hidden" name="pg" value="${pg}">
		<input type="hidden" name="seq" value="${seq}">
		<input type="hidden" name="type" value="${type}">
	
	    <table class="table table-bordered write-tb">
	        <tr>
	            <th>진행여부</th>
	            <td class="table--left">
	            	<input type="radio" class="eventStatus" name="eventStatus" value="1" /> 진행함
					<input type="radio" class="eventStatus" name="eventStatus" value="0" checked="checked" /> 진행안함
				</td>
	        </tr>
	        <tr>
	            <th>이벤트명</th>
	            <td class="table--left">
	                <input type="text" id="eventSubject" name="subject">
	            </td>
	        </tr>
	        <tr>
	            <th>기간설정</th>
	            <td class="table--left">
	            	<input type="radio" class="isPeriodOn" name="isPeriodOn" value="1" checked="checked"/> 설정
					<input type="radio" class="isPeriodOn" name="isPeriodOn" value="0" /> 설정안함
					<br>
		            <input type="text" name="startDate" id="datetimepickerStart" autocomplete="off">
		            <button type="button" id="dateStartBtn" class="date-button">
		            	<i class="fa fa-calendar" aria-hidden="true"></i>
		            </button>
					~
		            <input type="text" name="endDate" id="datetimepickerEnd" autocomplete="off">
		            <button type="button" id="dateEndBtn" class="date-button">
		            	<i class="fa fa-calendar" aria-hidden="true"></i>
		            </button>
	            </td>
	        </tr>
	    </table>
	    
	    
	    <span class="subtitle">상품선택</span>
	    

		<div class="searches">
		    <div class="main__select">
		        <select name="category" id="categorySelect" class="select-box">
		            <option value="9">전체</option>
		            <option value="101">농산물</option>
		            <option value="102">수산물</option>
		            <option value="103">축산물</option>
		            <option value="104">일반식품</option>
		            <option value="105">반찬류</option>
		        </select>
		    </div>
			<select name="searchOption" id="searchOption" class="select-box">
				<option value="1">상품코드</option>
				<option value="2">상품명</option>
				<option value="3">판매자코드</option>
			</select>
			<div class="search">
				<input type="hidden" id="pg2" value="${pg2}"> <input
					type="text" name="keyword" id="keyword" class="searchTerm"
					placeholder="검색어 입력">
				<button type="button" class="searchButton">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
		<table id="productTable" class="table table-bordered">
	        <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" id="chkAll"></th>
	            <th class="col-md-1">미리보기</th>
				<th class="col-md-1">판매상태</th>
				<th class="col-md-2">상품명</th>
				<th class="col-md-1">상품코드</th>
				<th class="col-md-1">재고</th>
				<th class="col-md-1">평점</th>
				<th class="col-md-1">정상가</th>
				<th class="col-md-1">단위</th>
	            <th class="col-md-1"></th>
	        </tr>
	    </table>
	    <div class="paging">
	        <ul class="pagination">
	            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
	            <li class="page-item"><a class="page-link" href="#">&lsaquo;</a></li>
	
	            <li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
	            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
	        </ul>
	    </div>
	    <div class="center_button">
			<button type="button" id="addEventProductBtn" class="btn btn-primary btn-sm">
				<i class="fa fa-angle-double-down" aria-hidden="true"></i> 일괄추가
			</button>
	    </div>
	    
	    
	    <span class="subtitle">상품 이벤트 설정</span>
	    <table id="eventProductTable" class="table table-bordered">
	         <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" id="pchkAll"></th>
	            <th class="col-md-1">미리보기</th>
				<th class="col-md-1">판매상태</th>
				<th class="col-md-2">상품명</th>
				<th class="col-md-1">상품코드</th>
				<th class="col-md-1">재고</th>
				<th class="col-md-1">평점</th>
				<th class="col-md-1">정상가</th>
				<th class="col-md-1">이벤트할인율</th>
				<th class="col-md-1">기존할인율</th>
	        </tr>
	    </table>
	    <br>
	    <table class="table table-bordered">
	    	<tr>
	            <th>일괄처리기능</th>
	            <td class="table--left">
	            	모든 상품 
	                <input type="text" size="2" maxlength="2" id="eventRate">% 할인
	                <button type="button" id="discountRateApplyBtn" class="btn btn-primary btn-sm">
	    			<i class="fa fa-calculator" aria-hidden="true"></i>
	    			일괄입력
	    			</button>
	            </td>
	            <th>일괄삭제</th>
	            <td>
	    			<button type="button" id="deleteEventProductBtn" class="btn btn-danger btn-sm">
	    			<i class="fa fa-times" aria-hidden="true"></i>
	    			일괄삭제
	    			</button>
	    		</td>
	        </tr>
	    </table>
	</form>
	    
	    <div class="write-tb__btns">
	        <button type="button" id="eventWriteBtn" class="btn btn-primary btn-lg">이벤트등록</button>
	        <button type="button" id="eventListBtn" class="btn btn-success btn-lg">목록으로</button>
	    </div>   
	</div>
<script type="text/javascript" src="/mintProject/admin/js/eventWrite.js"></script>
<script type="text/javascript">

</script>
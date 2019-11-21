<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.subtitle{
	display: block;
	height: 50px;
	font-size: 1.5em;
}

.select-box{
    height: 32px;
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

.thumb{
	width: 50px;
}

/* 테이블 */
.tb-subject{
	cursor: pointer;
}

.tb-row{
	
}
.tb-view{
    display: none;
    text-align: left;
    padding-left: 20px;
    background:#eff;
}

.tb-view td p {
    line-height: 25px;
}

</style>

<form id="eventListForm">
	<input type="hidden" id="pg" name="pg" value="${pg}">

	<div class="main__title">
	    <h3 class="out">이벤트</h3>
	    <a href="" class="pa-title"><i class="fas fa-gift"></i><span>이벤트</span></a>
	    <span class="ar-title">></span>        
	    <a href="" class="now-title">이벤트 관리</a>            
	</div>
	<div class="container">
		<%-- 이벤트 검사 --%>
		<span class="subtitle">이벤트 검색</span>
	    <table class="table table-bordered write-tb">
	        <tr>
	            <th>진행여부</th>
	            <td class="table--left">
	            <select name="eventStatus" id="eventStatus" class="select-box">
		            <option value="9">전체</option>
		            <option value="1">진행함</option>
		            <option value="0">진행안함</option>
				</select>
				</td>
	        </tr>
	        <tr>
	            <th>이벤트명</th>
	            <td class="table--left">
	                <input type="text" name="subject">
	            </td>
	        </tr>
	        <tr>
	            <th>진행기간</th>
	            <td class="table--left">
	            <input type="text" name="startDate" id="datetimepickerStart" autocomplete="off" readonly>
	            <button type="button" id="dateStartBtn" class="date-button">
	            	<i class="fa fa-calendar" aria-hidden="true"></i>
	            </button>
				~
	            <input type="text" name="endDate" id="datetimepickerEnd" autocomplete="off" readonly>
	            <button type="button" id="dateEndBtn" class="date-button">
	            	<i class="fa fa-calendar" aria-hidden="true"></i>
	            </button>
	            </td>
	        </tr>
	    </table>
		<div class="center_button">
			<button type="button" id="searchButton" class="btn btn-info">
				<i class="fa fa-search" aria-hidden="true"></i>&nbsp;검색</button>
		</div>
		
		<%-- 이벤트 목록 --%>
		<p class="subtitle">이벤트 목록</p>
		 <table id="eventListTable" class="table table-bordered">
	        <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" name="" id="chkAll"></th>
	            <th class="col-md-1">진행여부</th>
	            <th class="col-md-4">이벤트명</th>
	            <th class="col-md-2">시작일</th>
	            <th class="col-md-2">종료일</th>
	            <th class="col-md-1"></th>
	        </tr>
	    	<%-- 이벤트 목록 리스트로 들어오는 곳 --%>
	    </table>
	    
	    <div class="paging">
	        <ul class="pagination">
	            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
	            <li class="page-item"><a class="page-link" href="#">&lsaquo;</a></li>
	
	            <li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
	            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
	        </ul>
	    </div>
	    		
	    <div class="write-tb__btns">
	        <button type="button" id="eventDeleteBtn" class="btn btn-danger">
	    		<i class="fa fa-calendar-times" aria-hidden="true"></i>&nbsp;이벤트삭제</button>
	        <button type="button" id="eventWriteBtn" class="btn btn-primary">
	        	<i class="fa fa-calendar-plus" aria-hidden="true"></i>&nbsp;이벤트등록</button>
	    </div>   
	</div>
</form>
<script type="text/javascript" src="/mintProject/admin/js/event.js"></script>
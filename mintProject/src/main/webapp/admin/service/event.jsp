<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.subtitle{
	display: block;
	height: 50px;
	font-size: 1.5em;
}

.dateButton{
	width: 30px;
    height: 30px;
    border: 1px solid #333;
    background: #333;
    text-align: center;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
}



/* 테이블 */
.tb-subject{
	cursor: pointer;
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

<form id="eventWriteForm">
	<div class="main__title">
	    <h3 class="out">이벤트 관리</h3>
	    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
	    <span class="ar-title">></span>        
	    <a href="" class="now-title">이벤트 관리</a>            
	</div>
	<div class="container">
		<span class="subtitle">이벤트 검색</span>
	    <table class="table table-bordered write-tb">
	        <tr>
	            <th>진행여부</th>
	            <td class="table--left">
	            	<input type="radio" name="isOngoing" value="0" /> 진행중
					<input type="radio" name="isOngoing" value="1" checked="checked" /> 진행안함
				</td>
	        </tr>
	        <tr>
	            <th>이벤트명</th>
	            <td class="table--left">
	                <input type="text" name="subject">
	            </td>
	        </tr>
	        <tr>
	            <th>상품명</th>
	            <td class="table--left">
	                <input type="text" name="supplierId">
	            </td>
	        </tr>
	        <tr>
	            <th>진행기간</th>
	            <td class="table--left">
	            	<input type="text" name="startD" id="datetimePicker">

	            <button type="button" class="dateButton">
	            	<i class="fa fa-calendar" aria-hidden="true"></i>
	            </button>
	            <select name="startH" class="">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
	        	</select>
	        	시
	            <select name="startM" class="">
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
	        	</select>
	        	분
	            ~
	            <input type="text" name="endD">
	            <button type="button" class="dateButton">
	            	<i class="fa fa-calendar" aria-hidden="true"></i>
	            </button>
	            <select name="startH" class="">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
	        	</select>
	        	시
	            <select name="startM" class="">
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
	        	</select>
	        	분
	            </td>
	        </tr>
	    </table>
		<div class="main__btns">
			<button type="button" class="btn btn-success">검색</button>
		</div>
		
		<p class="subtitle">이벤트 목록</p>
		 <table class="table table-bordered">
	        <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" name="" id="chkAll"></th>
	            <th class="col-md-1">진행여부</th>
	            <th class="col-md-4">이벤트명</th>
	            <th class="col-md-2">시작일</th>
	            <th class="col-md-2">종료일</th>
	        </tr>
			<tr onclick="eventRow(this)">
				<td><input type="checkbox" name="" class="chk" value="1"></td>
				<td>진행함</td>
				<td class="tb-subject">[기획특가전] 환절기 대비 특가</td>
				<td>2019/11/10 00:00</td>
				<td>2019/12/01 00:00</td>
			</tr>
			<tr class="tb-view">
				<td colspan=5>
					내용내용내용
				</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="" class="chk" value="1"></td>
				<td>진행안함</td>
				<td>[계절특가] 새학기 준비 특가</td>
				<td>2019/02/01 08:00</td>
				<td>2019/03/28 23:00</td>
			</tr>
			
	    </table>
		
	    <div class="write-tb__btns">
	        <button type="button" id="eventDeleteBtn" class="btn btn-danger">일괄삭제</button>
	        <button type="button" id="eventWriteBtn" class="btn btn-primary">이벤트 등록</button>
	    </div>   
	</div>
</form>
<script type="text/javascript" src="/mintProject/admin/js/event.js"></script>
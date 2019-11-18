<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.subtitle{
	display: block;
	height: 50px;
	font-size: 1.5em;
}

.dateButton{
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

<form id="eventWriteForm">
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
	            <input type="text" name="startDate" id="datetimepickerStart" readonly>
	            <button type="button" id="dateStartBtn" class="dateButton">
	            	<i class="fa fa-calendar" aria-hidden="true"></i>
	            </button>
				~
	            <input type="text" name="endDate" id="datetimepickerEnd" readonly>
	            <button type="button" id="dateEndBtn" class="dateButton">
	            	<i class="fa fa-calendar" aria-hidden="true"></i>
	            </button>
	            </td>
	        </tr>
	    </table>
		<div class="center_button">
			<button type="button" class="btn btn-info">검색</button>
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
			<tr class="tb-row" onclick="eventRow(this)">
				<td><input type="checkbox" name="" class="chk" value="1"></td>
				<td>진행함</td>
				<td class="tb-subject">[기획특가전] 환절기 대비 특가</td>
				<td>2019/11/10 00:00</td>
				<td>2019/12/01 00:00</td>
				<td><button type="button" id="eventModifyBtn" class="btn btn-success btn-sm">수정</button></td>
			</tr>
			<tr class="tb-view">
				<td colspan="6">
					<div class="subtitle">
						<i class="fas fa-list"></i>
						<span>이벤트 상품 목록</span>
					</div>
					<table class="table event-table">
						<tr>
							<th class="col-md-2">미리보기</th>
							<th class="col-md-3">상품명</th>
							<th class="col-md-3">상품코드</th>
							<th class="col-md-1">정상가</th>
							<th class="col-md-1">할인가</th>
							<th class="col-md-1">할인률</th>
						</tr>
						<tr>
							<td>미리보기</td>
							<td>[닥터브로너스] 오가닉 립밤</td>
							<td>PX03004</td>
							<td>5000원</td>
							<td>4000원</td>
							<td>20%</td>
						</tr>
						<tr>
							<td>미리보기</td>
							<td>[파우트] 노우즈1 공기청정기</td>
							<td>EC220033</td>
							<td>30000원</td>
							<td>26000원</td>
							<td>20%</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="" class="chk" value="1"></td>
				<td>진행안함</td>
				<td>[계절특가] 새학기 준비 특가</td>
				<td>2019/02/01 08:00</td>
				<td>2019/03/28 23:00</td>
				<td><button type="button" id="eventModifyBtn" class="btn btn-success btn-sm">수정</button></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="" class="chk" value="1"></td>
				<td>진행함</td>
				<td>[상시특가] 일부 브랜드 창고 정리!</td>
				<td>상시이벤트</td>
				<td>상시이벤트</td>
				<td><button type="button" id="eventModifyBtn" class="btn btn-success btn-sm">수정</button></td>
			</tr>
			
	    </table>
		
	    <div class="write-tb__btns">
	        <button type="button" id="eventDeleteBtn" class="btn btn-danger">이벤트삭제</button>
	        <button type="button" id="eventWriteBtn" class="btn btn-primary">이벤트등록</button>
	    </div>   
	</div>
</form>
<script type="text/javascript" src="/mintProject/admin/js/event.js"></script>
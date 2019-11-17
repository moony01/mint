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
	            <th>기간설정</th>
	            <td class="table--left">
	            	<input type="radio" class="isPeriodOn" name="swPeriod" value="0" checked="checked"/> 설정
					<input type="radio" class="isPeriodOn" name="swPeriod" value="1" /> 설정안함
			
					<br>
		           
		            <input type="text" name="startDate" id="datetimepickerStart">
		            <button type="button" id="dateStartBtn" class="dateButton">
		            	<i class="fa fa-calendar" aria-hidden="true"></i>
		            </button>
					~
		            <input type="text" name="endDate" id="datetimepickerEnd">
		            <button type="button" id="dateEndBtn" class="dateButton">
		            	<i class="fa fa-calendar" aria-hidden="true"></i>
		            </button>
	            </td>
	        </tr>
	         <tr>
	            <th>할인율</th>
	            <td class="table--left">
	                <input type="text" name="discountRate">% 할인
					<br>
	                <input type="text" name="roundDigit">번째 자릿수에서 반올림
	            </td>
	        </tr>
	    </table>
	</form>
	    
	    <span class="subtitle">상품선택</span>
	    <button type="button" id="addEventProductBtn" class="btn btn-primary btn-sm">추가</button>
	    <button type="button" id="deleteEventProductBtn" class="btn btn-danger btn-sm">삭제</button>
	    <table id="eventProductTable" class="table table-bordered">
	        <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" name="" id="chkAll"></th>
	            <th class="col-md-1">미리보기</th>
	            <th class="col-md-1">상품코드</th>
	            <th class="col-md-3">상품명</th>
	            <th class="col-md-1">가격</th>
	            <th class="col-md-1"></th>
	        </tr>
	    </table>
	    
	    
	    <div class="write-tb__btns">
	        <button type="button" id="eventWriteBtn" class="btn btn-primary btn-lg">글쓰기</button>
	        <button type="button" id="eventListBtn" class="btn btn-success btn-lg">목록으로</button>
	    </div>   
	</div>
<script>
$(function(){
	// datetimepicker locale
	$.datetimepicker.setLocale('ko');
	$('#datetimepickerStart').datetimepicker({
		onShow:function( ct ){
		   this.setOptions({
		    maxDate:$('#datetimepickerEnd').val()?$('#datetimepickerEnd').val():false
		   })
		},
	});	
	$('#datetimepickerEnd').datetimepicker({
		onShow:function( ct ){
		   this.setOptions({
		    minDate:$('#datetimepickerStart').val()?$('#datetimepickerStart').val():false
		   })
		},
	});	

	
	// 날짜선택 막아주는 기능인데 날짜/시간 한꺼번에 안되는듯
	// 날짜, 시간 따로 input text 받아서 따로 조절할지 고민
	$('#dateStartBtn').click(function(){
		$('#datetimepickerStart').datetimepicker('toggle');	
	});
	
	$('#dateEndBtn').click(function(){
		$('#datetimepickerEnd').datetimepicker('toggle');
	});
});

// 이벤트 관리 페이지 이동
$('#eventListBtn').click(function(){	
	location.href='/mintProject/admin/service/event';
});


// 기간설정 예/아니오
$('.isPeriodOn').change(function(){
	if($('.isPeriodOn').prop('checked')){
		$('#datetimepickerStart').attr('disabled', false);
		$('#datetimepickerEnd').attr('disabled', false);
		$('#dateStartBtn').attr('disabled', false);
		$('#dateEndBtn').attr('disabled', false);
	} else { 
		$('#datetimepickerStart').attr('disabled', true);
		$('#datetimepickerEnd').attr('disabled', true);
		$('#dateStartBtn').attr('disabled', true);
		$('#dateEndBtn').attr('disabled', true);
	}
});

// 이벤트 작성
$('#eventWriteBtn').click(function(){
	$('#eventWriteForm').submit();
});

</script>
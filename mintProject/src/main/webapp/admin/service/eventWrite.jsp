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
<form id="eventWriteForm">
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
				</td>
			</tr>
			<tr>
				<th></th>
	            <td class="table--left">
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
	    </table>
	    
	    <span class="subtitle">상품선택</span>
	    <div class="write-tb__btns">
	        <button type="button" class="btn btn-primary btn-lg" id="write-btn">글쓰기</button>
	        <button type="button" class="btn btn-success btn-lg">목록으로</button>
	    </div>   
	</div>
</form>
<script>
$(function(){
	// datetimepicker locale
	$.datetimepicker.setLocale('ko');
	$('#datetimepickerStart').datetimepicker();	
	$('#datetimepickerEnd').datetimepicker();	
	
	$('#dateStartBtn').click(function(){
		$('#datetimepickerStart').datetimepicker('toggle',{
			onShow:function( ct ){
			   this.setOptions({
			    maxDate:$('#datetimepickerEnd').val()?$('#datetimepickerEnd').val():false
			   })
			}
		});	

	});
	
	$('#dateEndBtn').click(function(){
		$('#datetimepickerEnd').datetimepicker('toggle',{
			onShow:function( ct ){
			   this.setOptions({
			    minDate:$('#datetimepickerStart').val()?$('#datetimepickerStart').val():false
			   })
			}
		});	

	});
});
$('.isPeriodOn').change(function(){
	
	if($('.isPeriodOn').prop('checked')){
		$('#datetimepickerStart').attr('disabled', false);
		$('#datetimepickerEnd').attr('disabled', false);
	} else { 
		$('#datetimepickerStart').attr('disabled', true);
		$('#datetimepickerEnd').attr('disabled', true);
	}
});

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.subtitle{
	display: block;
	height: 50px;
	font-size: 1.5em;
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
		<%-- 수정용 pg, seq --%>
	   	<input type="hidden" name="pg" value="${pg}">
		<input type="hidden" name="seq" value="${seq}">
	
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
	    <button type="button" id="addEventProductBtn" class="btn btn-primary btn-sm">
	    	<i class="fa fa-angle-double-down" aria-hidden="true"></i>
	    	일괄추가
	    </button>
	    <table id="eventProductTable" class="table table-bordered">
	        <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" id="chkAll"></th>
	            <th class="col-md-1">미리보기</th>
	            <th class="col-md-1">상품코드</th>
	            <th class="col-md-3">상품명</th>
	            <th class="col-md-1">가격</th>
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
	    
	    
	    
	    <span class="subtitle">이벤트 설정</span>
	    <table id="eventProductTable" class="table table-bordered">
	         <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" id="chkAll"></th>
	            <th class="col-md-1">미리보기</th>
	            <th class="col-md-1">상품코드</th>
	            <th class="col-md-3">상품명</th>
	            <th class="col-md-1">정상가</th>
	            <th class="col-md-1">할인율</th>
	            <th class="col-md-1">할인가</th>
	        </tr>
	       	<tr>
	       		<td><input type="checkbox"></td>
				<td>미리보기</td>
				<td class="productCode">PX03004</td>
				<td>[닥터브로너스] 오가닉 립밤</td>
				<td>5000원</td>
				<td><input type="text" size="2" name="discountRate">%</td>
				<td>4000원</td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>미리보기</td>
				<td class="productCode">EC220033</td>
				<td>[파우트] 노우즈1 공기청정기</td>
				<td>30000원</td>
				<td><input type="text" size="2" name="discountRate">%</td>
				<td>26000원</td>
			</tr>
	    </table>
	    <table class="table table-bordered">
	    	<tr>
	            <th>일괄처리</th>
	            <td class="table--left">
	                <input type="text" size="2" id="eventRate">% 할인
	            </td>
	    		<th>일괄삭제</th>
	    		<td></td>
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
	        <button type="button" id="eventWriteBtn" class="btn btn-primary btn-lg">글쓰기</button>
	        <button type="button" id="eventListBtn" class="btn btn-success btn-lg">목록으로</button>
	    </div>   
	</div>
<script>
// modify일시 type이 mod로 넘어옴
let type = '"${type}"';

$(function(){
	let sd = new Date('${dto.startDate}');
	let ed = Date.parse('${dto.endDate}');
	let time = new Date();
	console.log(sd);
	console.log(ed);
	console.log(time)
	
	let jsonSD = sd.toJSON();
	let jsonED = ed.toJSON();
	let jsonT = time.toJSON();
	console.log(jsonSD);
	console.log(jsonED);
	console.log(jsonT);
	
	/* 수정시 기존 이벤트 DTO 값 가져오기 */
	if(type === '"mod"'){
		// 진행여부
		if('${dto.eventStatus}' === '0'){
			$(".eventStatus:radio[value='0']").attr("checked",true); 
		} else if('${dto.eventStatus}' === '1'){
			$(".eventStatus:radio[value='1']").attr("checked",true); 
		}

		// 이벤트명
		$('#eventSubject').val('${dto.subject}');
		
		// 기간설정(문제 발생)
		if($('#datetimepickerStart').val() == '' && $('#datetimepickerEnd').val() == ''){
			$(".isPeriodOn:radio[value='0']").attr("checked",true); 
		} else {
			$(".isPeriodOn:radio[value='1']").attr("checked",true); 
			
			$('#datetimepickerStart').val(moment(sd).format('YYYY/MM/DD hh:mm'));
			$('#datetimepickerEnd').val(moment(ed).format('YYYY/MM/DD hh:mm'));
		}
	}
	
	/* datetimepicker 한국어 설정 */
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

	/* 아이콘 클릭시 datetimepicker 표시 */
	$('#dateStartBtn').click(function(){
		$('#datetimepickerStart').datetimepicker('toggle');	
	});
	
	$('#dateEndBtn').click(function(){
		$('#datetimepickerEnd').datetimepicker('toggle');
	});
	
});

/* 기간설정 유무에 따른 input, datetimepicker(비)활성화 */
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

/* 글쓰기 버튼 클릭시 */
$('#eventWriteBtn').click(function(){	
	if($('#eventSubject').val() === '') alert('이벤트명을 입력해주세요');
	else if($('.isPeriodOn').prop('checked')){
		if($('#datetimepickerStart').val() == '' || $('#datetimepickerEnd').val() == ''){
			alert('이벤트 기간을 설정해주세요');
		} else ajax(type);
	} else ajax(type);
});

/* ajax 연결 */
function ajax(type){ 
	if(type === '"mod"'){
		return $.ajax({
			type:'post',
			url:'/mintProject/admin/service/eventModify',
			data: $('#eventWriteForm').serialize(),
			success: function(){
				alert('수정 완료!');
				location.href='/mintProject/admin/service/event';
			},
			error: function(error){
				alert('수정 실패!');
				console.error(error);
			}
		});
	} else {
		return $.ajax({
			type:'post',
			url:'/mintProject/admin/service/eventWrite',
			data: $('#eventWriteForm').serialize(),
			success: function(){
				alert('작성 완료!');
				location.href='/mintProject/admin/service/event';
			},
			error: function(error){
				alert('작성 실패!');
				console.error(error);
			}
		});
	}
}

/* 이벤트 관리 리스트 이동 */
$('#eventListBtn').click(function(){	
	location.href='/mintProject/admin/service/event';
});
</script>
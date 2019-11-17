/* 이벤트 관리 스크립트 */
$(function(){
	// datetimepicker locale
	$.datetimepicker.setLocale('ko');
	$('#datetimepickerStart').datetimepicker({
		onShow:function( ct ){
			   this.setOptions({
			    maxDate:$('#datetimepickerEnd').val()?$('#datetimepickerEnd').val():false
			   })
			}
		});
	$('#datetimepickerEnd').datetimepicker({
		onShow:function( ct ){
			   this.setOptions({
			    minDate:$('#datetimepickerStart').val()?$('#datetimepickerStart').val():false
			   })
			}
		});
	
	$('#dateStartBtn').click(function(){
		$('#datetimepickerStart').datetimepicker('toggle');
	});
	
	$('#dateEndBtn').click(function(){
		$('#datetimepickerEnd').datetimepicker('toggle');
	});
});



/* 제목 클릭시 내용 나타나기/사라지기 */
function eventRow(content){
    if($(content).next().css('display') === 'none'){
		$('.tb-view').css('display', 'none');
		$(content).next().css('display', 'table-row');
	} else if($(content).next().css('display') === 'table-row'){
		$('.tb-view').css('display', 'none');
	}
}

// 이벤트 등록 페이지 이동
$('#eventWriteBtn').click(function(){
	location.href='/mintProject/admin/service/eventWriteForm';
});

// 이벤트 수정 페이지 이동
$('#eventModifyBtn').click(function(){
	alert('수정 기능 미구현');
	//location.href='/mintProject/admin/service/eventModifyForm';
});

// 이벤트 삭제 
$('#eventDeleteBtn').click(function(){
	alert('기능 미구현');
});
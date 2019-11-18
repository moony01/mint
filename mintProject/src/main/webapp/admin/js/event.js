/* 이벤트 관리 스크립트 */
$(function(){
	/* datetimepicker 한국어 설정 */
	$.datetimepicker.setLocale('ko');
	
	/* datetimepicker 구간 설정 (날짜 선택 제한) */
	$('#datetimepickerStart').datetimepicker({
		format:'Y-m-d',
		onShow:function( ct ){
		   this.setOptions({
		    maxDate:$('#datetimepickerEnd').val()?$('#datetimepickerEnd').val():false
		   })
		},
		timepicker:false
	});
	$('#datetimepickerEnd').datetimepicker({
		format:'Y-m-d',
		onShow:function( ct ){
		   this.setOptions({
		    minDate:$('#datetimepickerStart').val()?$('#datetimepickerStart').val():false
		   })
		},
		timepicker:false
	});
	
	/* 아이콘 클릭시 datetimepicker 표시 */
	$('#dateStartBtn').click(function(){
		$('#datetimepickerStart').datetimepicker('toggle');
	});
	
	$('#dateEndBtn').click(function(){
		$('#datetimepickerEnd').datetimepicker('toggle');
	});
	
	
	/* 게시판 리스트 가져오기 */
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getEventList',
		dataType:'json',
		success: function(result){
			getEventList(result);
			$('.pagination').html(result.eventPaging.pagingHTML);
		},
		error: function(error){
			console.error(error);
		}
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

/* 이벤트 목록 템플릿 */
function getEventList(result){
	const $table = $('#eventListTable');
	let events = result.list;
	let $frag = $(document.createDocumentFragment());
	
	// 구조분해할당, 템플릿 리터럴
	for(let i=0; i<events.length; i++){
		const {
			seq,
			subject,
			startDate,
			endDate,
			eventStatus
		} = events[i];
	
		let eventRow = `
			<tr class="tb-row" onclick="eventRow(this)">
				<td><input type="checkbox" name="check" class="check" value=${seq}></td>
				<td>${
					(() => {
						if(events[i].eventStatus === '0') return '진행안함';
						else return '진행중';
					})()}</td>
				<td class="tb-subject">${subject}</td>
				<td>${
					(() => {
						if(events[i].startDate === '') return '상시진행';
						else return events[i].startDate;
					})()
				}</td>
				<td>${
					(() => {
						if(events[i].endDate === '') return '상시진행';
						else return events[i].endDate;
					})()
				}</td>
				<td>
					<button type="button" class="btn btn-success btn-sm" onclick="eventDelete(this)">
					<i class="fa fa-edit" aria-hidden="true"></i>
					수정
					</button>
				</td>
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
			`;
		$frag.append($(eventRow));
	}
	$table.append($frag);
}

// 이벤트 등록 페이지 이동
$('#eventWriteBtn').click(function(){
	location.href='/mintProject/admin/service/eventWriteForm';
});

// 이벤트 수정 페이지 이동
function eventDelete(content){
	let seq = $(content).parent().parent().children().val();
	let pg = $('#pg').val();
	console.log(seq+', '+pg)
	// location.href='/mintProject/admin/service/eventModifyForm?seq='+seq+'&pg='+pg;	
}

//체크박스 컨트롤
$('#chkAll').click(function(){
	if($('#chkAll').prop('checked')) $('.check').prop('checked', true);
	else $('.check').prop('checked', false);
});

// 이벤트 삭제 
$('#eventDeleteBtn').click(function(){
	var cnt = $('.check:checked').length; // 체크된 항목 갯수 구하기
	if(cnt===0) alert('삭제할 항목을 먼저 선택하세요');
	else {
		if(confirm('정말로 삭제하시겠습니까?')) {
			$.ajax({
				type:'post',
				url:'/mintProject/admin/service/eventDelete',
				data: $('#eventListForm').serialize(),
				success: function(result){
					alert('삭제 완료!');
					location.href='/mintProject/admin/service/event';
				},
				error: function(error){
					console.error(error);
				}
			});
		}
	}
});
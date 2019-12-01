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
	
	/* 이벤트 리스트 가져오기 */
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getEventList',
		dataType:'json',
		success: function(result){
			console.log(result);
			eventListTemp(result);
			eventExecute(result);
		},
		error: function(error){
			console.error(error);
		}
	});
});

/* 제목 클릭시 내용 나타나기/사라지기 */
function eventRow(content){
	if($(content).parent().next().css('display') === 'none'){
		$('.tb-view').css('display', 'none');
		$(content).parent().next().css('display', 'table-row');
		getEventProductList($(content).prev().prev().children().val());
	} else if($(content).parent().next().css('display') === 'table-row'){
		$('.tb-view').css('display', 'none');
	}
}

/* 이벤트 해당 상품 목록 가져오기 */
function getEventProductList(seq){
	$('.eventProductRow').remove();
	
	// 상품 정보 가져오기 (ProductDTO)
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getEventProductList',
		data:'seq='+seq,
		dataType:'json',
		success: function(result){
			if(result.list.length > 0) eventProductListTemp(result);
		},
		error: function(error){
			console.error(error);
		}
	});
}


/* 이벤트 목록 템플릿 */
function eventListTemp(result){
	const $eventTable = $('#eventListTable');
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
	
		let sd = new Date(events[i].startDate);
		let ed = new Date(events[i].endDate);
		
		let eventRow = `
			<tr class="tb-row">
				<td><input type="checkbox" name="check" class="check" value=${seq}></td>
				<td>${
					(() => {
						if(events[i].eventStatus === '1') return '진행함';
						else return '진행안함';
					})()}</td>
				<td class="tb-subject" onclick="eventRow(this)">${subject}</td>
				<td>${
					(() => {
						if(events[i].startDate === null) return '상시진행';
						else return moment(sd).format('YYYY/MM/DD HH:mm');
					})()
				}</td>
				<td>${
					(() => {
						if(events[i].endDate === null) return '상시진행';
						else return moment(ed).format('YYYY/MM/DD HH:mm');
					})()
				}</td>
				<td>
					<button type="button" class="btn btn-success btn-sm" onclick="eventModify(this)">
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
							<th class="col-md-1">미리보기</th>
							<th class="col-md-1">판매상태</th>
							<th class="col-md-2">상품명</th>
							<th class="col-md-1">상품코드</th>
							<th class="col-md-1">재고</th>
							<th class="col-md-1">평점</th>
							<th class="col-md-1">정상가</th>
							<th class="col-md-1">할인율</th>
							<th class="col-md-1">할인가</th>
						</tr>
					</table>
				</td>
			</tr>
			`;
		$frag.append($(eventRow));
	}
	$eventTable.append($frag);
}

/* 이벤트 해당 상품 목록 템플릿 */
function eventProductListTemp(result){
	const $eventProductTable = $('.event-table');
	let eventProducts = result.list;
	let $pfrag = $(document.createDocumentFragment());

	// 구조분해할당, 템플릿 리터럴
	for(let i=0; i<eventProducts.length; i++){
		const {
			productStatus,
			thumbnail,
			mainSubject,
			productCode,
			stock,
			discountRate,
			price,
			star,
		} = eventProducts[i];
		
		// 할인가 계산
		let eventPrice = price-((price)/100*discountRate);

		let eventProductRow = `
			<tr class="eventProductRow">
				<td><img class="thumb" src="/mintProject/shop/storage/mint/product/${thumbnail}"></td>
				<td class="productstatus${productStatus}">${
					(() => {
						if(productStatus === 0) return '판매중';
						else return '판매중지';
					})()}</td>
				<td>${mainSubject}</td>
				<td>${productCode}</td>
				<td>${stock}</td>
				<td>${star}</td>
				<td>${price}</td>
				<td>${discountRate}%</td>
				<td>${eventPrice}</td>
			</tr>
			`;
		$pfrag.append($(eventProductRow));
	}
	$eventProductTable.append($pfrag);
}

/* 이벤트 검색 */
$('#searchButton').click(function(){
	// 기존 테이블 비우기
	$('.tb-row').remove();
	$('.tb-view').remove();
	
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/eventSearch',
		data: $('#eventListForm').serialize(),
		dataType:'json',
		success: function(result){
			eventListTemp(result);
		},
		error: function(error){
			console.error(error);
		}
	});
});

/* 이벤트 등록 페이지 이동 */
$('#eventWriteBtn').click(function(){
	location.href='/mintProject/admin/service/eventWriteForm';
});

/* 이벤트 수정 페이지 이동 */
function eventModify(content){
	// 이 부분 더 간단하게 쓸 수 있을텐데;
	let seq = $(content).parent().prev().prev().prev().prev().prev().children().val();
	let pg = $('#pg').val();
	location.href='/mintProject/admin/service/eventModifyForm?seq='+seq+'&pg='+pg+'&type=mod';	
}

/* 체크박스 컨트롤 */
$('#chkAll').click(function(){
	if($('#chkAll').prop('checked')) $('.check').prop('checked', true);
	else $('.check').prop('checked', false);
});

/* 이벤트 삭제 */
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


/**
 *  이벤트 스크립트
 *  
 *  관리자 이벤트 페이지에 적용시킴 
 *  
 *  1. AJAX로 이벤트 리스트를 가져옴
 *  2. eventStatus가 1이고 endDate에서 현재 시간을 뺀 값이 양수면 실행한다
 *  3. startDate - 현재 시간(now)의 값을 이벤트 실행 setTimeout의 delay 패러미터에 넣음
 *  4. 이벤트 실행 setTimeout이 0이 되거나 음수가 되면 1~50ms 후 곧바로 product DB에 update
 *  5. endDate - 현재 시간(now)의 값을 이벤트 종료 setTimeout의 delay 패러미터에 넣음
 *  6. 이벤트 종료 setTimeout이 0이 되거나 음수가 되면 1~50ms 후 곧바로 product DB에 update
 */

function eventExecute(result){
	let event = result.list;
	let now = new Date();
	var eventOngoing = null;

	for(var i=0; i<event.length; i++){
		if(event[i].startDate < now) var startCount = 0;
		else var startCount = event[i].startDate - now;
		let endCount = event[i].endDate - now
		  , eventSubject = event[i].subject
		  , eventStatus = event[i].eventStatus
		  , productCode = event[i].productCode
		  , discountRate = event[i].discountRate
		  , prevDiscountRate = event[i].prevDiscountRate
		  , seq = event[i].seq;
		console.log(endCount);
		/* 이벤트 진행 여부 */
		if(eventStatus === '1' && endCount > 0){

			console.log('event '+eventSubject+' : '+'eventStatus : '+eventStatus
					+' startCount : '+startCount+' endCount : '+endCount);
			// 이벤트 진행중이고 종료되지 않은 이벤트
			
			eventOngoing = setTimeout(function(){
				console.log('진입 성공');
				$.ajax({
					type:'post',
					url:'/mintProject/admin/service/eventProductUpdate',
					data:'productCode='+productCode
						+'&discountRate='+discountRate,
					success: function(){
						console.log('이벤트 실행 성공!');
					},
					error: function(error){
						console.error(error);
					}
				});
			}, startCount);

		} else if(eventStatus === '1' && endCount <= 0) {
			console.log('event '+eventSubject+' : '+'eventStatus : '+eventStatus
					+' startCount : '+startCount+' endCount : '+endCount);
			// 진행중 상태지만 이벤트 종료
			setTimeout(function(){
				clearTimeout(eventOngoing);
				console.log('이벤트 종료!');
			}, endCount);
			
			// 이전 할인율로 update하기
			endEvent(seq, productCode, prevDiscountRate);
		} else if(eventStatus === '0' && prevDiscountRate !== discountRate){
			console.log('event '+eventSubject+' : '+'eventStatus : '+eventStatus
					+' startCount : '+startCount+' endCount : '+endCount);
			// 진행 안함 (진행중이었다가 상태 변경한 것 포함)
			setTimeout(function(){
				clearTimeout(eventOngoing);
				console.log('이벤트 종료!');
			}, endCount);
			
			// 이전 할인율로 update하기
			endEvent(seq, productCode, prevDiscountRate);	
		}
	}	
}

function endEvent(seq, productCode, prevDiscountRate){
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/eventEndProductUpdate',
		data: 'seq='+seq
			+'&productCode='+productCode
			+'&prevDiscountRate='+prevDiscountRate,
		success: function(){
			console.log("되돌리기 성공!");
		},
		error: function(error){
			console.error(error);
		}
	});
}
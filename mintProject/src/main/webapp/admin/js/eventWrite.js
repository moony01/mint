
// modify일시 type이 mod로 넘어옴
let type = $('input[name=type]').val();
let seq = $('input[name=seq]').val();
let pg = $('input[name=pg]').val();

$(function(){
	/* 수정할 때 정보 가져오기 */
	if(type === 'mod'){
		// 이벤트 정보 가져오기
		getEvent(seq);
		// 이벤트 해당 상품 리스트 가져오기
		getProductList(seq);
	}
	

});

/* 이벤트 정보 가져오기 */
function getEvent(seq){
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getEvent',
		data:'seq='+seq,
		dataType:'json',
		success: function(result){
			eventInfo(result);
		},
		error: function(error){
			console.error(error);
		}
	});
}

/* 이벤트 해당 상품 목록 가져오기 */
function getProductList(seq){
	$('.productRow').remove();
	
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getProductList',
		data:'seq='+seq,
		dataType:'json',
		success: function(result){
			productListTemp(result);
		},
		error: function(error){
			console.error(error);
		}
	});
}


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

/* 수정시 이벤트 정보 가져오기 */
function eventInfo(result){
	let eventInfo = result.dto;

	let startDate = moment(eventInfo.startDate).format('YYYY/MM/DD hh:mm');
	let endDate = moment(eventInfo.endDate).format('YYYY/MM/DD hh:mm');
	
	// 진행여부
	if(eventInfo.eventStatus === '0'){
		$('.eventStatus:radio[value="0"]').attr('checked',true); 
	} else if(eventInfo.eventStatus === '1'){
		$('.eventStatus:radio[value="1"]').attr('checked',true); 
	}
	// 이벤트명
	$('#eventSubject').val(eventInfo.subject);
	
	// 기간설정
	if(eventInfo.startDate === null && eventInfo.endDate === null){
		$(".isPeriodOn:radio[value='0']").attr("checked",true); 
	} else {
		$(".isPeriodOn:radio[value='1']").attr("checked",true); 
		$('#datetimepickerStart').val(startDate);
		$('#datetimepickerEnd').val(endDate);
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


/* 이벤트 해당 상품 목록 템플릿 */
function productListTemp(result){
	const $productTable = $('#eventProductTable');
	let products = result.list;
	let $pfrag = $(document.createDocumentFragment());
	
	// 구조분해할당, 템플릿 리터럴
	for(let i=0; i<products.length; i++){
		const {
			productstatus,
			thumbnail,
			mainSubject,
			productCode,
			stock,
			discountRate,
			price,
			star
		} = products[i];
		
		let productRow = `
			<tr class="productRow">
				<td><input type="checkbox" class="pcheck" value="${productCode}"></td>
				<td><img class="thumb" src="/mintProject/shop/storage/mint/product/${thumbnail}" alt=""></td>
				<td class="productstatus${productstatus}">${
					(() => {
						if(products[i].productStatus === 0) return '판매중';
						else return '판매중지';
					})()}</td>
				<td>${mainSubject}</td>
				<td>${productCode}</td>
				<td>${stock}</td>
				<td>${star}</td>
				<td class="price">${price}</td>
				<td><input type="text" size="2" class="discountRate" value="${discountRate}"/>%</td>
				<td class="eventPrice"></td>
			</tr>
			`;
		$pfrag.append($(productRow));
	}
	$productTable.append($pfrag);
}


/* 이벤트 대상 상품 체크박스 컨트롤 */
$('#pchkAll').click(function(){
	if($('#pchkAll').prop('checked')) $('.pcheck').prop('checked', true);
	else $('.pcheck').prop('checked', false);
});

/* 글쓰기 버튼 클릭시 */
$('#eventWriteBtn').click(function(){	
	// productCode, discountRate 직렬화
	dataManufacturing();
	
	if($('#eventSubject').val() === '') alert('이벤트명을 입력해주세요');
	else if($('.isPeriodOn').prop('checked')){
		if($('#datetimepickerStart').val() == '' || $('#datetimepickerEnd').val() == ''){
			alert('이벤트 기간을 설정해주세요');
		} else ajax(type);
	} else ajax(type);
});

/* 직렬화 이전 데이터 가공 */
// cart.jsp의 javascript 로직을 가져옴
function dataManufacturing(){
	let form = document.getElementById('eventWriteForm');
	let amount = $('#productTable').length-1;
	
	// productCode
	var input1 = document.createElement("input");
	input1.name = 'productCode';
	input1.type = 'hidden';
	let productCode = [];
	for(var i=0; i<amount; i++) {
		let value = $('.pcheck').eq(i).val();
		productCode.push(value);
	}
	input1.value = productCode;
	console.log(input1.value);
	form.appendChild(input1);
	
	// discountRate
	var input2 = document.createElement("input");
	input2.name = 'discountRate';
	input2.type = 'hidden';
	let discountRate = [];
	for(var i=0; i<amount; i++) {
		let value = $('.discountRate').eq(i).val();
		discountRate.push(value);
	}
	input2.value = discountRate;
	console.log(input2.value);
	form.appendChild(input2);
	
}


/* 등록,수정 ajax */
function ajax(type){ 
	if(type === 'mod'){
		return $.ajax({
			type:'post',
			url:'/mintProject/admin/service/eventModify',
			data: $('#eventWriteForm').serialize(),
			success: function(){
				//alert('수정 완료!');
				//location.href='/mintProject/admin/service/event';
			},
			error: function(error){
				//alert('수정 실패!');
				//console.error(error);
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
	location.href='/mintProject/admin/service/event?pg='+pg;
});

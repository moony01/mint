
// modify일시 type이 mod로 넘어옴
let type = $('input[name=type]').val();
let pg = $('#pg').val();

$(function(){
	/* 수정할 때 정보 가져오기 */
	if(type === 'mod'){
		let seq = $('input[name=seq]').val();
		// 이벤트 정보 가져오기
		getEvent(seq);
	}
	// 상품 리스트 가져오기
	getProductList(pg);

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

			// 이벤트 해당 상품이 있다면 리스트 가져오기
			if(result.dto.productCode !== null){
				getEventProductList(seq);				
			}
		},
		error: function(error){
			console.error(error);
		}
	});	
}



/* 이벤트 해당 상품 목록 가져오기 */
function getEventProductList(seq){
	$('.eventProductRow').remove();
	
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getEventProductList',
		data:'seq='+seq,
		dataType:'json',
		success: function(result){
			eventProductListTemp(result);
		},
		error: function(error){
			console.error(error);
		}
	});
}


/* 상품 리스트 가져오기 */
var getProductList = function(pg){
	let searchOption = $('#searchOption').val()
	let categorySelect = $('#categorySelect').val();
	let keyword = $('#keyword').val();
	
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getProductList',
		data: 'searchOption='+searchOption+
			 '&categorySelect='+categorySelect+
			 '&pg='+pg+
			 '&keyword='+keyword,
		dataType:'json',
		success: function(result){
			getProductListTemp(result);
			paging(result);
		},
		error: function(error){
			console.error(error);
		}
	});
}
/* 상품 검색 */
$(".searchButton").click(function(){
	getProductList(1);
});

/* 카테고리 변경시 */
$("#categorySelect").change(function(){
	getProductList(1);
});

/* 상품 AJAX 페이징 처리 */
function paging(result){
	$('.page-item').remove();
	$('.page-link').remove();
	
	let addr = result.addr;
	let totalProduct = result.totalProduct;
	let currentPage = result.pg;
	
	let pageBlock = 10;
	let pageSize = 10;
	
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalProduct + pageSize - 1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	
	
	if(endPage > totalPage) endPage = totalPage;

	if(startPage > pageBlock){
		$('.pagination').append($('<a/>', {
			class: 'page-link', 
			href: addr+'?pg='+(startPage-1),
			text: '<'
		}));
	}
	
	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			text: i
		})).appendTo('.pagination');
		
		if(i == currentPage) {
			$('.pg').attr('class', 'page-item active');
		} else {
			$('.pg').removeAttr('class', 'active');
		}	
	}
	
	if(endPage < totalPage) {
		$('.pagination').append($('<a/>', {
			class: 'page-link', 
			href: addr+'?pg='+(endPage+1),
			text: '>'
		}));
	}
	
	$('.page-link').on('click', function(event){
		getProductList($(this).text());
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

	let startDate = moment(eventInfo.startDate).format('YYYY/MM/DD HH:mm');
	let endDate = moment(eventInfo.endDate).format('YYYY/MM/DD HH:mm');
	
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
		// (작동 안함. 문제 있음.) 
		$('.isPeriodOn:radio[value="0"]').attr('checked',true);
	} else {
		$('.isPeriodOn:radio[value="1"]').attr('checked',true);
		$('#datetimepickerStart').val(startDate);
		$('#datetimepickerEnd').val(endDate);
	}
	// 섬네일
	$('.event-Thumbnail').append('<span><a>'+eventInfo.eventThumbnail+'</a></span>');
			
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

/* 상품 리스트 템플릿 */
function getProductListTemp(result){

	const $productTable = $('#productTable');
	let products = result.list;
	let $frag = $(document.createDocumentFragment());
	let paging = result.paging; 
	
	$('.productRow').remove();
	
	if(products.length == 0){
		$productTable.append('<td colspan="10">데이터가 없습니다</td>');
   	} else {
		// 구조분해할당, 템플릿 리터럴
		for(let i=0; i<products.length; i++){
			const {
				thumbnail,
				productStatus,
				mainSubject,
				productCode,
				stock,
				star,
				price,
				discountRate
			} = products[i];
			
			let productRow = `
				<tr class="productRow">
					<td><input type="checkbox" class="check" name="chk" value="${productCode}"></td>
					<td><img class="thumb" src="/mintProject/shop/storage/mint/product/${thumbnail}"></td>
					<td class="productstatus ${productStatus}">${
						(() => {
							if(productStatus === 0) return '판매중';
							else return '판매중지';
						})()}</td>
					<td><a href="/mintProject/shop/product/updateProductForm?productCode=${productCode}">${mainSubject}</a></td>
					<td>${productCode}</td>
					<td>${stock}</td>
					<td>${star}</td>
					<td>${price}</td>
					<td>${discountRate}%</td>
				</tr>
				`;
			$frag.append($(productRow));
		}
		$productTable.append($frag);
	}
}

/* 이벤트 해당 상품 리스트 템플릿 */
function eventProductListTemp(result){
	const $eventProductTable = $('#eventProductTable');
	let eventProducts = result.list;
	let eventInfos = result.eventProductList;
	let $pfrag = $(document.createDocumentFragment());
	let eventProductRow = null;

	// 구조분해할당, 템플릿 리터럴
	for(let i=0; i<eventProducts.length; i++){
		
		if(eventInfos != null){	
			const {
				productStatus,
				thumbnail,
				mainSubject,
				productCode,
				stock,
				price,
				star
			} = eventProducts[i];
			const {
				discountRate,
				prevDiscountRate
			} = eventInfos[i];

			eventProductRow = `
				<tr class="eventProductRow">
					<td><input type="checkbox" class="pcheck" name="chk" value="${productCode}"></td>
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
					<td class="price">${price}</td>
					<td><input type="text" size="2" maxlength="2" class="discountRate" value="${discountRate}"/>%</td>
					<td class="prevDiscountRate">${prevDiscountRate}%</td>
				</tr>
				`;
		} else {
			const {
				productStatus,
				thumbnail,
				mainSubject,
				productCode,
				stock,
				price,
				discountRate,
				star
			} = eventProducts[i];

			
			eventProductRow = `
				<tr class="eventProductRow">
					<td><input type="checkbox" class="pcheck" name="chk" value="${productCode}"></td>
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
					<td class="price">${price}</td>
					<td><input type="text" size="2" maxlength="2" class="discountRate"/>%</td>
					<td class="prevDiscountRate">${discountRate}%</td>
				</tr>
				`;
		}
		$pfrag.append($(eventProductRow));
	}
	$eventProductTable.append($pfrag);
}

/* 상품 추가 버튼 클릭시 */
$('#addEventProductBtn').click(function(){
	var cnt = $('.check:checked').length; // 체크된 항목 갯수 구하기
	if(cnt===0){
		swal({
			text : '상품을 먼저 선택하세요',
			buttons : false,
			timer : 2000
		});
	}
	else {
		// 중복 체크
		// 위에서 체크한 상품들 productCode
		let inputProductCode = [];
		$('.check:checked').each(function(i){	
			let value = $(this).val();
			inputProductCode.push(value);
		});
		
		// 아래에 있는 상품들 productCode
		let presentProductCode = [];
		for(var i=0; i < $('.eventProductRow').length; i++) {
			let value = $('.pcheck').eq(i).val();
			presentProductCode.push(value);
		}
		
		// 위에서 체크한 상품들 productCode가 아래 상품들 productCode와 중복되는지
		var cnt = 0
		for(var i=0; i<presentProductCode.length; i++){
			if(inputProductCode.indexOf(presentProductCode[i])!== -1){
				cnt++;
			}
		}
		
		// 하나도 안겹치면 아래에 넣기(DB다녀옴)
		if(cnt === 0){
			$.ajax({
				type:'post',
				url:'/mintProject/admin/service/addProduct',
				data: 'inputProductCode='+inputProductCode,
				dataType:'json',
				success: function(result){
					eventProductListTemp(result);
				},
				error: function(error){
					console.error(error);
				}
			});	
		} else {
			swal({
				text : '중복 추가할 수 없습니다',
				buttons : false,
				timer : 2000
			});
		}
	}
});


/* 글쓰기 버튼 클릭시 */
$('#eventWriteBtn').click(function(){	
	// productCode, discountRate 직렬화
	dataManufacturing();
	
	if($('#eventSubject').val() === ''){
		swal({
			text : '이벤트명을 입력해주세요',
			buttons : false,
			timer : 2000
		});
	}
	else if($('.eventProductRow').length === 0){
		swal({
			text : '이벤트 상품을 추가해주세요',
			buttons : false,
			timer : 2000
		});
	}
	else if($('.isPeriodOn').prop('checked')){
		if($('#datetimepickerStart').val() == '' || $('#datetimepickerEnd').val() == ''){
			swal({
				text : '이벤트 기간을 설정해주세요',
				buttons : false,
				timer : 2000
			});
		} else ajax(type);
	} else ajax(type);
});


/* 직렬화 이전 데이터 가공 */
// cart.jsp의 javascript 로직을 가져옴
function dataManufacturing(){
	let form = document.getElementById('eventWriteForm');
	let amount = $('.eventProductRow').length;
	
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
	form.appendChild(input1);
	
	// discountRate
	var input2 = document.createElement("input");
	input2.name = 'discountRate';
	input2.type = 'hidden';
	let discountRate = [];
	for(var i=0; i<amount; i++) {
		let value = $('.discountRate').eq(i).val();
		if(value.trim() === '' || value.trim() === null){
			value = 0;
		}
		discountRate.push(value);
	}
	input2.value = discountRate;
	form.appendChild(input2);
	
	// prevDiscountRate
	var input3 = document.createElement("input");
	input3.name = 'prevDiscountRate';
	input3.type = 'hidden';
	let prevDiscountRate = [];
	for(var i=0; i<amount; i++) {
		let value = $('.prevDiscountRate').eq(i).text().replace('%','');
		if(value.trim() === '' || value.trim() === null){
			value = 0;
		}
		prevDiscountRate.push(value);
	}
	input3.value = prevDiscountRate;
	form.appendChild(input3);
}


/* 등록,수정 ajax */
function ajax(type){ 
	var formData = new FormData($('#eventWriteForm')[0]);
	
	if(type === 'mod'){
		return $.ajax({
			type:'post',
			url:'/mintProject/admin/service/eventModify',
			data: formData,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success: function(){
				swal({
					text : '수정 완료',
					buttons : false,
					timer : 2000
				}).then(function(){					
					location.href='/mintProject/admin/service/event';
				});
			},
			error: function(error){
				swal({
					text : '수정 실패',
					buttons : false,
					timer : 2000
				});
				console.error(error);
			}
		});
	} else {
		return $.ajax({
			type:'post',
			url:'/mintProject/admin/service/eventWrite',
			data: formData,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success: function(){
				swal({
					text : '작성 완료',
					buttons : false,
					timer : 2000
				}).then(function(){
					location.href='/mintProject/admin/service/event';					
				});
			},
			error: function(error){
				swal({
					text : '작성 실패',
					buttons : false,
					timer : 2000
				});
				console.error(error);
			}
		});
	}
}

/* 이벤트 관리 리스트 이동 */
$('#eventListBtn').click(function(){	
	location.href='/mintProject/admin/service/event';
});

/* 상품 체크박스 컨트롤 */
$('#chkAll').click(function(){
	if($('#chkAll').prop('checked')) $('.check').prop('checked', true);
	else $('.check').prop('checked', false);
});

/* 이벤트 대상 상품 체크박스 컨트롤 */
$('#pchkAll').click(function(){
	if($('#pchkAll').prop('checked')) $('.pcheck').prop('checked', true);
	else $('.pcheck').prop('checked', false);
});

/* isPeriodOn 자동 변환 */
$('#datetimepickerStart').change(function(){
	$('.isPeriodOn:radio[value="1"]').attr('checked',true);
});
$('#datetimepickerEnd').change(function(){
	$('.isPeriodOn:radio[value="1"]').attr('checked',true);
});

/* 할인율 일괄 적용 (DB를 거치지 않음) */
$('#discountRateApplyBtn').click(function(){
	let rate = $('#eventRate').val();
	$('.discountRate').val(rate);
});

/* 선택 상품 리스트 삭제 (DB를 거치지 않음) */
$('#deleteEventProductBtn').click(function(){
	var cnt = $('.pcheck:checked').length; // 체크된 항목 갯수 구하기
	if(cnt===0) {
		swal({
			text : '삭제할 항목을 먼저 선택하세요',
			buttons : false,
			timer : 2000
		});
	}
	else {
		$('.pcheck:checked').parent().parent().remove();
		
	}
});
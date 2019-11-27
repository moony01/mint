let dateOption = '';

$().ready(function(){
	getOrderInfo(dateOption)
	.then(printOrderInfo)
	.catch();
});

function getOrderInfoByOption(btn){
	dateOption = btn.prev().val();
	getOrderInfo(dateOption)
	.then(printOrderInfo)
	.catch();
}

function getOrderInfo(dateOption){
	if(dateOption == '') dateOption = 'undefined'; // 날짜가 선택되지 않았음 -> undefined
	return $.ajax({
		type : 'POST',
		url : '/mintProject/shop/mypage/getOrderInfo',
		data : {'dateOption' : dateOption},
		dataType : 'json'
	});
}

function printOrderInfo(result){
	let list = result.list;
	
	$('.tb-orderInfo tr:gt(0)').remove();
	
	
	let $frag = $(document.createDocumentFragment());
	for(let i=0; i<list.length; i++){
		const {ORDERNUMBER,LOGTIME,STATUS,FPRICE} = list[i];
		let regexp = /\B(?=(\d{3})+(?!\d))/g;
		var fprice = FPRICE.toString().replace(regexp,','); 
		let status;
		if(STATUS == '0') status = '입금 전';
		else if(STATUS == '1') status = '입금 완료';
		else if(STATUS == '2') status = '배송 중';
		else if(STATUS == '3') status = '배송 완료';
		
		let orderInfo = `<tr class="tb-content">
							<td>${status}</td>
							<td style="cursor:pointer;" onclick="javascript:getOrderDetails($(this).text())">${ORDERNUMBER}</td>
							<td>${LOGTIME}</td>
							<td>${fprice} 원</td>
						</tr>`;
		
		$frag.append($(orderInfo));
	}
	$('.tb-orderInfo').append($frag);
}

function getOrderDetails(orderNumber){
	location.href="/mintProject/shop/mypage/myOrderDetails?ordernumber="+orderNumber;
}

/*$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/mintProject/shop/mypage/getOrderInfo',
		dataType : 'json',
		success : function(data){
			console.log(data);
			$.each(data.list, function(index,item){
				
			});
		},
		error : function(err){
			console.log(err);
		}
	});
});*/
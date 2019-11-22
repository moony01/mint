let dateOption = '';

$().ready(function(){
	getOrderInfo(dateOption)
	.then(printOrderInfo)
	.catch();
});

function getOrderInfoByOption(btn){
	dateOption = btn.parent().prev().val();
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
	
	$('.orderInfo-tb tr:gt(0)').remove();
	
	let $frag = $(document.createDocumentFragment());
	for(let i=0; i<list.length; i++){
		const {ORDERNUMBER,LOGTIME,STATUS} = list[i];
		
		let status;
		if(STATUS == '0') status = '배송시작전';
		else if(STATUS == '1') status = '배송중';
		else if(STATUS == '2') status = '배송완료';
		
		let orderInfo = `<tr class="qna-tb__view">
							<td>${status}</td>
							<td>${ORDERNUMBER}</td>
							<td>${LOGTIME}</td>
						</tr>`;
		
		$frag.append($(orderInfo));
	}
	$('.orderInfo-tb').append($frag);
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
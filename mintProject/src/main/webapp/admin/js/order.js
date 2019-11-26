/**
 * 191125 
 * 홍소연 (@hhhongso)
 */

let option = $('.select-box option:selected').val();
let searchValue;
let cbxOne;

//처음 로드될 때 ajax 로 리스트 불러오기 .
$().ready(function(){
	getList(option)
	.then(printList)
	.catch(printError);
});


//ajax로 옵션에 따라 list 가져옴. 
function getListByOption(select){
	option = select.children('option:selected').val();
	getList(option, searchValue)
	.then(printList)
	.catch(printError);	
}


function getListBySearch(btn){
	searchValue = btn.parent().prev().val();
	getList(option, searchValue)
	.then(printList)
	.catch(printError);
}

function getList(option, searchValue){
	if(searchValue == '') searchValue = 'undefined';
	return $.ajax({
		type: 'post',
		url: '/mintProject/admin/sales/order/'+searchValue+'/'+option,
		//data: {'pg':  pg},
		dataType: 'json',

	});
}

function printList(result){
	let pg = result.pg;
	let list = result.list;
	let totalArticle = result.totalArticle;
	let currentPage = pg;
	let addr = result.addr;
	
	$('.table-order tr:gt(0)').remove();
	$('.pagination li').remove();
	let $frag = $(document.createDocumentFragment());
	
	for (let i = 0; i < list.length; i++) {
		let {orderNumber, id, logtime, status} = list[i];
		logtime= logtime.slice(0,10);
		let status_str; 
		if(status == 0) { status_str = '입금 전';
		} else if(status == 1) { status_str = '입금 완료';
		} else if(status == 2){ status_str = '배송 중';
		} else if(status == 3) { 
			status_str = '배송 완료';
		}
		
		let order = `<tr>
			<td><input type="checkbox" class="checkbox-one" value="${status}"></td>
            <td><a href="/mintProject/admin/sales/orderView/${id}/${orderNumber}">${orderNumber}</a></td>
            <td>${id}</td>
            <td>${logtime}</td>
            <td><a class="status${status}" href="javascript:void(0)" onclick="updateOrderStatus('${id}', '${orderNumber}')">${status_str}</a></td>
        </tr>`;
		
		$frag.append($(order));
		
		
	}
	$('.table-order').append($frag);
	$('.status3').removeAttr('href');
	$('.status3').removeAttr('onclick');
	$('.status3').attr('class', 'nonClick');			
	
	//paging(totalArticle, currentPage, addr);

}


function updateOrderStatus(id, orderNumber){
	getUpdateOrderPage(id, orderNumber)
	.then(function(){
		getList(5)
		.then(printList)
		.catch(printError);
	})
	.catch(printError);
	
	
}

function getUpdateOrderPage(id, orderNumber){
	return $.ajax({
		method: 'post',
		url: '/mintProject/admin/sales/orderUpdate/'+id+'/'+orderNumber,
	});
}

//전체선택
$('.checkbox-all').on('change', function cbxChecked(){
	let cbxOne  = $('.checkbox-one');
	if(this.checked) {
		for (var i = 0; i < cbxOne.length; i++) {
			cbxOne.eq(i).prop('checked', true);
		}
	} else {
		for (var i = 0; i < cbxOne.length; i++) {
			cbxOne.eq(i).prop('checked', false);
		}
	}
	
});

function printError(err){
	console.log(err);
}
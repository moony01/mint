/**
 * 191125 
 * 홍소연 (@hhhongso)
 */

let option = $('.select-box option:selected').val();
let searchValue;
let cbxOne;
let pg; 

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

function getListByPaging(pg){
	getList(option, searchValue, pg)
	.then(printList)
	.catch(printError);	
	
}

function getList(option, searchValue, pg){
	if(searchValue == '') searchValue = 'undefined';
	return $.ajax({
		type: 'post',
		url: '/mintProject/admin/sales/order/'+searchValue+'/'+option,
		data: {'pg':  pg},
		dataType: 'json',

	});
}

function printList(result){
	pg = result.pg;
	let list = result.list;
	let totalArticle = result.totalArticle;
	let currentPage = pg;
	
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
			<td onclick="location.href='/mintProject/admin/sales/orderView/${id}/${orderNumber}'" style="cursor : pointer;">${orderNumber}</td>
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
	
	paging(totalArticle, currentPage);

}


function updateOrderStatus(id, orderNumber){
	swal({
		text: '정말 변경하시겠습니까? ',
		icon : 'warning',
		buttons : true
	}).then((value) => {
		if(value){
			getUpdateOrderPage(id, orderNumber)
			.then(function(){
				getList(5)
				.then(printList)
				.catch(printError);
			})
			.catch(printError);
			
		}
	});
	
	
}

function getUpdateOrderPage(id, orderNumber){
	return $.ajax({
		method: 'post',
		url: '/mintProject/admin/sales/orderUpdate/'+id+'/'+orderNumber,
	});
}

function printError(err){
	console.log(err);
}


//페이징 처리
function paging(totalArticle, currentPage){
	let pageBlock = 10;
	let pageSize = 10;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;

	if(endPage > totalPage) endPage = totalPage;

	if(startPage > pageBlock){
		$('.prev').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getListByPaging(' +(startPage-1)+ ')',
			text: '<'
		})).appendTo('.pagination');
	}

	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getListByPaging('+i+')',
			text: i
		})).appendTo('.pagination');
		
		if(i == currentPage) {
			$('.pg').attr('class', 'page-item active');
		} else {
			$('.pg').removeAttr('class', 'active');
		}	
	}
	
	if(endPage < totalPage) {
		$('.next').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getListByPaging('+(endPage+1)+')',
			text: '>'
		})).appendTo('.pagination');
	}

}
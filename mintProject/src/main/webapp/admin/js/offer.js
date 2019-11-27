/**
 * 191113
 * 홍소연(@hhhongso)
 */

//ajax로 처음 로드했을 때 list 가져옴. 
$().ready(function(){
	getSuggestBoard()
	.then(printgetSuggestBoard)
	.catch();
});

//ajax로 옵션에 따라 list 가져옴. 
function getSuggestBoardByOption(pg){	
	getSuggestBoard(pg)
	.then(printgetSuggestBoard)
	.catch();	
}

function getSuggestBoard(pg){	
	return $.ajax({
		type: 'post',
		url: '/mintProject/admin/service/getOffer',
		data: {'pg':  pg,
				'replyStatus': $('#replyStatus >option:selected').val()},
		dataType: 'json',

	});
}

function printgetSuggestBoard(result){
	let pg = result.pg;
	let list = result.list;
	let totalArticle = result.totalArticle;
	let currentPage = pg;
	let addr = result.addr;

	$('.table-offer tr:gt(0)').remove();
	$('.pagination li').remove();
	
	let $frag = $(document.createDocumentFragment());
	for (let i = 0; i < list.length; i++) {
		const {seq, category, subject, content, logtimeQ, id, replyStatus} = list[i];
		
		let date = new Date(logtimeQ);
		let parseDate = new Date(date - (date.getTimezoneOffset() * 60000)).toISOString().slice(0,10);
		
		let reply; 
		if(replyStatus == '0') {
			reply = '대기 중';
		} else {
			reply = '답변 완료'; 
		}
		let suggestBoard = `<tr>
								<td><input type="checkbox" name="" id=""></td>
					            <td>${seq}</td>
					            <td>${category}</td>
					            <td class="table--left"><a href="/mintProject/admin/service/offerAnswer?pg=${pg}&seq=${seq}">${subject}</a></td>
					            <td>${parseDate}</td>
					            <td>${id}</td>
								<td>${reply}</td>
								
					        </tr>`;
		
		$frag.append($(suggestBoard));
		
		
	}
	$('.table-offer').append($frag);
	paging(totalArticle, currentPage, addr);

}

$('.btn-reply').click(function(){
	let seq = $('#seq').val();
	let replyContent = $('#summernote').val();
	
	document.offerAnswerForm.method='post';
	document.offerAnswerForm.action='/mintProject/admin/service/updateReply';
	document.offerAnswerForm.submit();
});

//페이징 처리
function paging(totalArticle, currentPage, addr){
	let pageBlock = 5;
	let pageSize = 5;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;

	if(endPage > totalPage) endPage = totalPage;

	if(startPage > pageBlock){
		$('.prev').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getSuggestBoardByOption(' +(startPage-1)+ ')',
			text: '<'
		})).appendTo('.pagination');
	}

	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getSuggestBoardByOption('+i+')',
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
			onclick: 'getSuggestBoardByOption('+(endPage+1)+')',
			text: '>'
		})).appendTo('.pagination');
	}

}

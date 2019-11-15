
$().ready(function(){
	getProductQnaBoard()
	.then(printProductQnaBoard)
	.catch();
});

function getProductQnaBoardByOption(pg){
	getProductQnaBoard(pg)
	.then(printProductQnaBoard)
	.catch();
}

function getProductQnaBoard(pg){
	return $.ajax({
		type : 'post',
		url : '/mintProject/admin/service/getProductQna',
		data : {'pg' : pg, 'replyStatus' : $('#replyStatus >option:selected').val()},
		dataType: 'json',
	});
}

function printProductQnaBoard(result){
	let pg = result.pg;
	let list = result.list;
	let totalArticle = result.totalArticle;
	let currentPage = pg;
	let addr = result.addr;
	
	$('.table-productQna tr:gt(0)').remove();
	$('.pagination li').remove();
	
	let $frag = $(document.createDocumentFragment());
	for(let i=0; i<list.length; i++){
		const {seq,productCode,subject,content,id,logtimeQ,replyStatus,replyContent} = list[i]; 
		
		let reply;
		if(replyStatus == '0'){
			reply = '답변대기';
		} else {
			reply = '답변완료';
		}
		let productQnaBoard  = `<tr>
									<td>${seq}</td>
									<td>${productCode}</td>
									<td>${subject}</td>
									<td>${logtimeQ}</td>
									<td>${id}</td>
									<td>${reply}</td>
								</tr>`;
		$frag.append($(productQnaBoard));
	}
	$('.table-productQna').append($frag);
	paging(totalArticle,currentPage,addr);
	
}

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
			onclick: 'getProductQnaBoardByOption(' +(startPage-1)+ ')',
			//href: addr+'?pg='+(startPage-1),
			text: '<'
		})).appendTo('.pagination');
	}

	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			href: 'javascript:void(0)',
			onclick: 'getProductQnaBoardByOption('+i+')',
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
			onclick: 'getProductQnaBoardByOption('+(endPage+1)+')',
			//href: addr+'?pg='+(endPage+1),
			text: '>'
		})).appendTo('.pagination');
	}

}

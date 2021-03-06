
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
		const {SEQ,MAINSUBJECT,SUBJECT,CONTENT,ID,LOGTIMEQ,REPLYSTATUS,REPLYCONTENT} = list[i]; 
		
		let reply;
		if(REPLYSTATUS == '0'){
			reply = '답변대기';
		} else {
			reply = '답변완료';
		}
		let productQnaBoard  = `<tr class="subject_wrap" style="cursor : pointer" id="qna_${i}">
									<td>${SEQ}</td>
									<td>${MAINSUBJECT}</td>
									<td class="table--left">${SUBJECT}</td>
									<td>${LOGTIMEQ}</td>
									<td>${ID}</td>
									<td>${reply}</td>	
								</tr>`;
		if(reply=='답변완료'){
			productQnaBoard = productQnaBoard+`<tr class="content_wrap qna_${i}">
													<td colspan="6" style="text-align:left; padding : 10px;"><pre>${CONTENT}</pre></td>
												</tr>
												<tr class="content_wrap qna_${i}">
													<td colspan="6" style="text-align:left; padding : 10px;"><pre>${REPLYCONTENT}</pre></td>
												</tr>`;
		} else if(reply='답변대기'){
			productQnaBoard = productQnaBoard+`<tr class="content_wrap qna_${i}">
													<td colspan="6" style="text-align:left; padding : 10px;"><pre>${CONTENT}</pre></td>
												</tr>
												<tr class="content_wrap qna_${i}">
													<td colspan="6" style="text-align:center; padding : 10px;">
														<textarea style="width:100%; height:195px; resize:none;"></textarea><input type='button' value="답변등록" class="reply_btn" style="margin-top:10px;">
													</td>
												</tr>`;
		}
		
		$frag.append($(productQnaBoard));
	}
	$('.table-productQna').append($frag);
	paging(totalArticle,currentPage,addr);
	
	$('.content_wrap').hide();
	
	$('.subject_wrap').on({
		click : function(){
			var aaa = $(this).attr('id');
			$('.'+aaa).slideToggle();
		}
	})
	
	$('.reply_btn').on('click', function(){
		var seq = $(this).parent().parent().prev().prev().children(':first').text();
		var replyContent = $(this).prev().val();	
		$.ajax({
			type : 'post',
			url : '/mintProject/admin/service/productQna_reply',
			data : {'replyContent' : replyContent, 'seq' : seq},
			success : function(){
				swal('답변 등록')
				.then((values) =>{
					location.href="/mintProject/admin/service/productQna";
				});
			},
			error : function(err){
				console.log(err);
			}
		});
	});
	
}

//페이징 처리
function paging(totalArticle, currentPage, addr){
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

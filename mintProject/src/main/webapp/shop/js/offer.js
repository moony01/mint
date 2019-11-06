//제안 글쓰기 & 수정
$('.board-write__write-btn').click(function(){
	$('div[class^=div-offer-]').empty();
	let choice = document.querySelector(".board-write__subject-select").value;
	
	if(choice == '선택') $('.div-offer-category').append('카테고리 항목을 선택하세요. ').css('color', 'red');
	else if($('.board-write__subject-txt').val() == '') $('.div-offer-subject').append('제목을 입력하세요 ').css('color', 'red');
	else if($('#content').val() == '') alert('내용을 입력하세요. ');
	else {
		let formData = new FormData($('#offerWriteForm')[0]);
		$.ajax({
			type: 'post',
			url: '/mintProject/shop/service/offerWriteOk',
			data: formData,
			enctype: 'multipart/form-data',
			processData: false, 
			contentType: false, 
			dataType: 'text',
			success: function(data){
				location.href='/mintProject/shop/service/offer?pg='+data;
			},
			error: function(){}
		});
		
	}
	
});

//제안글 삭제
$('.btnDelete').click(function(){
	let seq = $(this).parent().parent().parent().prev().children(':first-child').text();
	console.log(seq);
	if(confirm('정말 삭제하시겠습니까? ')) {
		location.href='/mintProject/shop/service/offerDelete?seq='+seq;
	}
});
//페이징 처리
function paging(totalArticle, currentPage, addr){
	let pageBlock = 3;
	let pageSize = 3;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	

		if(endPage > totalPage) endPage = totalPage;

		if(startPage > pageBlock){
			$('.prev').append($('<a/>', {
				class: 'page-link', 
				href: addr+'?pg='+(startPage-1),
				text: '<'
			})).appendTo('.pagination');
		}

		for(i = startPage; i <= endPage ; i++) {
			$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
				class: 'page-link', 
				href: addr+'?pg='+i,
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
				href: addr+'?pg='+(endPage+1),
				text: '>'
			})).appendTo('.pagination');
		}
	
}
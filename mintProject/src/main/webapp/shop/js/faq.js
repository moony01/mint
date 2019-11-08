$(function(){
	const $table = $('.tb-fqa');
	
	/* AJAX */
	// 게시판 리스트 불러오기
	$.ajax({
		type:'post',
		url:'/mintProject/faqBoard/getFAQBoardList',
		data: 'pg='+$('#pg').val(),
		dataType:'json',
		success: function(result){
			getFAQList(result);
			$('.pagination').html(result.faqBoardPaging.pagingHTML);
		},
		error: function(error){
			console.error(error);
		}
	});
	
	/* FAQ게시물 리스트 테이블에 붙여넣기 */
	function getFAQList(result){
		let faqs = result.list;
		let $frag = $(document.createDocumentFragment());
		
		/* 예전 방법
		$.each(faqs, function(index, items){
			// data는 List<BoardDTO>로 들어온다
			$('<tr class=tb-content""/>').append($('<td/>',{
				// 글번호
				text: items.seq
			})).append($('<td/>',{
				// 카테고리
				text: items.category
			})).append($('<td/>',{
				// 제목
				text: items.subject
			})).appendTo($table);
		});
		*/
		
		// 구조분해할당, 템플릿 리터럴
		for(let i=0; i<faqs.length; i++){
			const {
                seq,
                category,
                subject,
                content
            } = faqs[i];
            
            let faqRow = `
            	<tr class="tb-content">
            		<td>${seq}</td>
	            	<td>${category}</td>
	            	<td>${subject}</td>
            	</tr>
            	<tr class="tb-view">
	                <td colspan="1"></td>
	                <td colspan="2">${content}</td>
            	</tr>
            `;
            $frag.append($(faqRow));
		}
		$table.append($frag);
	}
	
    const contents = document.querySelectorAll('.tb-content');
    const length = contents.length;
    console.log(contents.length);
    /* 제목 클릭시 content나타나기 : 그런데 왜 안되지*/
    for(let i=0; i<length; i++){
        contents[i].addEventListener('click',function(){
            const view = contents[i].nextElementSibling;
            view.classList.toggle('tb-on');
        });
    }

});
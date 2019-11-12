/**
 * faq.js
 * 
 * @version 1.2
 * @author LimChangHyun
 * 
 * 연동되는 파일들 : FAQBoardController.java ~ faqBoardMapper.xml
 * 				faq.jsp
 */


const $table = $('.tb-fqa');
let $frag = $(document.createDocumentFragment());

$(function(){
	
	/* AJAX */
	// 페이지 로딩시 게시판 리스트 불러오기
	$.ajax({
		type:'post',
		url:'/mintProject/shop/service/faq/getBoardList',
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
	
	
	// 카테고리 선택시, 검색시 게시판 리스트 불러오기
	$('#faq-select').change(function(){
		// 기존 테이블 비우기
		$('.tb-content').remove();
		$('.tb-view').remove();
		
		$.ajax({
			type:'post',
			url:'/mintProject/shop/service/faq/getSearchBoardList',
			data: $('#faqBoardForm').serialize(),
			dataType:'json',
			success: function(result){
				getFAQList(result);
				$('.pagination').html(result.faqBoardPaging.pagingHTML);
			},
			error: function(error){
				console.error(error);
			}
		});
	});
	
	$('.service__seach-btn').click(function(){
		// 기존 테이블 비우기
		$('.tb-content').remove();
		$('.tb-view').remove();
		
		$.ajax({
			type:'post',
			url:'/mintProject/shop/service/faq/getSearchBoardList',
			data: $('#faqBoardForm').serialize(),
			dataType:'json',
			success: function(result){
				getFAQList(result);
				$('.pagination').html(result.faqBoardPaging.pagingHTML);
			},
			error: function(error){
				console.error(error);
			}
		});
	});
	
	
	
	/* 처음 열어봤을 때부터 있던 건데 이 부분 무슨 용도인지 잘 모르겠음 */
    const contents = document.querySelectorAll('.tb-content');
    const length = contents.length;
   
    for(let i=0; i<length; i++){
        contents[i].addEventListener('click',function(){
            const view = contents[i].nextElementSibling;
            view.classList.toggle('tb-on');
        });
    }
    
});

/* FAQ게시물 리스트 테이블에 붙여넣기 */
function getFAQList(result){
	let faqs = result.list;
	
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
				<td>${
						(() => {
							if(faqs[i].category === '0') return '회원 문의';
							else if(faqs[i].category === '1') return '주문/결제';
							else if(faqs[i].category === '2') return '취소/교환/반품';
							else if(faqs[i].category === '3') return '배송 문의';
							else if(faqs[i].category === '4') return '쿠폰/적립금';
							else if(faqs[i].category === '5') return '서비스 이용 및 기타';
						})()
					}</td>
				<td id="faq_${seq}" onclick="faqView(this)">${subject}</td>
			</tr>
			<tr class="tb-view">
				<td></td>
				<td colspan="2">${content}</td>
			</tr>
			`;
		$frag.append($(faqRow));
	}
	$table.append($frag);
}

/* 제목 클릭시 내용 나타나기/사라지기 */
function faqView(content){
	if($(content).parent().next().css('display') === 'none'){
		$('.tb-view').css('display', 'none');
		$(content).parent().next().css('display', 'table-row');
	} else if($(content).parent().next().css('display') === 'table-row'){
		$('.tb-view').css('display', 'none');
	}
}
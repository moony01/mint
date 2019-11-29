/**
 * name : hanmoonhee
 */


//게시판 검색
document.getElementById('noticeSearchBtn').onclick = function(event, str) {
	
	if(str!='trigger'){
		$('input[name=pg]').val(1);
	}
	
	let check = $('#selectBox option:selected').val();
	let keyword = $('input[name=keyword]').val();
	let pg = $('input[name=pg]').val();
	
	console.log("select : "+check);
	console.log("keyword : "+keyword);
	console.log("pg : "+pg);
	
	if(keyword == '') {
		alert("검색할 단어를 입력해주세요.");
	}else {
		//console.log('else');
		$.ajax({
			type: 'POST',
			url: '/mintProject/shop/service/noticeBoardSearch',
			data: "check="+check+"&keyword="+keyword+"&pg="+pg,
			dataType: 'json',
			success: function(data){
				//console.log(JSON.stringify(data.list));
				$('.tb-content').remove();
				let board = data.list;
				let $frag = $(document.createDocumentFragment());
				for(let i=0; i<board.length; i++) {
					const {
						seq,
						subject,
						id,
						hit,
						content,
						fileName,
						logtime
					} = board[i];
					console.log("seq = "+seq);
					let customBoard = `
	            		<tr class="tb-content">
				            <td><input type="checkbox" class="boardCheck"></td>
				            <td>${seq }</td>
				            <td class="table--left">${subject }</td>
				            <td>${logtime }</td>
				            <td>${id }</td>
	            		</tr>
					`;
					$frag.append($(customBoard));
				}
				$('.table-bordered').append($frag);
				//페이징 html태그 불러오기
				$('.pagination').html(data.noticeBoardPaging.pagingHTML);
			},
			error: function(err){
				console.log(err);
			}
		});
	}
};

//게시판 검색 후 페이징처리
function noticeBoardSearchPaging(pg){	
	$('input[name=pg]').val(pg);
	$('#noticeSearchBtn').trigger('click','trigger');
}

let checkCnt = 0; //들어온 게시글 수
let chk_leng = 0; //체크한 게시글 수
let selBoard = 0; //삭제할 seq값

//게시글 각자선택
$('.boardCheck').on('click', function(){
	checkCount();
});

//게시글 전체선택
$('#allCheck').on('change', function(){
	if($(this).prop('checked')) 
		$(".boardCheck").prop("checked", true); 
	else
		$(".boardCheck").prop("checked", false);
	
	checkCount();
});

//checked동작, checkCnt
function checkCount() {
	let chk_obj = $('.boardCheck');
	checkCnt = chk_obj.length;
	let checked = 0;
	
	for(i=0; i<checkCnt; i++){
		if(chk_obj[i].checked){
			checked += 1;
		}
	}
	
	if(checked == chk_leng) { // 모든 상품이 체크 상태일 때, 상위의 [전체선택] 체크박스 라벨의 아이콘을 체크상태로 바꿈 
		$('#allCheck').prop("checked", true);
	}
	
	chk_leng = checked;
}

//선택삭제
function selectDeleteBoard() {
	console.log("체크한 게시글수 = "+chk_leng);
	
	for(i=0; i<checkCnt; i++) {
		
		if($('.boardCheck').eq(i).prop('checked') == true) {
			selBoard = $('.boardCheck').eq(i).parent().next().text();
			console.log(selBoard);
			
			$.ajax({
				type: 'POST',
				url: '/mintProject/admin/service/noticeBoardDelete',
				data: 'memId='+memId+'&seq='+selBoard,
				success: function(data){
					location.reload(true);
				},
				error: function(err){
					console.log(err);
				}
			});
			
		}
	}
}






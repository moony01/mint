/**
 * name : hanmoonhee
 */

//게시판 검색
document.getElementById('noticeSearchBtn').onclick = function(event, str) {
	if(str!='trigger') $('input[name=pg]').val(1);
	
	var count = $('input[name=check]:checked').length;
	var keyword = $('input[name=keyword]').val();
	
	if(count==0){
		alert("검색할 항목을 선택하세요");
	} else if(keyword==''){
		alert("검색할 단어를 입력해주세요")
	} else {
		$.ajax({
			type: 'post',
			url: '/mintProject/notice/noticeBoardSearch',
			data: $('#noticeBoardSearchForm').serialize(),
			dataType: 'json',
			success: function(data){
				//console.log(JSON.stringify(data));
				$('tr.tb-content').remove();
				
				$.each(data.list, function(index, items){
					$('<tr class="tb-content"/>')
					.append($('<td/>',{
						align: 'center',
						text: items.seq
					}))
					
					.append($('<td/>',{})
					.append($('<a/>',{
						href: 'javascript:void(0)',
						text: items.subject,
						id: items.seq+'',
						class: 'sub_click_view'
					})))
						
					.append($('<td/>',{
						align: 'center',
						text: items.id
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.logtime
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.hit
					}))
					.appendTo($('.tb-notice'));
				});
				
				//페이징 html태그 불러오기
				$('.pagination').html(data.noticeBoardPaging.pagingHTML);
			},
			error: function(err){
				console.log(err);
			}
		});
	}
}

//게시판 검색 후 페이징처리
function noticeBoardSearchPaging(pg){	
	$('input[name=pg]').val(pg);
	$('#noticeSearchBtn').trigger('click','trigger');
}

//로그인 여부 체크 후 noticeBoardView 접속
$('.tb-notice').on('click', '.sub_click_view', function(){
	//console.log($(this).prop('tagName'));
	//console.log($(this).text());
	
/*	if(data.memId!=null){
		//alert('로그인 후 이용가능합니다.');
	} else {*/
		location.href='/mintProject/notice/noticeBoardView?seq='
			+$(this).attr('id')+'&pg='+$('input[name=pg]').val();
	/*}*/
	
});





















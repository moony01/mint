<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
    <h2 class="out">상품제안 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="">상품제안 관리</a>
    <span class="ar-title">></span>
    <a href="" class="now-title">글 읽기</a>                
</div>
<div class="container">
    <table class="table table-bordered write-tb">
        <tr>
            <th>카테고리</th>
            <td colspan="3" id="faqCategory" class="table--left"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3" id="faqSubject" class="table--left"></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td id="faqId"></td>
            <th>작성일</th>
            <td id="faqLogtime"></td>
        </tr>
        <tr class="write-tb__content">
            <th>내용</th>
            <td colspan="3" id="faqContent" class="table--left">

            </td>
        </tr>
      
    </table>
    <div class="write-tb__btns">
        <button type="button" class="btn btn-primary btn-lg">수정하기</button>
        <button type="button" class="btn btn-success btn-lg">목록으로</button>
    </div>   
</div>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'/mintProject/admin/getFAQView',
		data: 'seq=${seq}&pg=${pg}',
		dataType: 'json', 
		success: function(result){
			let dto = result.dto;
			let category = getCategory(dto.category);
			
			$('#faqCategory').append($('<p/>',{text:category}));
			$('#faqSubject').append($('<p/>',{text:dto.subject}));
			$('#faqId').append($('<p/>',{text:dto.id}));
			$('#faqContent').append('<p>'+dto.content+'</p>');
			
			/* 
			if(result.memId == result.dto.id){
				$('#boardViewBtnSpan').show();
			} else {
				$('#boardViewBtnSpan').hide();
			}
			*/
		},
		error: function(e){
			console.log(e);
		}
	});	
});


function getCategory(value){
	if(value === '0') return '회원 문의';
	else if(value === '1') return '주문/결제';
	else if(value === '2') return '취소/교환/반품';
	else if(value === '3') return '배송 문의';
	else if(value === '4') return '쿠폰/적립금';
	else if(value === '5') return '서비스 이용 및 기타';
}
</script>
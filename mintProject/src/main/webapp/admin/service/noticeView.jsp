<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
    <h2 class="out">공지사항 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="">공지사항 관리</a>
    <span class="ar-title">></span>
    <a href="" class="now-title">글 읽기</a>                
</div>
<div class="container">
    <table class="table table-bordered write-tb">
        <tr>
            <th>제목</th>
            <td colspan="3" id="noticeSubject" class="table--left"></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td id="noticeId"></td>
            <th>작성일</th>
            <td id="noticeLogtime"></td>
        </tr>
        <tr class="write-tb__content">
            <th>내용</th>
            <td id="noticeContent" colspan="3" class="table--left">
                
            </td>
        </tr>
      
    </table>
    <div class="write-tb__btns">
        <button type="button" id="notModifyBtn" class="btn btn-primary btn-lg">수정하기</button>
        <button type="button" class="btn btn-success btn-lg" onClick="location.href='/mintProject/admin/service/notice?pg=1'">목록으로</button>
    </div>   
</div>

<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getNoticeView',
		data: 'seq=${seq}&pg=${pg}',
		dataType: 'json', 
		success: function(result){
			let dto = result.dto;
			
			$('#noticeSubject').append($('<p/>',{text:dto.subject}));
			$('#noticeId').append($('<p/>',{text:dto.id}));
			$('#noticeContent').append('<p>'+dto.content+'</p>');
			$('#noticeLogtime').append('<p>'+dto.logtime+'</p>');
			
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

$('#notModifyBtn').click(function(){
	location.href='/mintProject/admin/service/noticeModifyForm?seq=${seq}&pg=${pg}&type=mod';
});
</script>


















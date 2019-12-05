<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
    <h2 class="out">FAQ 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="">FAQ 관리</a>
    <span class="ar-title">></span>
    <a href="" class="now-title">게시판 등록/수정</a>                
</div>
<div class="container">
	<form id="faqAdminWriteForm">
		<%-- 수정용 pg, seq --%>
	   	<input type="hidden" name="pg" value="${pg}">
		<input type="hidden" name="seq" value="${seq}">
	
	    <table class="table table-bordered write-tb">
	        <tr>
	            <th>카테고리</th>
	            <td class="table--left">
	                <select name="category" id="faqWriteCategory">
	                    <option value="">선택</option>
	                    <option value="0">회원 문의</option>
	                    <option value="1">주문/결제</option>
	                    <option value="2">취소/교환/반품</option>
	                    <option value="3">배송 문의</option>
	                    <option value="4">쿠폰/적림금</option>
	                    <option value="5">서비스 이용 및 기타</option>
	                </select>
	            </td>
	        </tr>
	        <tr>
	            <th>제목</th>
	            <td class="table--left"><input type="text" name="subject" id="faqWriteSubject" class="write-tb__input-txt"></td>
	        </tr>
	        
	        <tr class="write-tb__content">
	            <th>내용</th>
	            <td class="table--left">
	                <textarea name="content" id="summernote"></textarea>
	            </td>
	        </tr>
	    </table>
    </form>
    <div class="write-tb__btns">
        <button type="button" id="faqWriteBtn" class="btn btn-primary btn-lg">글쓰기</button>
        <button type="button" id="faqListBtn" class="btn btn-success btn-lg">목록으로</button>
    </div>   
</div>
<script>

$(document).ready(function(){
	// modify일시 type이 mod로 넘어옴
	let type = '"${type}"';
	   if(type === '"mod"'){
		$('#faqWriteCategory').val(${dto.category});
		$('#faqWriteSubject').val(`${dto.subject}`);
		$('#summernote').val(`${dto.content}`);
	}
	  	
	$('#summernote').summernote({
	    placeholder:"내용을 입력해주세요",
	    height: 450,                 // set editor height
	    minHeight: null,             // set minimum height of editor
	    maxHeight: null,             // set maximum height of editor
	    focus: true   
	});
});
   
// 글쓰기 버튼 클릭시
/* 유효성 검사 alert로 해놓긴 했는데 div나 다른 방식으로 바꿀 수 있음  
 * swal로 바꿨습니다
 */
$('#faqWriteBtn').click(function(){
	let type = '"${type}"';
	if($('#faqWriteCategory').val() === ''){
		swal({
			text : '카테고리 선택을 해주세요',
			buttons : false,
			timer : 2000
		});
	}
	else if (!$('#faqWriteSubject').val()){
		swal({
			text : '제목을 입력 해주세요',
			buttons : false,
			timer : 2000
		});
	}
	else if (!$('#summernote').val()){
		swal({
			text : '내용을 입력 해주세요',
			buttons : false,
			timer : 2000
		});
	}
	else {
		if(type === '"mod"'){
			$.ajax({
				type:'post',
				url:'/mintProject/admin/service/faqModify',
				data: $('#faqAdminWriteForm').serialize(),
				success: function(){
					swal({
						text : '수정 완료!',
						buttons : false,
						timer : 2000
					});
					location.href='/mintProject/admin/service/faq?pg=${pg}';
				},
				error: function(error){
					swal({
						text : '수정 실패!',
						buttons : false,
						timer : 2000
					});
					console.error(error);
				}
			});
		} else {
			$.ajax({
				type:'post',
				url:'/mintProject/admin/service/faqWrite',
				data: $('#faqAdminWriteForm').serialize(),
				success: function(){
					swal({
						text : '작성 완료!',
						buttons : false,
						timer : 2000
					}).then(function(){
						location.href='/mintProject/admin/service/faq';	
					});
				},
				error: function(error){
					swal({
						text : '작성 실패!',
						buttons : false,
						timer : 2000
					});
					console.error(error);
				}
			
			});
		}
	}
});

// 목록 이동
$('#faqListBtn').click(function(){
	location.href='/mintProject/admin/service/faq?pg=${pg}';
});

</script>

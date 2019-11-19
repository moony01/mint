<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="productQnaWriteForm" method="post" action="/mintProject/shop/service/productQnaWrite">
<input type="hidden" id="productCode" name="productCode" value="${productCode }">
<div class="product-write">
    <div class="product-write__tit">
        상품 Q&A 
    </div>
    <table class="write-tb">
        <tr>
            <th class=size-2>작성자</th>
            <td class="size-10">
                <input type="text" name="id" value="${memberDTO.id }" readonly> 
            </td>
        </tr>
        <tr>
            <th class=size-2>이메일</th>
            <td class="size-10">
                <input type="text" name="email" value="${memberDTO.email }" readonly> 
            </td>
        </tr>
        <tr>
            <th class=size-2>작성자</th>
            <td class="size-10">
                <input type="text" name="phone" value="${memberDTO.tel }" readonly> 
            </td>
        </tr>
        <tr>
            <th class=size-2>비밀글</th>
            <td class="size-10">
                <label for="" class="check-label">
                    <input type="checkbox" class="check-box" name="secretStatus" id="secretStatus">
                </label>비밀글 
            </td>
        </tr>
        <tr>
            <th class=size-2>제목</th>
            <td class="size-10 subject">
                <input type="text" name="subject" id="subjejct">
            </td>
        </tr>
        <tr class="content">
            <td colspan="2">
                <textarea name="summernote" id="summernote" style="resize: none;"></textarea>
            </td>
        </tr>
    </table>
    <div class="re-btn-group">
        <button class="btn-exit">취소</button>
        <input type="button" class="btn-write" id="productQna_write_btn" value="등록">
    </div>
</div>
</form>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
    $('#summernote').summernote({
        placeholder:"내용을 입력해주세요",
        height: 500,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true,
        marginTop:10,
        lang : 'ko-KR', //  기본 메뉴언어 US->KR로 변경
	   	disableResizeEditor : true,
	   	callbacks: {
	          onImageUpload: function(files, editor, welEditable) {
	        	  sendFile(files[0], this); 
	         }
	   	}
    });
});

/* summernote에서 이미지 업로드시 실행할 함수 */
function sendFile(file, editor){
	/* 파일 전송을 위한 폼생성 */
	data = new FormData();
	data.append('uploadFile', file);
	$.ajax({ // ajax를 통해 파일 업로드 처리
		data : data,
		type : 'POST',
		url : '/mintProject/shop/service/imageUpload',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		dataType : 'text',
		success : function(data){
			$(editor).summernote('editor.insertImage', '../storage/member/productQna/'+data);
		},
		error : function(err){
			console.log(err);
		}
	});
}

$('#productQna_write_btn').click(function(){
	if($('#summernote').val()=='' || $('#subject').val()==''){
		swal('제목과 내용을 입력해주세요');
	} else {
		if($('.check-box').prop('checked')){
			$('#secretStatus').val('1');
		} else {
			$('#secretStatus').val('0');
		}
		$('form[id=productQnaWriteForm]').submit();
	}
});

const checkLabel = document.querySelector(".check-label");
const checkBox =document.querySelector(".check-box");

checkLabel.addEventListener("click",function(){
    checkBox.chked = true;
    $('#secretStatus').prop('checked',true);
    checkLabel.classList.toggle("checked");
    
});
</script>
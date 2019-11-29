<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
     <h2 class="out">faq 관리</h2>
     <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
     <span class="ar-title">></span>        
     <a href="">공지사항 관리</a>
     <span class="ar-title">></span>
     <a href="" class="now-title">게시판 등록</a>                
 </div>
 <div class="container">
 	<form id="noticeBoardWriteForm">
	   	<input type="hidden" name="pg" value="${pg}">
		<input type="hidden" name="seq" value="${seq}">
 	     <table class="table table-bordered write-tb">
	         <tr>
	             <th>제목</th>
	             <td class="table--left"><input type="text" name="subject" id="subject" class="write-tb__input-txt"></td>
	         </tr>
	         
	         <tr class="write-tb__content">
	             <th>내용</th>
	             <td class="table--left">
	                 <textarea name="content" id="summernote"></textarea>
	             </td>
	         </tr>
	         
 	         <!--<tr>
	         	<th>이미지</th>
	         	<td class="table--left">
	            	<div class="file-container">
	            		<img id="preview-thumbnail-img" src="http://icons.iconarchive.com/icons/blackvariant/button-ui-system-apps/1024/Preview-2-icon.png" width="150px;" height="150px;"/>
	            		<div class="cover">
							<input id="thumbnail-img" name="thumbnail_img" accept=".jpg, .jpeg, .png" type="file" onchange="preview(this)">
							<label for="thumbnail-img" class="img-upload-btn">이미지 업로드</label>
						</div>
	            	</div> 
	         	</td>
	         </tr> -->
	     </table>
	     <div class="write-tb__btns">
	         <button type="button" class="btn btn-primary btn-lg" onClick="noticeBoardWrite()">글쓰기</button>
	         <button type="button" class="btn btn-success btn-lg" onClick="location.href='/mintProject/admin/service/notice?pg=1'">목록으로</button>
	     </div> 
 	</form>
  
 </div>
<script type="text/javascript" src="/mintProject/admin/js/noticeWrite.js"></script>
<script>
let subject = '';
let content = '';

   $(document).ready(function(){

	   
		// modify일시 type이 mod로 넘어옴
		let type = '"${type}"';
		   if(type === '"mod"'){
			$('#subject').val(`${dto.subject}`);
			$('#summernote').val(`${dto.content}`);
		}
	   
       $('#summernote').summernote({
           placeholder:"내용을 입력해주세요",
           height: 450,                 // set editor height
           minHeight: null,             // set minimum height of editor
           maxHeight: null,             // set maximum height of editor
           focus: true   
       });
   })

function noticeBoardWrite() {
	let type = '"${type}"';
	
	let subject = $('#subjectWrite').val();
	let content = $('#summernote').text();
	
	console.log('subject = '+subject);
	console.log('content = '+content);
	
	if(type === '"mod"'){
		$.ajax({
			type:'post',
			url:'/mintProject/admin/service/noticeBoardModify',
			data: $('#noticeBoardWriteForm').serialize(),
			success: function(){
				alert('수정 완료!');
				location.href='/mintProject/admin/service/notice?pg=${pg}';
			},
			error: function(error){
				alert('수정 실패!');
				console.error(error);
			}
		});
	} else {
		$.ajax({
			type: 'post',
			url: '/mintProject/admin/service/noticeBoardWrite',
			data: $('#noticeBoardWriteForm').serialize(),
			success: function() {
				alert("작성완료");
				location.href='/mintProject/admin/service/notice?pg=1';
			},
			error: function(error) {
				alert("작성실패");
				console.error(error);
			}
		});
	}
}
   
   function preview(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				if(input.id=='thumbnail-img'){
					$('#preview-thumbnail-img').attr('src', e.target.result).width(150).height(150); 
				}
				
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

















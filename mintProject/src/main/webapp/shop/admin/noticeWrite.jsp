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
     <table class="table table-bordered write-tb">
         <tr>
             <th>제목</th>
             <td class="table--left"><input type="text" class="write-tb__input-txt"></td>
         </tr>
         
         <tr class="write-tb__content">
             <th>내용</th>
             <td class="table--left">
                 <textarea name="" id="summernote"></textarea>
             </td>
         </tr>
     </table>
     <div class="write-tb__btns">
         <button type="button" class="btn btn-primary btn-lg">글쓰기</button>
         <button type="button" class="btn btn-success btn-lg">목록으로</button>
     </div>   
 </div>
 <script>
    $(document).ready(function(){
        $('#summernote').summernote({
            placeholder:"내용을 입력해주세요",
            height: 450,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true   
        });
    })
</script>
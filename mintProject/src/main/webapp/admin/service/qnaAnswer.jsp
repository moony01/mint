<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#content{
	margin-top: 15px;
    vertical-align: top;
    border: 0px;
    margin-bottom: 15px;
    width: 990px;
    height: 150px;
    background-color: #fff;
    overflow: visible;
}
</style>
    
<div class="main__title">
    <h2 class="out">qna 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="">1:1문의 관리</a>
    <span class="ar-title">></span>
    <a href="" class="now-title">게시판 관리</a>                
</div>
<div class="container">
    <table class="table table-bordered write-tb">
        <tr>
            <th colspan="1" >제목</th>
            <td colspan="3" class="table--left">${qndBoardDTO.subject }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${qndBoardDTO.id}</td>
            <th>작성일</th>
            <td><fmt:formatDate value="${qndBoardDTO.logtimeQ}" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <th>카테고리</th>
            <c:choose>
				<c:when test="${qndBoardDTO.category == '1'}"><td>배송지연/불만</td></c:when>
				<c:when test="${qndBoardDTO.category == '2'}"><td>무료배송</td></c:when>
				<c:when test="${qndBoardDTO.category == '3'}"><td>반품문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '4'}"><td>A/S문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '5'}"><td>환불문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '6'}"><td>주문결제문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '7'}"><td>회원정보문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '8'}"><td>취소문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '9'}"><td>교환문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '10'}"><td>상품정보문의</td></c:when>
				<c:when test="${qndBoardDTO.category == '11'}"><td>기타문의</td></c:when>
			</c:choose>
            <th>주문번호</th>
            <td>${qndBoardDTO.orderNumber}</td>
        </tr>
        <tr class="write-tb__content">
            <th>내용</th>
            <td colspan="3" class="table--left">
                <c:if test="${qndBoardDTO.fileName != null }">
           			<br>
           			<img alt="" src="/mintProject/shop/storage/member/qnaboard/${qndBoardDTO.fileName}" width="200px" height="250px">
           			<br><br>
           		</c:if>
           		<pre>${qndBoardDTO.content}</pre>
            </td>
        </tr>
        
        <tr class="write-tb__answer">
            <th>답변하기</th>
            <td colspan="3" class="table--left">
               <!--  <textarea name="" id="summernote"></textarea> -->
                <form name="adminQnaReplyUpdate" action = "/mintProject/admin/service/adminQnaReplyUpdate" method="post">
	                <div class="board-write__content">
	                	<input type="hidden" name="pg" value="${pg}">
	                	<input type="hidden" name="seq" value="${qndBoardDTO.seq}">
	                    <textarea name="content" id="content">${qndBoardDTO.replyContent}</textarea>
	                </div>
                </form>
            </td>
        </tr>
    </table>
    <div class="write-tb__btns">
        <button type="button" class="btn btn-primary btn-lg" id="goReply">답변하기</button>
        <button type="button" class="btn btn-success btn-lg" id="goQnaList">목록으로</button>
        <button type="button" class="btn btn-success btn-lg" id="deleteQna" style="background:red;">삭제</button>
    </div>   
</div>
<script>
 $(document).ready(function(){
	/*  $('#summernote').summernote({
	        placeholder:"내용을 입력해주세요",
	        height: 400,                 // set editor height
	        minHeight: null,             // set minimum height of editor
	        maxHeight: null,             // set maximum height of editor
	        focus: true,
	        callbacks: {
		          onImageUpload: function(files, editor, welEditable) {
		        	  sendFile(files[0], this); 
		         }
		   	}
	    }); */
 })

 //목록으로 버튼 클릭 시
 $("#goQnaList").click(function(){
	 location.href = "/mintProject/admin/service/getAdminQnaBoardList?selectGubun=9&pg=1";
 });
 
 //삭제하기 버튼 클릭 시
 $("#deleteQna").click(function(){
	 swal({
			text : '정말로 삭제하시겠습니까?',
			icon : 'warning',
			showConfirmButton : true
		}).then(function(isConfirm){
			if(isConfirm){
		 		location.href="/mintProject/admin/service/adminQnaDelete?seq="+${qndBoardDTO.seq};
			}
		});
	 
 });
 
 //답변 버튼 클릭 시 
  $("#goReply").click(function(){
	 if($("#content").val() == ""){
		 swal({
			text : '답변 내용을 입력해주세요',
			buttons : false,
			timer : 2000
			});
	 }else{
		 document.adminQnaReplyUpdate.submit();
	 }
 });
 
 
    
/* function sendFile(file, editor){
	data = new FormData();
	data.append('uploadFile', file);
	$.ajax({ // ajax를 통해 파일 업로드 처리
		data : data,
		type : 'POST',
		url : '/mintProject/admin/qnaImageUpload',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		dataType : 'text',
		success : function(data){
			$(editor).summernote('editor.insertImage', '/mintProject/shop/storage/mint/qnaboard/'+data);
		},
		error : function(err){
			console.log(err);
		}
	});
} */
    
    
    
    
</script>
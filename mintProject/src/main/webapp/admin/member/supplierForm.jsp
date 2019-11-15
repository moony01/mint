<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.img-upload-btn {
 	/* border: 1px solid #45b8ac;
	border-radius: 20px; */ 
	padding-top: 5px;
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 5px; 
	border: 1px solid black;
}
.join-title{
    line-height: 40px;
    width: 120px;
}
</style>   
<form name="supplierForm" method="" action="" >
	<div class="main__title">
	    <h2 class="out">회원 관리</h2>
	    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>회원</span></a>
	    <span class="ar-title">></span>        
	    <a href="">판매자 관리</a>
	    <span class="ar-title">></span>
	    <a href="" class="now-title">판매자 등록</a>                
	</div>
	<div class="container">
	    <table class="table table-bordered write-tb">
	        <tr>
	            <th>대분류</th>
	            <td class="table--left">
	                <select name="category" id="category" class="main-category">
	                    <option value="" id="none">선택</option>
	                    <option value="101" id="farmFood">농산물</option>
	                    <option value="102" id="seaFood">수산물</option>
	                    <option value="103" id="meat">축산물</option>
	                    <option value="104" id="general">일반식품</option>
	                    <option value="105" id="sideDish">반찬류</option>
	                </select>
	            </td>
	        </tr>
	    
	        <tr>
	            <th>사업자 번호</th>
	            <td class="table--left">
	                <input type="text" name="supplierCode">
	            </td>
	        </tr>
	       
	        <tr>
	            <th>상호명</th>
	            <td class="table--left">
	                <input type="text" name="supplierId" width="100px">
	            </td>
	        </tr>
	        
	        <tr>
	            <th>연락처</th>
	            <td class="table--left">
	            <input type="text" name="tel">
	            </td>
	        </tr>
	        
	         <tr>
	            <th>주소</th>
	            <td class="table--left">
	                <label for="thumbnail-img" class="img-upload-btn btn-addr">주소 검색</label>
	                <div class="join-title"></div>
	                <input type="text" class="join-input input--full" name="addr1" id="addr1" readonly style="width: 460px;">
	                <div class="join-title"></div>
	                <input type="text" class="join-input input--full" name="addr2" id="addr2" placeholder="세부 주소를 입력해주세요" style="width: 460px;">
	            </td>
	        </tr>
	        
	        <tr>
	            <th>설명</th>
	            <td class="table--left"><textarea name="description" id="summernote"></textarea></td>
	        </tr>
	        
	    </table>
	    <div class="write-tb__btns">
	        <button type="button" class="btn btn-primary btn-lg" id="write-btn">등록</button>
	        <button type="button" class="btn btn-success btn-lg">취소</button>
	    </div>   
	</div>
</form>
<script src="/mintProject/admin/js/supplier.js"></script>
<script>
$(document).ready(function(){
    $('#summernote').summernote({
        placeholder:"내용을 입력해주세요",
        height: 200,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true   
    });
});
</script>
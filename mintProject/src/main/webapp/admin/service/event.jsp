<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

</style>
<form id="eventWriteForm">
	<div class="main__title">
	    <h2 class="out">이벤트 관리</h2>
	    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
	    <span class="ar-title">></span>        
	    <a href="">상품 관리</a>
	    <span class="ar-title">></span>
	    <a href="" class="now-title">상품 등록</a>                
	</div>
	<div class="container">
	    <table class="table table-bordered write-tb">
	        <tr>
	            <th>대분류</th>
	            <td class="table--left">
	                <select name="mainCategory" id="mainCategory" class="main-category">
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
	            <th>소분류</th>
	            <td class="table--left">
	                <!-- 아이디는 자바스크립트용 클래스는 css 용 -->
	                <select name="subCategory" id="subCategory" class="sub-category">
	                    
	                </select>
	            </td>
	        </tr>
	        <tr>
	            <th>사업자 아이디</th>
	            <td class="table--left">
	                <input type="text" name="supplierId">
	            </td>
	        </tr>
	        <tr>
	            <th>재고 수량</th>
	            <td class="table--left">
	            <input type="text" name="stock">
	            </td>
	        </tr>
	        <tr>
	            <th>큰 제목</th>
	            <td class="table--left"><input type="text" name="mainSubject"></td>
	        </tr>
	        <tr>
	            <th>소 제목</th>
	            <td class="table--left"><input type="text" name="subSubject"></td>
	        </tr>
	        <tr class="write-tb__content">
	            <th>상품 대표 이미지</th>
	            <td class="table--left">
	            	<div class="file-container">
	            		<img id="preview-thumbnail-img" src="http://icons.iconarchive.com/icons/blackvariant/button-ui-system-apps/1024/Preview-2-icon.png" width="150px;" height="150px;"/>
	            		<div class="cover">
							<input id="thumbnail-img" name="thumbnail_img" accept=".jpg, .jpeg, .png" type="file" onchange="preview(this)">
							<label for="thumbnail-img" class="img-upload-btn">이미지 업로드</label>
						</div>
	            	</div>  
	            </td>
	        </tr>
	        <tr>
	            <th>가격</th>
	            <td class="table--left">
	                <input type="text" name="price">
	            </td>
	        </tr>
	        <tr>
	            <th>판매 단위</th>
	            <td class="table--left">
	                <input type="text" name="unit">
	            </td>
	        </tr>
	        <tr>
	            <th>중량 용량</th>
	            <td class="table--left">
	                <input type="text" name="weight">
	            </td>
	        </tr>
	        <tr>
	            <th>포장 타입</th>
	            <td class="table--left">
	                <input type="text" name="packageType">
	            </td>
	        </tr>
	        <tr>
	            <th>안내 사항</th>
	            <td class="table--left"><input type="text" class="write-tb__input-txt" name="information"></td>
	        </tr>
	        
	        <tr class="write-tb__content">
	            <th>상품 설명</th>
	            <td class="table--left">
	                <textarea name="description" id="description"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <th>상품 이미지</th>
	            <td class="table--left">
	            	<div class="file-container">
	            		<img id="preview-product-img" src="http://icons.iconarchive.com/icons/blackvariant/button-ui-system-apps/1024/Preview-2-icon.png" width="150px;" height="150px;"/>
	            		<div class="cover">
							<input id="product-img" name="product_img" accept=".jpg, .jpeg, .png" type="file" onchange="preview(this)">
							<label for="product-img" class="img-upload-btn">이미지 업로드</label>
						</div>
	            	</div>  
	            </td>
	        </tr>
	        <tr class="write-tb__content">
	            <th>상세 정보</th>
	            <td class="table--left">
	                <textarea name="details" id="info"></textarea>
	            </td>
	        </tr>
	    </table>
	    <div class="write-tb__btns">
	        <button type="button" class="btn btn-primary btn-lg" id="write-btn">글쓰기</button>
	        <button type="button" class="btn btn-success btn-lg">목록으로</button>
	    </div>   
	</div>
</form>
<script>

</script>
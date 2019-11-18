<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="product-write">
    <div class="product-write__tit">
        상품 Q&A 
    </div>
    <table class="write-tb">
        <tr>
            <th class=size-2>작성자</th>
            <td class="size-10">
                <input type="text" name="name" value="하이루" readonly> 
            </td>
        </tr>
        <tr>
            <th class=size-2>이메일</th>
            <td class="size-10">
                <input type="text" name="email" value="ccc123@naver.com" readonly> 
            </td>
        </tr>
        <tr>
            <th class=size-2>작성자</th>
            <td class="size-10">
                <input type="text" name="phone" value="01012341234" readonly> 
            </td>
        </tr>
        <tr>
            <th class=size-2>비밀글</th>
            <td class="size-10">
                <label for="" class="check-label">
                    <input type="checkbox" class="check-box" name="" id="">
                </label>비밀글 
            </td>
        </tr>
        <tr>
            <th class=size-2>제목</th>
            <td class="size-10 subject">
                <input type="text" name="subject" id="">
            </td>
        </tr>
        <tr class="content">
            <td colspan="2">
                <textarea name="" id="summernote"></textarea>
            </td>
        </tr>
    </table>
    <div class="re-btn-group">
        <button class="btn-exit">취소</button>
        <button class="btn-write">확인</button>
    </div>
</div>
<script>
$(document).ready(function(){
    $('#summernote').summernote({
        placeholder:"내용을 입력해주세요",
        height: 300,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true,
        marginTop:10,   
    });
});

const checkLabel = document.querySelector(".check-label");
const checkBox =document.querySelector(".check-box");

checkLabel.addEventListener("click",function(){
    checkBox.chked = true;
    checkLabel.classList.toggle("checked");
    
});
</script>
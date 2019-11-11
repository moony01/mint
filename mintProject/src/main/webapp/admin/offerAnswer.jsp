<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
    <h2 class="out">상품제안 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="">>상품제안 관리</a>
    <span class="ar-title">></span>
    <a href="" class="now-title">게시판 답변</a>                
</div>
<div class="container">
    <table class="table table-bordered write-tb">
        <tr>
            <th>카테고리</th>
            <td colspan="3" class="table--left">배송지연/불만</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3" class="table--left">안녕하세요 반갑습니다 우엉이 먹고싶은데 어떻게 할까요??</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>민트</td>
            <th>작성일</th>
            <td>2019-11-07</td>
        </tr>
        <tr class="write-tb__content">
            <th>내용</th>
            <td colspan="3" class="table--left">
                <p>asd</p>
                <p>asd</p>
                <p>asd</p>
                <p>asd</p>
                <p>asd</p>
                <p>asd</p>
                <p>asd</p>
                <p>asd</p>
            </td>
        </tr>
        <tr class="write-tb__answer">
            <th>답변하기</th>
            <td colspan="3" class="table--left">
                <textarea name="" id="summernote"></textarea>
            </td>
        </tr>
    </table>
    <div class="write-tb__btns">
        <button type="button" class="btn btn-primary btn-lg">답변하기</button>
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
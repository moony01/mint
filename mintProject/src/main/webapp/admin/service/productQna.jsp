<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
pre {
	overflow: auto;
	white-space: pre-line;
	word-break: break-all;
	width:1142px; 
	background-color:white;
}
</style>

<div class="main__title">
    <h2 class="out">상품문의 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="" class="ch-title now-title">상품문의 관리</a>        
</div>
<div class="container">
    <div class="main__select">
        <select name="replyStatus" id="replyStatus" class="select-box" onchange="getProductQnaBoardByOption()">
            <option value="2" selected="selected">전체</option>
            <option value="0">대기중</option>
            <option value="1">답변완료</option>
        </select>
    </div>
    
    <table class="table table-bordered table-productQna">
        <tr class="th--dark">
           <!--  <th class="col-md-1"><input type="checkbox" name="" id=""></th> -->
            <th class="col-md-1">번호</th>
            <th class="col-md-2">상품이름</th>
            <th class="col-md-6">제목</th>
            <th class="col-md-1">작성일</th>
            <th class="col-md-1">작성자</th>
            <th class="col-md-1">답변상태</th>
        </tr>
    </table>
    <div class="paging">
        <ul class="pagination">
        	  <li class="page-item prev"></li>
              <li class="page-item next"></li>
        </ul>
    </div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/mintProject/admin/js/productQna.js"></script>
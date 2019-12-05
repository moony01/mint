<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main__title">
    <h2 class="out">상품제안 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="" class="ch-title now-title">상품제안 관리</a>        
</div>
<div class="container">
    <div class="main__select">
        <select name="replyStatus" id="replyStatus" class="select-box" onchange="getSuggestBoardByOption()">
            <option value="2" selected="selected">전체</option>
            <option value="0">대기중</option>
            <option value="1">답변완료</option>
        </select>
    </div>
    
    <table class="table table-bordered table-offer">
        <tr class="th--dark">
            <th class="col-md-1">번호</th>
            <th class="col-md-1">카테고리</th>
            <th class="col-md-6">제목</th>
            <th class="col-md-1">작성일</th>
            <th class="col-md-1">작성자</th>
            <th class="col-md-1">상태</th>
        </tr>

    </table>
    <div class="paging">
        <ul class="pagination">
           
        </ul>
    </div>
   
</div>
<script src="/mintProject/admin/js/offer.js"></script>

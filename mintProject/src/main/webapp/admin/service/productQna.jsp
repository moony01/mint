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
            <th class="col-md-1">상품이름</th>
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
            <!-- <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
            <li class="page-item"><a class="page-link" href="#">&lsaquo;</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li> -->
        </ul>
    </div>
    <!-- <div class="main__btns">
        <form action="" id="searchForm">
            <div class="searches">
                <select name="" id="" class="select-box">
                    <option value="">제목</option>
                    <option value="">작성자</option>
                    <option value="">내용</option>
                    <option value="">주문번호</option>
                </select>
                <div class="search">
                    <input type="text" class="searchTerm" placeholder="검색 해주세요!!">
                    <button type="submit" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <div>
            <button type="button" class="btn btn-primary">선택 삭제</button>
        </div>
    </div> -->
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/mintProject/admin/js/productQna.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
    <h2 class="out">faq 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="" class="ch-title now-title">faq 관리</a>        
</div>
<div class="container">
	<form id="faqBoardForm">
	    <div class="main__select">
	        <select name="category" id="categorySelect" class="select-box">
	            <option value="9">전체</option>
	            <option value="0">회원 문의</option>
	            <option value="1">주문/결제</option>
	            <option value="2">취소/교환/반품</option>
	            <option value="3">배송 문의</option>
	            <option value="4">쿠폰/적림금</option>
	            <option value="5">서비스 이용 및 기타</option>
	        </select>
	    </div>
	    
	    <table class="table table-bordered">
	        <tr class="th--dark">
	            <th class="col-md-1"><input type="checkbox" name="" id="chkAll"></th>
	            <th class="col-md-1">번호</th>
	            <th class="col-md-1">카테고리</th>
	            <th class="col-md-6">제목</th>
	            <th class="col-md-1">작성일</th>
	            <th class="col-md-1">작성자</th>
	        </tr>
	
	    </table>
	    <div class="paging">
	        <ul class="pagination">
	            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
	            <li class="page-item"><a class="page-link" href="#">&lsaquo;</a></li>
	
	            <li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
	            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
	        </ul>
	    </div>
	    <div class="main__btns">
	        
	            <div class="searches">
	                <select name="searchOption" class="select-box">
	                    <option value="subject">제목</option>
	                    <option value="id">작성자</option>
	                    <option value="content">내용</option>
	                </select>
	                <div class="search">
	                	<input type="hidden" id="pg" name="pg" value="${pg}">
	                    <input type="text" name="keyword" class="searchTerm" placeholder="검색 해주세요!!">
	                    <button type="button" class="searchButton">
	                        <i class="fa fa-search"></i>
	                    </button>
	                </div>
	            </div>
	        <div>
	            <button type="button" id="faqDeleteBtn" class="btn btn-danger">선택 삭제</button>
	            <button type="button" id="faqWriteFormBtn" class="btn btn-primary">게시판 등록</button>
	        </div>
	    </div>
	</form>
</div>
<script type="text/javascript" src="/mintProject/admin/js/faq.js"></script>
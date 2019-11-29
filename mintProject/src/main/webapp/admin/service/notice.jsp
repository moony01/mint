<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#noticeBoardSearchForm{float: left;}
	.main__btns{float: right; width: 180px;}
</style>
<div class="main__title">
    <h2 class="out">공지사항 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="" class="ch-title now-title">공지사항 관리</a>        
</div>
<div class="container">
    <table class="table table-bordered">
        <tr class="th--dark">
            <th class="col-md-1"><input type="checkbox" id="allCheck"></th>
            <th class="col-md-1">번호</th>
            <th class="col-md-6">제목</th>
            <th class="col-md-1">작성일</th>
            <th class="col-md-1">작성자</th>
        </tr>
        
        <c:if test="${list != null}">
        	<c:forEach var="noticeBoardDTO" items="${list}">
    			<tr class="tb-content">
		            <td><input type="checkbox" class="boardCheck"></td>
		            <td>${noticeBoardDTO.seq }</td>
		            <td class="table--left">${noticeBoardDTO.subject }</td>
		            <td>${noticeBoardDTO.logtime }</td>
		            <td>${noticeBoardDTO.id }</td>
        		</tr>
        	</c:forEach>
        </c:if>
    </table>
	<div class="paging">
	    <ul class="pagination">
	        ${noticeBoardPaging.pagingHTML }
	    </ul>
	</div>

	<div id="noticeBoardSearchForm">
		<input type="hidden" name="pg" value="${pg }">
        <div class="searches">
		    <select id="selectBox" class="select-box">
		        <option value="subject">제목</option>
		        <option value="id">작성자</option>
		        <option value="content">내용</option>
		    </select>
		    <div class="search">
		        <input type="text" name="keyword" class="searchTerm" placeholder="검색 해주세요!!">
		        <button id="noticeSearchBtn" class="searchButton">
		            <i class="fa fa-search"></i>
		        </button>
		    </div>
		</div>
	</div>
    <div class="main__btns">
	    <button type="button" class="btn btn-primary" onClick="selectDeleteBoard()">선택 삭제</button>
	    <button type="button" class="btn btn-danger" onClick="insertBoard()">게시판 등록</button>
    </div>
</div>
<script type="text/javascript" src="/mintProject/admin/js/notice.js"></script>
<script type="text/javascript">
	let memId = '${memId}';
	console.log("session = "+memId);
</script>



















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.qnaRow :nth-child(3){
	cursor: pointer;
}    
</style>    
    
<div class="main__title">
    <h2 class="out">1:1문의 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="" class="ch-title now-title">1:1문의 관리</a>        
</div>
<div class="container">
    <div class="main__select">
        <select name="selectGubun" id="selectGubun" class="select-box">
            <option value="9">전체</option>
            <option value="0">대기중</option>
            <option value="1">답변완료</option>
        </select>
    </div>
    
    <table class="table table-bordered">
        <tr class="th--dark">
            <!-- <th class="col-md-1"><input type="checkbox" name="" id=""></th> -->
            <th class="col-md-1">번호</th>
            <th class="col-md-2">카테고리</th>
            <th class="col-md-5">제목</th>
            <th class="col-md-2	">작성일</th>
            <th class="col-md-1">작성자</th>
            <th class="col-md-1">상태</th>

        </tr>
        <c:forEach var="list" items="${list}">
	        <tr class = "qnaRow">
	            <!-- <td><input type="checkbox" name="" id=""></td> -->
	            <td>${list.seq }</td>
	            <c:choose>
					<c:when test="${list.category == '1'}"><td>배송지연/불만</td></c:when>
					<c:when test="${list.category == '2'}"><td>컬리패스(무료배송)</td></c:when>
					<c:when test="${list.category == '3'}"><td>반품문의</td></c:when>
					<c:when test="${list.category == '4'}"><td>A/S문의</td></c:when>
					<c:when test="${list.category == '5'}"><td>환불문의</td></c:when>
					<c:when test="${list.category == '6'}"><td>주문결제문의</td></c:when>
					<c:when test="${list.category == '7'}"><td>회원정보문의</td></c:when>
					<c:when test="${list.category == '8'}"><td>취소문의</td></c:when>
					<c:when test="${list.category == '9'}"><td>교환문의</td></c:when>
					<c:when test="${list.category == '10'}"><td>상품정보문의</td></c:when>
					<c:when test="${list.category == '11'}"><td>기타문의</td></c:when>
				</c:choose>
	            <td class="table--left"><a href="/mintProject/admin/service/getAdminQnaReplyForm?seq=${list.seq}&pg=${pg}">${list.subject }</a></td>
	            <td><fmt:formatDate value="${list.logtimeQ}" pattern="yyyy-MM-dd"/></td>
	            <td>${list.id }</td>
	            <c:choose>
					<c:when test="${list.replyStatus == '0'}"><td>대기중</td></c:when>
					<c:when test="${list.replyStatus == '1'}"><td>작성완료</td></c:when>
	            </c:choose> 
	        </tr>
	   </c:forEach>     
	        
    </table>
    <div class="paging">
   		<ul class="pagination">
   	  		<li class="page-item prev"></li>
         	<li class="page-item next"></li>
   		</ul>
    </div>
    <div class="main__btns">
        <form action="" id="searchForm">
            <div class="searches">
                <select id="searchOption" name="searchOption" class="select-box" >
                    <option value="1">제목</option>
                    <option value="2">작성자</option>
                    <option value="3">내용</option>
                    <option value="4">주문번호</option>
                </select>
                <div class="search">
                    <input type="text" id="keyword" class="searchTerm" placeholder="검색어 입력">
                    <button type="button" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <div>
        </div>
    </div>
</div>
<script>
let selectGubun = ${selectGubun};
let totalArticle = ${totalArticle};
let currentPage = ${pg};
let addr = '${addr}';
let searchOption = ${searchOption};
let keyword = '${keyword}';


console.log(" selectGubun: " + selectGubun);
console.log(" totalArticle: " + totalArticle);
console.log(" currentPage: " + currentPage);
console.log(" addr: " + addr);
console.log(" searchOption: " + searchOption);
console.log(" keyword: " + keyword);

//페이징 메서드
paging(totalArticle, currentPage, addr);

$(document).ready(function(){
	//셀렉트박스 초기 설정
	$("#selectGubun").val(${selectGubun}).prop("selected", true);
});

//아래 전체조회
$(".searchButton").click(function(){
	var searchOption = $("#searchOption").val();
	var keyword= $("#keyword").val();
	
	console.log("searchOption : " + searchOption);
	console.log("keyword : " + keyword);
	
	location.href="/mintProject/admin/service/getAdminQnaBoardList?pg=1"+"&searchOption="+searchOption+"&keyword="+keyword;
});

//엔터키 입력 가능
$("#keyword").keypress(function(e){
	if(e.keyCode == 13){
		e.preventDefault();
		var searchOption = $("#searchOption").val();
		var keyword= $("#keyword").val();
		location.href="/mintProject/admin/service/getAdminQnaBoardList?pg=1"+"&searchOption="+searchOption+"&keyword="+keyword;
	}
});

//페이징 처리
function paging(totalArticle, currentPage, addr){
	let pageBlock = 10;
	let pageSize = 10;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	
	if(endPage > totalPage) endPage = totalPage;
	
	var href = "";
	
	// 셀렉트박스 위아래 구분
	if(searchOption != 0){
		href = "&searchOption="+searchOption+"&keyword="+keyword;
	}else{
		href = "&selectGubun="+selectGubun;
	}
	
	if(startPage > pageBlock){
		$('.prev').append($('<a/>', {
			class: 'page-link', 
			href: addr+'?pg='+(startPage-1)+href,
			text: '<'
		})).appendTo('.pagination');
	}
	
	
	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			href: addr+'?pg='+i+href,
			text: i
		})).appendTo('.pagination');
		
 		if(i == currentPage) {
 			$('.pg').attr('class', 'page-item active');
		} else {
			$('.pg').removeAttr('class', 'active');
		}	
	}
	
	if(endPage < totalPage) {
		$('.next').append($('<a/>', {
			class: 'page-link', 
			href: addr+'?pg='+(endPage+1)+href,
			text: '>'
		})).appendTo('.pagination');
	}

}

//셀렉트 박스 변경 시
$("#selectGubun").change(function(){
	var key = $("#selectGubun").val();
	
	switch (key) {
	case "9":
		location.href="/mintProject/admin/service/getAdminQnaBoardList?selectGubun=9&pg=1";	
		
	break;
	case "0":
		location.href="/mintProject/admin/service/getAdminQnaBoardList?selectGubun=0&pg=1";	
	break;
	case "1":
		location.href="/mintProject/admin/service/getAdminQnaBoardList?selectGubun=1&pg=1";
	break;	
	default:
		break;
	}
	
})


</script>
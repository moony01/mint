<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<style>
.faqRow :nth-child(2){
	cursor: pointer;
}
</style>
<div class="main__title">
    <h2 class="out">상품 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="" class="ch-title now-title">상품 관리</a>        
</div>
<div class="container">
	<form id="faqBoardForm">
	    <div class="main__select">
	        <select name="category" id="categorySelect" class="select-box">
	            <option value="9">전체</option>
	            <option value="0">농산물</option>
	            <option value="1">수산물</option>
	            <option value="2">축산물</option>
	            <option value="3">일반식품</option>
	            <option value="4">반찬류</option>
	        </select>
	    </div>
	    
	    <table id="faqListTable" class="table table-bordered" style="vertical-align:middle; align-content: center;">
	        <tr class="th--dark">
	           <!--  <th class="col-md-1"><input type="checkbox" name="" id="chkAll"></th> -->
	            <th class="col-md-2">상품코드</th>
	            <th class="col-md-1">상품사진</th>
	            <th class="col-md-6">상품명</th>
	            <th class="col-md-2">가격</th>
	            <th class="col-md-1">수량</th>
	        </tr>
			
			<c:forEach var="list" items="${list}">
				<tr class = "faqRow" style="vertical-align:middle; align-content: center;">
					<td>${list.productCode}</td>
					<td><a href="/mintProject/shop/product/updateProductForm?productCode=${list.productCode }"><img src="/mintProject/shop/storage/mint/product/${list.thumbnail}" alt="" width = 90px height = 90px ></a></td>
					<td class="table--left">${list.mainSubject}</td>
					<td><fmt:formatNumber type="currency" value = "${list.price - (list.price * (list.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원</td>
					<td><fmt:formatNumber type="currency" value = "${list.stock}" pattern="#,###"/>개</td>
				</tr>
			</c:forEach>
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
	    <div class="main__btns">
	            <div class="searches">
		                <select name="searchOption" id="searchOption" class="select-box" >
		                    <option value="1">상품코드</option>
		                    <option value="2">상품명</option>
		                </select>
		                <div class="search">
		                	<input type="hidden" id="pg" name="pg" value="${pg}">
		                    <input type="text" name="keyword" id="keyword" class="searchTerm" placeholder="검색어 입력">
		                    <button type="button" class="searchButton">
		                        <i class="fa fa-search"></i>
		                    </button>
		                </div>
	            </div>
	        <div>
	            <!-- <button type="button" id="faqDeleteBtn" class="btn btn-danger">
	            	<i class="fa fa-times" aria-hidden="true"></i>
	            	선택 삭제
	            </button> -->
	            <button type="button" id="productWriteFormBtn" class="btn btn-primary" >
	            	<i class="fa fa-pen" aria-hidden="true"></i> 
	            	상품 등록
	            </button>
	        </div>
	    </div>
	</form>
</div>
<!-- <script type="text/javascript" src="/mintProject/admin/js/faq.js"></script> -->
<script>
let totalArticle = ${totalArticle};
let currentPage = ${pg};
let addr = '${addr}';
let categorySelect = ${categorySelect};
let searchOption = ${searchOption};
let keyword = '${keyword}';

console.log("totalArticle :  "+ totalArticle)
console.log("currentPage :  "+ currentPage)
console.log("addr :  "+ addr)
console.log("categorySelect :  "+ categorySelect)
console.log("searchOption :  "+ searchOption)
console.log("keyword :  "+ keyword)

paging(totalArticle, currentPage, addr);
renderSelectBox();

function renderSelectBox(){
	const selectBox = document.querySelector("#categorySelect");
	const selectedNumber = ${categorySelect};
	//selectBox[selectedNumber].selected = true;
	$("#categorySelect").val(${categorySelect}).prop("selected", true);
}

//페이징 처리
function paging(totalArticle, currentPage, addr){
	let pageBlock = 3;
	let pageSize = 9;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	
	if(endPage > totalPage) endPage = totalPage;
	
	var href = "";
	
	// 셀렉트박스 위아래 구분
	if(searchOption != 3){
		href = "&searchOption="+searchOption+"&keyword="+keyword;
	}else{
		href = "&categorySelect="+categorySelect;
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

// 아래 전체조회
$(".searchButton").click(function(){
	var searchOption = $("#searchOption").val();
	var keyword= $("#keyword").val();
	
	location.href = "/mintProject/admin/productAdminList?pg=1&searchOption="+searchOption+"&keyword="+keyword;
});

//엔터키 입력 가능
$("#keyword").keypress(function(e){
	if(e.which == 13){
		var searchOption = $("#searchOption").val();
		var keyword= $("#keyword").val();
		
		location.href = "/mintProject/admin/productAdminList?pg=1&searchOption="+searchOption+"&keyword="+keyword;
	}
});

$("#productWriteFormBtn").click(function(){
	location.href = "/mintProject/productManage/productWriteForm";
})

/* 카테고리 선택시 게시판 리스트 불러오기 */
$('#categorySelect').change(function(){
	var key = $("#categorySelect").val();
	
	console.log("key : " + key)
	
	switch (key) {
		case "0":
			console.log("--농산물--");
			location.href = "/mintProject/admin/productAdminList?pg=1&categorySelect="+key;
		break;
		
		case "1":
			console.log("--수산물--");
			location.href = "/mintProject/admin/productAdminList?pg=1&categorySelect="+key;
		break;
		
		case "2":
			console.log("--축산물--");
			location.href = "/mintProject/admin/productAdminList?pg=1&categorySelect="+key;
		break;
	
		case "3":
			console.log("--일반식품--");
			location.href = "/mintProject/admin/productAdminList?pg=1&categorySelect="+key;
		break;
	
		case "4":
			console.log("--반찬류--");
			location.href = "/mintProject/admin/productAdminList?pg=1&categorySelect="+key;
		break;
		
		case "9":
			console.log("--전체--");
			location.href = "/mintProject/admin/productAdminList?pg=1&categorySelect="+key;
		break;
		
		default:
		break;
	}
});


</script>
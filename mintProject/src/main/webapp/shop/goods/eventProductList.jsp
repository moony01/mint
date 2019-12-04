<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<section class="wrap">
    <div class="product__menu">
        <div class="product__title"></div>
        <div class="just-flex">
            <ul class="product__list">
            </ul>
            <div class="product__sort">
                <span class="sort up" id="sort-up">신상품순</span>
                <ul class="sort__list">
                	<c:if test="${list != null}">
                		<li><a href="/mintProject/shop/goods/eventProductList?seq=${seq}&selectGubun=1&pg=1">신상품순</a></li>
	                    <li><a href="/mintProject/shop/goods/eventProductList?seq=${seq}&selectGubun=2&pg=1">인기상품순</a></li>
	                    <li><a href="/mintProject/shop/goods/eventProductList?seq=${seq}&selectGubun=3&pg=1">낮은 가격순</a></li>
	                    <li><a href="/mintProject/shop/goods/eventProductList?seq=${seq}&selectGubun=4&pg=1">높은 가격순</a></li>       
                	</c:if>
                </ul>
            </div>
        </div>
    </div>
    <div class="product__main">
    	<c:if test="${list != null}">
    		<c:forEach var="list" items="${list}">
		        <div class="product__item">
		            <c:if test="${list.stock == 0}">
		            	<div class="product__thumb sold-out">
			            	<c:if test="${list.discountRate == 10}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 20}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 30}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 40}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 50}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
			            	</c:if>
			            		<!-- 삼품 이미지 클릭 시 상품 상세뷰 페이지로 이동 -->         
			                	<a href="/mintProject/shop/product/productView?productCode=${list.productCode}&subCategory=${list.subCategory}">
			                		<img class="thumb" src="/mintProject/shop/storage/mint/product/${list.thumbnail}" alt="">
			                	</a>			
			                <div class="cart-btn">
			                    <a href="/mintProject/shop/goods/cart"><img src="/mintProject/shop/storage/mint/icon/cart_test.png" alt="" style="width: 28px"></a>
			                </div>
		            	</div>
		            </c:if>
		            <c:if test="${list.stock != 0}">
		            	 <div class="product__thumb">
			            	<c:if test="${list.discountRate == 10}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 20}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 30}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 40}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png" alt="">
			            	</c:if>
			            	<c:if test="${list.discountRate == 50}">
			            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png" alt="">
			            	</c:if>
			            		<!-- 삼품 이미지 클릭 시 상품 상세뷰 페이지로 이동 -->         
			                	<a href="/mintProject/shop/product/productView?productCode=${list.productCode}&subCategory=${list.subCategory}">
			                		<img class="thumb" src="/mintProject/shop/storage/mint/product/${list.thumbnail}" alt="">
			                	</a>			
			                <div class="cart-btn">
			                    <a href="/mintProject/shop/goods/cart"><img src="/mintProject/shop/storage/mint/icon/cart_test.png" alt="" style="width: 28px"></a>
			                </div>
		            	</div>
		            </c:if>
		            <div class="product__info">
		                <div class="product__name">${list.mainSubject }</div>
		                <div class="product__cost"> 
		                	<c:if test="${list.discountRate != 0}">
		                		<span class="product__dc">
		                			<fmt:formatNumber type="currency" value="${list.price}" currencyCode="KRW" pattern="#,###"/>
								</span>			                	
		                		<%-- <span class="product__dc">${list.price}</span> --%>
		                		<span class="product__price">
		                			<fmt:formatNumber type="currency" value = "${list.price - (list.price * (list.discountRate * (1/100)))}" currencyCode="KRW" pattern="#,###"/>원
		                		</span><!-- 원가 - 원가*0.할인율 -->
		                	</c:if>
		                	<c:if test="${list.discountRate == 0}">
		                		<span class="product__price">
		                			<fmt:formatNumber type="currency" value = "${list.price}" currencyCode="KRW" pattern="#,###"/>원
		                		</span><!-- 원가 - 원가*0.할인율 -->
		                	</c:if>
		                	<c:if test="${list.discountRate == null}">
		                		 <span class="product__price">${list.price}원</span>
		                	</c:if>
		                </div>
		                <div class="product__disc">${list.subSubject }</div>
		            </div>
		        </div>
        	</c:forEach>
        </c:if>
    </div>
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
</section>
<script>

let totalArticle = ${totalArticle};
let currentPage = ${pg};
let addr = '${addr}';
let selectGubun = "${selectGubun}";

paging(totalArticle, currentPage, addr);

//selectbox 구분 조회후 화면 리로딩된 후 설정
$(document).ready(function(){
	//sort-up
	switch (selectGubun) {
	case "1":
		$("#sort-up").text("신상품순");
		break;
	case "2":
		$("#sort-up").text("인기상품순");
		break;
	case "3":
		$("#sort-up").text("낮은 가격순");
	break;
	case "4":
		$("#sort-up").text("높은 가격순");
	break;

	default:
		break;
	}
});

//페이징 처리
function paging(totalArticle, currentPage, addr){
	let pageBlock = 5;
	let pageSize = 9;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	

	let href = "";
	
	
	if(endPage > totalPage) endPage = totalPage;

	if(startPage > pageBlock){
		$('.prev').append($('<a/>', {
			class: 'page-link', 
			href: addr+'?pg='+(startPage-1),
			text: '<'
		})).appendTo('.pagination');
	}
	
	
	for(i = startPage; i <= endPage ; i++) {
		$('<li/>').attr('class', 'page-item pg').append($('<a/>', {
			class: 'page-link', 
			href: addr+'?pg='+i,
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
			href: addr+'?pg='+(endPage+1),
			text: '>'
		})).appendTo('.pagination');
	}

}
	
    const sort = document.querySelector(".sort");
    const sortList = document.querySelector(".sort__list");
    sort.addEventListener("click",()=>{
        const hasUp = sort.classList.contains("up");
        if(hasUp){
            sort.classList.remove("up");
            sort.classList.add("down");
            sortList.classList.toggle("on")
        }else{
            sort.classList.remove("down");
            sort.classList.add("up");
            sortList.classList.toggle("on")
        }
    });
    
   /*  console.log(${selectGubun})
    const gubun = ${selectGubun};
    const sortText = ["신상품순","인기상품순","낮은 가격순","높은 가격순"]; */
    /* sort.textContent = sortText[gubun-1];  */
  
	renderCategoryNew('${eventSubject}');
	
	function renderCategoryNew(title){
		const tit = document.querySelector('.product__title');
		const productList = document.querySelector('.product__list');

		const li = document.createElement("li");
		const a = document.createElement("a");

		tit.innerText = title;

		a.innerText = '전체보기';

		li.classList.add("cur-product");
		li.appendChild(a);
		productList.appendChild(li);
	}

</script>
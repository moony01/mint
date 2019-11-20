<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<section class="wrap">
    <div class="product__menu">
        <div class="product__title"><img src="/mintProject/shop/storage/mint/icon/corn.png" alt="">농산물</div>
        <div class="just-flex">
            <ul class="product__list">
                <li class="cur-product"><a href="">전체보기</a></li>
                <li><a href="">과일</a></li>
                <li><a href="">기본채소</a></li>
                <li><a href="">쌈채소</a></li>
                <li><a href="">브로콜리·특수채소</a></li>
                <li><a href="">피망·고추</a></li>
                <li><a href="">곡류</a></li>
                <li><a href="">버섯류</a></li>
                <li><a href="">견과류</a></li>
            </ul>
            <div class="product__sort">
                <span class="sort up">신상품순</span>
                <ul class="sort__list">
                	<c:if test="${list != null }">
                		<c:if test="${gubun == 1}">
	                		<li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=1&gubun=${gubun}&pg=1">신상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=2&gubun=${gubun}&pg=1">인기상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=3&gubun=${gubun}&pg=1">낮은 가격순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?mainCategory=${list.get(0).getMainCategory()}&selectGubun=4&gubun=${gubun}&pg=1">높은 가격순</a></li>
	            		</c:if>
	            		<c:if test="${gubun == 2}">
	                		<li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=1&gubun=${gubun}&pg=1">신상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=2&gubun=${gubun}&pg=1">인기상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=3&gubun=${gubun}&pg=1">낮은 가격순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?subCategory=${list.get(0).getSubCategory()}&selectGubun=4&gubun=${gubun}&pg=1">높은 가격순</a></li>
	            		</c:if>
	            		<c:if test="${gubun == 3}">
	                		<li><a href="/mintProject/productList/getProductList?selectGubun=1&headGubun=${headGubun}&selectGubun=1&gubun=${gubun}&pg=1">신상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?selectGubun=2&headGubun=${headGubun}&selectGubun=2&gubun=${gubun}&pg=1">인기상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?selectGubun=3&headGubun=${headGubun}&selectGubun=3&gubun=${gubun}&pg=1">낮은 가격순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?selectGubun=4&headGubun=${headGubun}&selectGubun=4&gubun=${gubun}&pg=1">높은 가격순</a></li>
	            		</c:if>          
                	</c:if>
                </ul>
            </div>
        </div>
    </div>
    <div class="product__main">
    	<c:if test="${list != null}">
    		<c:forEach var="list" items="${list}">
		        <div class="product__item">
		            <div class="product__thumb">
		            	<c:if test="${list.discountRate == 20}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-20.png" alt="">
		            	</c:if>
		            	<c:if test="${list.discountRate == 30}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-30.png" alt="">
		            	</c:if>
		            	<c:if test="${list.discountRate == 40}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-40.png" alt="">
		            	</c:if>
		            	<c:if test="${list.discountRate == 50}">
		            		<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/distate-50.png" alt="">
		            	</c:if>
		                	<a href=""><img class="thumb" src="/mintProject/shop/storage/${list.thumbnail}" alt=""></a>			
		                <div class="cart-btn">
		                    <a href="/mintProject/shop/goods/cart"><img src="/mintProject/shop/storage/mint/icon/cart_test.png" alt="" style="width: 28px"></a>
		                </div>
		            </div>
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
let mainCategory = ${list.get(0).getMainCategory()};
let subCategory = ${list.get(0).getSubCategory()};
let gubun = ${gubun};
let selectGubun = "${selectGubun}";
let headGubun = "${headGubun}";

console.log("mainCategory :  "+ mainCategory)
console.log("subCategory :   "+ subCategory)
console.log("gubun :   "+ gubun)
console.log("selectGubun :   "+ selectGubun)
console.log("headGubun :   "+ headGubun)

/* +"&mainCategory="+mainCategory+"&subCategory="+subCategory+"&gubun="+gubun+"&selectGubun="+selectGubun */


paging(totalArticle, currentPage, addr);

//페이징 처리
function paging(totalArticle, currentPage, addr){
	let pageBlock = 3;
	let pageSize = 3;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	

	let href = "";
	
	if(gubun == 1 ){
		if(selectGubun == null){
			href = "&mainCategory="+mainCategory+"&gubun="+gubun;
		}else{
			href = "&mainCategory="+mainCategory+"&gubun="+gubun+"&selectGubun="+selectGubun;
		}
	}else if(gubun == 2){
		if(selectGubun == null){
			href = "&subCategory="+subCategory+"&gubun="+gubun;
		}else{
			href = "&subCategory="+subCategory+"&gubun="+gubun+"&selectGubun="+selectGubun;
		}
	}else{
		if(selectGubun == null){
			href = "&headGubun="+headGubun+"&gubun="+gubun;
		}else{
			href = "&headGubun="+headGubun+"&gubun="+gubun+"&selectGubun="+selectGubun;
		}
		
	}
	
	if(endPage > totalPage) endPage = totalPage;

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
  
 

</script>
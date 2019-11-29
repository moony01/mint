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
                <span class="sort up">신상품순</span>
                <ul class="sort__list">
                	<c:if test="${list != null}">
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
	                		<li><a href="/mintProject/productList/getProductList?selectGubun=1&headGubun=${headGubun}&gubun=${gubun}&pg=1">신상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?selectGubun=2&headGubun=${headGubun}&gubun=${gubun}&pg=1">인기상품순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?selectGubun=3&headGubun=${headGubun}&gubun=${gubun}&pg=1">낮은 가격순</a></li>
		                    <li><a href="/mintProject/productList/getProductList?selectGubun=4&headGubun=${headGubun}&gubun=${gubun}&pg=1">높은 가격순</a></li>
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
	let pageSize = 9;
	let temp = Math.ceil(currentPage / pageBlock);
	let totalPage = Math.floor((totalArticle+pageSize-1) / pageSize);
	let startPage = Math.ceil((temp-1)/pageBlock) * pageBlock +1; 
	let endPage = startPage + pageBlock -1;
	

	let href = "";
	
	if(gubun == 1 ){
		if(selectGubun == null||selectGubun == "" ){
			href = "&mainCategory="+mainCategory+"&gubun="+gubun;
		}else{
			href = "&mainCategory="+mainCategory+"&gubun="+gubun+"&selectGubun="+selectGubun;
		}
	}else if(gubun == 2){
		if(selectGubun == null||selectGubun == ""){
			href = "&subCategory="+subCategory+"&gubun="+gubun;
		}else{
			href = "&subCategory="+subCategory+"&gubun="+gubun+"&selectGubun="+selectGubun;
		}
	}else{
		if(selectGubun == null||selectGubun == ""){
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
  
	const productObject = {
        101: {
            src: '/mintProject/shop/storage/mint/icon/corn.png',
            text: '농산물',
            list: [
                {
                    href:
                        '/mintProject/productList/getProductList?mainCategory=101&gubun=1&pg=1',
                    text: '전체보기',
                },
                {
                    category: 211,
                    href:
                        '/mintProject/productList/getProductList?subCategory=211&gubun=2&pg=1',
                    text: '과일',
                },
                {
                    category: 212,
                    href:
                        '/mintProject/productList/getProductList?subCategory=212&gubun=2&pg=1',
                    text: '기본채소',
                },
                {
                    category: 213,
                    href:
                        '/mintProject/productList/getProductList?subCategory=213&gubun=2&pg=1',
                    text: '쌈채소',
                },
                {
                    category: 214,
                    href:
                        '/mintProject/productList/getProductList?subCategory=214&gubun=2&pg=1',
                    text: '브로콜리·특수채소',
                },
                {
                    category: 215,
                    href:
                        '/mintProject/productList/getProductList?subCategory=215&gubun=2&pg=1',
                    text: '피망·고추',
                },
                {
                    category: 216,
                    href:
                        '/mintProject/productList/getProductList?subCategory=216&gubun=2&pg=1',
                    text: '곡류',
                },
                {
                    category: 217,
                    href:
                        '/mintProject/productList/getProductList?subCategory=217&gubun=2&pg=1',
                    text: '버섯류',
                },
                {
                    category: 218,
                    href:
                        '/mintProject/productList/getProductList?subCategory=218&gubun=2&pg=1',
                    text: '견과류',
                },
            ],
        },
        102: {
            src: '/mintProject/shop/storage/mint/icon/fish.png ',
            text: '수산물',
            list: [
                {
                    href:
                        '/mintProject/productList/getProductList?mainCategory=102&gubun=1&pg=1',
                    text: '전체보기',
                },
                {
                    category: 221,
                    href:
                        '/mintProject/productList/getProductList?subCategory=221&gubun=2&pg=1',
                    text: '생선류',
                },
                {
                    category: 222,
                    href:
                        '/mintProject/productList/getProductList?subCategory=222&gubun=2&pg=1',
                    text: '조개류',
                },
                {
                    category: 223,
                    href:
                        '/mintProject/productList/getProductList?subCategory=223&gubun=2&pg=1',
                    text: '갑각류',
                },
                {
                    category: 224,
                    href:
                        '/mintProject/productList/getProductList?subCategory=224&gubun=2&pg=1',
                    text: '해조류',
                },
                {
                    category: 225,
                    href:
                        '/mintProject/productList/getProductList?subCategory=225&gubun=2&pg=1',
                    text: '건어물',
                },
                {
                    category: 226,
                    href:
                        '/mintProject/productList/getProductList?subCategory=226&gubun=2&pg=1',
                    text: '오징어',
                },
            ],
        },
        103: {
            src: '/mintProject/shop/storage/mint/icon/meat.png',
            text: '축산물',
            list: [
                {
                    href:
                        '/mintProject/productList/getProductList?mainCategory=103&gubun=1&pg=1',
                    text: '전체보기',
                },
                {
                    category: 231,
                    href:
                        '/mintProject/productList/getProductList?subCategory=231&gubun=2&pg=1',
                    text: '소고기',
                },
                {
                    category: 232,
                    href:
                        '/mintProject/productList/getProductList?subCategory=232&gubun=2&pg=1',
                    text: '돼지고기',
                },
                {
                    category: 233,
                    href:
                        '/mintProject/productList/getProductList?subCategory=233&gubun=2&pg=1',
                    text: '닭고기',
                },
                {
                    category: 234,
                    href:
                        '/mintProject/productList/getProductList?subCategory=234&gubun=2&pg=1',
                    text: '계란류',
                },
                {
                    category: 235,
                    href:
                        '/mintProject/productList/getProductList?subCategory=235&gubun=2&pg=1',
                    text: '오리고기',
                },
            ],
        },
        104: {
            src: '/mintProject/shop/storage/mint/icon/snack.png',
            text: '일반식품',
            list: [
                {
                    href:
                        '/mintProject/productList/getProductList?mainCategory=104&gubun=1&pg=1',
                    text: '전체보기',
                },
                {
                    category: 241,
                    href:
                        '/mintProject/productList/getProductList?subCategory=241&gubun=2&pg=1',
                    text: '유제품',
                },
                {
                    category: 242,
                    href:
                        '/mintProject/productList/getProductList?subCategory=242&gubun=2&pg=1',
                    text: '만두류',
                },
                {
                    category: 243,
                    href:
                        '/mintProject/productList/getProductList?subCategory=243&gubun=2&pg=1',
                    text: '라면',
                },
                {
                    category: 244,
                    href:
                        '/mintProject/productList/getProductList?subCategory=244&gubun=2&pg=1',
                    text: '과자',
                },
                {
                    category: 245,
                    href:
                        '/mintProject/productList/getProductList?subCategory=245&gubun=2&pg=1',
                    text: '국수',
                },
                {
                    category: 246,
                    href:
                        '/mintProject/productList/getProductList?subCategory=246&gubun=2&pg=1',
                    text: '어묵',
                },
                {
                    category: 247,
                    href:
                        '/mintProject/productList/getProductList?subCategory=247&gubun=2&pg=1',
                    text: '햄',
                },
            ],
        },
        105: {
            src: '/mintProject/shop/storage/mint/icon/soup.png',
            text: '반찬류',
            list: [
                {
                    href:
                        '/mintProject/productList/getProductList?mainCategory=105&gubun=1&pg=1',
                    text: '전체보기',
                },
                {
                    category: 251,
                    href:
                        '/mintProject/productList/getProductList?subCategory=251&gubun=2&pg=1',
                    text: '김치',
                },
                {
                    category: 252,
                    href:
                        '/mintProject/productList/getProductList?subCategory=252&gubun=2&pg=1',
                    text: '국·찌개',
                },
                {
                    category: 253,
                    href:
                        '/mintProject/productList/getProductList?subCategory=253&gubun=2&pg=1',
                    text: '전·부침',
                },
                {
                    category: 254,
                    href:
                        '/mintProject/productList/getProductList?subCategory=254&gubun=2&pg=1',
                    text: '간편식',
                },
                {
                    category: 255,
                    href:
                        '/mintProject/productList/getProductList?subCategory=255&gubun=2&pg=1',
                    text: '통조림',
                },
            ],
        },
	};
	
	function renderCategory() {
        const curAllCategories = productObject[mainCategory];
        const { list } = curAllCategories;
        const productList = document.querySelector('.product__list');

        function renderTitle() {
            const title = document.querySelector('.product__title');
			const titleImage = document.createElement('img');
			const text = document.createTextNode(curAllCategories.text);
			
			title.appendChild(titleImage);
            title.appendChild(text);

            titleImage.src = curAllCategories.src;

        }
        renderTitle();

        function renderSubCategory() {
            list.forEach((category, index) => {
                const li = document.createElement('li');
                const a = document.createElement('a');

                a.href = category.href;
                a.innerText = category.text;

                li.appendChild(a);

                if (gubun === 1 && index === 0) {
                    li.classList.add('cur-product');
                } else if (gubun === 2 && category.category === subCategory) {
                    li.classList.add('cur-product');
                }

                productList.appendChild(li);
            });
        }

        renderSubCategory();

        function addCurrentProduct() {
            if (gubun === 1) {
                const li = productList.querySelector('li');
                li.classList.add('cur-product');
            } else {
                list.filter(category => {
                    return;
                });
            }
        }
        addCurrentProduct();
	}
	
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

    if(gubun===1||gubun===2){
		renderCategory();
	}else if(headGubun ==='1'){
		renderCategoryNew('NEW');
	}else if(headGubun ==='2'){
		renderCategoryNew('베스트');
	}

</script>
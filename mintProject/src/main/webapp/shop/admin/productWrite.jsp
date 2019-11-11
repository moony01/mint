<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
    <h2 class="out">상품 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="">상품 관리</a>
    <span class="ar-title">></span>
    <a href="" class="now-title">상품 등록</a>                
</div>
<div class="container">
    <table class="table table-bordered write-tb">
        <tr>
            <th>대분류</th>
            <td class="table--left">
                <select name="" id="mainCategory" class="main-category">
                    <option value="" id="none">선택</option>
                    <option value="101" id="farmFood">농산물</option>
                    <option value="102" id="seaFood">수산물</option>
                    <option value="103" id="meat">축산물</option>
                    <option value="104" id="general">일반식품</option>
                    <option value="105" id="sideDish">반찬류</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>소분류</th>
            <td class="table--left">
                <!-- 아이디는 자바스크립트용 클래스는 css 용 -->
                <select name="" id="subCategory" class="sub-category">
                    
                </select>
            </td>
        </tr>
        <tr>
            <th>사업자 아이디</th>
            <td class="table--left">
                <input type="text">
            </td>
        </tr>
        <tr>
            <th>재고 수량</th>
            <td class="table--left">
            <input type="text">
            </td>
        </tr>
        <tr>
            <th>사업자 아이디</th>
            <td class="table--left">
            <input type="text">
            </td>
        </tr>
        <tr>
            <th>큰 제목</th>
            <td class="table--left"><input type="text"></td>
        </tr>
        <tr>
            <th>소 제목</th>
            <td class="table--left"><input type="text"></td>
        </tr>
        <tr>
            <th>상품 대표 이미지</th>
            <td></td>
        </tr>
        <tr>
            <th>가격</th>
            <td class="table--left">
                <input type="text">
            </td>
        </tr>
        <tr>
            <th>판매 단위</th>
            <td class="table--left">
                <input type="text">
            </td>
        </tr>
        <tr>
            <th>중량 용량</th>
            <td class="table--left">
                <input type="text">
            </td>
        </tr>
        <tr>
            <th>포장 타입</th>
            <td class="table--left">
                <input type="text">
            </td>
        </tr>
        <tr>
            <th>안내 사항</th>
            <td class="table--left"><input type="text" class="write-tb__input-txt"></td>
        </tr>
        
        <tr class="write-tb__content">
            <th>상품 설명</th>
            <td class="table--left">
                <textarea name="" id="description"></textarea>
            </td>
        </tr>
        <tr>
            <th>상품 이미지</th>
            <td></td>
        </tr>
        <tr class="write-tb__content">
            <th>상품 정보</th>
            <td class="table--left">
                <textarea name="" id="info"></textarea>
            </td>
        </tr>
    </table>
    <div class="write-tb__btns">
        <button type="button" class="btn btn-primary btn-lg">글쓰기</button>
        <button type="button" class="btn btn-success btn-lg">목록으로</button>
    </div>   
</div>
<script>
$(document).ready(function(){
    $('#description').summernote({
        placeholder:"내용을 입력해주세요",
        height: 400,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true   
    });
    $('#info').summernote({
        placeholder:"내용을 입력해주세요",
        height: 400,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true   
    });
})
const category = {
    farmFood : [{text:"과일",value:211},{text:"기본채소",value:212},{text:"쌈채소",value:213},
                {text:"브로콜리",value:214},{text:"피망·고추",value:215},
                {text:"곡류",value:216},{text:"버섯류",value:217},{text:"견과류",value:218}],

    seaFood :[{text:"생선류",value:221},{text:"조개류",value:222},{text:"갑각류",value:223},
                {text:"해조류",value:224},{text:"건어물",value:225},{text:"오징어",value:226}],

    meat : [{text:"소고기",value:231},{text:"돼지고기",value:232},{text:"닭고기",value:233},
            {text:"계란류",value:234},{text:"오리고기",value:235},],

    general :[{text:"유제품",value:241},{text:"만두류",value:242},{text:"라면",value:243},
                {text:"과자",value:244},{text:"국수",value:245},{text:"어묵",value:246},
                {text:"햄",value:247}],
    sideDish : [{text:"김치",value:251},{text:"국·찌개",value:252},{text:"전·부침",value:253},
                {text:"간편식",value:254},{text:"통조림",value:255}],
}
const mainCategory = document.getElementById("mainCategory");

mainCategory.addEventListener("change",function(){
    const subCategory  = document.getElementById("subCategory");
    subCategory.length = 0;

    const selectedIndex = mainCategory.selectedIndex;
    const selectedCategory = mainCategory[selectedIndex].id;
    const categoryList  = category[selectedCategory] ||[];

    categoryList.forEach(function(item){
        const value = item.value;
        const text = item.text;

        const option = document.createElement("option");
        option.innerText = text;
        option.setAttribute("value",value);
        subCategory.appendChild(option);
        
    });
}); 
</script>
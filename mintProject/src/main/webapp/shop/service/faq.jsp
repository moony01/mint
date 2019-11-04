<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<seciton class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/shop/service/notice">공지사항</a></li>
            <li class="snb__item current"><a href="/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item"><a href="/shop/service/qna">1:1 문의</a></li>
            <li class="snb__item"><a href="/shop/service/offer">상품 제안</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">자주하는 질문
            <span class="title_sub">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
        </h2>
        <!-- 아직 값 설정 안함 같이할 예정 -->
        <select name="" id="" class="select-box">
            <option value="">선택</option>
            <option value="">회원 문의</option>
            <option value="">주문/결제</option>
            <option value="">취소/교환/반품</option>
            <option value="">배송 문의</option>
            <option value="">쿠폰/적림금</option>
            <option value="">서비스 이용 및 기타</option>
        </select>
        <table class="tb tb-fqa">
            <tr>
                <th class="size-1">번호</th>
                <th class="size-2">작성자</th>
                <th class="size-9">제목</th>
            </tr>
            <tr class="tb-content">
                <td>1</td>
                <td>안녕</td>
                <td>아이디와 비밀번호가 생각나지 않아요. 어떻게 찾을 수 있나요?</td>
            </tr>

            <tr class="tb-view">
                <td colspan="1"><img src="https://www.kurly.com/shop/data/skin/designgj/img/common/faq_a.gif"></td>
                <td colspan="2">몰라</td>
            </tr>
        </table>
        
        <div class="paging">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#"><</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
            </ul>  
        </div>
        
        <div class="service__search">
            <div class="service__sel-box">
            </div>
            <div class="service__serch-box">
                <input type="text">
                <div class="service__seach-btn">
                    <i class="fas fa-search"></i>
                </div>
            </div>
        </div>
    </div>
</seciton>
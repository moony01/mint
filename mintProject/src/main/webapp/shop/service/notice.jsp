<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="service">
    <div class="snb">
        <h2 class="snb__title">고객센터</h2>
        <ul class="snb__list">
            <li class="snb__item current"><a href="/mintProject/shop/service/notice">공지사항</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/faq">자주하는 질문</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/qna">1:1 문의</a></li>
            <li class="snb__item"><a href="/mintProject/shop/service/offer">상품 제안</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">공지사항
            <span class="title_sub">민트의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
        </h2>
        <table class="tb tb-notice" width="100%" cellpadding="0" cellspacing="0">
        	<colgroup>
        		<col width="50">
        		<col style="padding-left: 10px; text-align: left;">
        		<col width="100">
        		<col width="100">
        		<col width="30">
        	</colgroup>
            <tr>
                <th class="size-1">번호</th>
                <th class="size-6">제목</th>
                <th class="size-2">작성자</th>
                <th class="size-2">작성일</th>
                <th class="size-1">조회수</th>
            </tr>
            <c:if test="${list != null}">
            	<c:forEach var="noticeBoardDTO" items="${list }">
            		<tr class="tb-content">
            			<td>${noticeBoardDTO.seq }</td>
            			<td>${noticeBoardDTO.subject }</td>
            			<td>${noticeBoardDTO.id }</td>
            			<td>${noticeBoardDTO.logtime }</td>
            			<td>${noticeBoardDTO.hit }</td>
            		</tr>
            	</c:forEach>
            </c:if>
        </table> 
        <div class="paging">
            <ul class="pagination">
                ${noticeBoardPaging.pagingHTML }
            </ul>
        </div>
        
        <form id="noticeBoardSearchForm">
        	<input type="hidden" name="pg" value="1">
        	<div class="service__search">
	            <div class="service__sel-box">
	                <span>검색어</span>
	                <input type="checkbox" name="check" id="chkName" value="id">
	                <span>이름</span>
	                <input type="checkbox" name="check" id="chkSub" value="subject">
	                <span>제목</span>
	                <input type="checkbox" name="check" id="chkContent" value="content">
	                <span>내용</span>
	            </div>
	            <div class="service__serch-box">
	                <input type="text" name="keyword" value="${keyword }">
	                <div id="noticeSearchBtn" class="service__seach-btn">
	                    <i class="fas fa-search si"></i>
	                </div>
	            </div>
	    	</div>
        </form>

    </div>
</section>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript">

//var chk_name = document.getElementById('chkName');
document.getElementById('noticeSearchBtn').onclick = function(event, str) {
	if(str!='trigger') $('input[name=pg]').val(1);
	
	var count = $('input[name=check]:checked').length;
	var keyword = $('input[name=keyword]').val();
	
	if(count==0){
		alert("검색할 항목을 선택하세요");
	} else if(keyword==''){
		alert("검색할 단어를 입력해주세요")
	} else {
		$.ajax({
			type: 'post',
			url: '/mintProject/notice/noticeBoardSearch',
			data: $('#noticeBoardSearchForm').serialize(),
			dataType: 'json',
			success: function(data){
				//console.log(JSON.stringify(data));
				$('tr.tb-content').remove();
				
				$.each(data.list, function(index, items){
					$('<tr class="tb-content"/>')
					.append($('<td/>',{
						align: 'center',
						text: items.seq
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.subject
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.id
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.logtime
					}))
					.append($('<td/>',{
						align: 'center',
						text: items.hit
					}))
					.appendTo($('.tb-notice'));
				});
				
				//페이징
				$('.pagination').html(data.noticeBoardPaging.pagingHTML);
			},
			error: function(err){
				console.log(err);
			}
		});
	}
}

function noticeBoardSearch(pg){	
	$('input[name=pg]').val(pg);
	$('#noticeSearchBtn').trigger('click','trigger');
}

</script>
























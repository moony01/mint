<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section class="service-view">
    <h2 class="service__main-title">공지사항
        <span class="title_sub">민트의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
    </h2>
    <table class="notcie-view">
        <tr class="notcie-view__subject">
            <th class="notice-view__title">제목</th>
            <td colspan="3" id="subject">${noticeBoardDTO.subject}</td>
        </tr>
        <tr class="notcie-view__author">
            <th class="notice-view__title">작성자</th>
            <td colspan="3" id="id">${noticeBoardDTO.id}</td>
        </tr>
        <tr class="notcie-view__author">
            <th class="notice-view__title">작성일</th>
            <td id="logtime">${noticeBoardDTO.logtime}</td>
            <th class="notice-view__title">조회수</th>
            <td id="hit">${noticeBoardDTO.hit}</td>
        </tr>
        <tr class="notice-view__conent">
            <td colspan="4" id="conent">
                ${noticeBoardDTO.content}
            </td>
        </tr>
    </table>
    
    <div class="content_btm_wrap">
	    <div class="service__write-btn" onclick="window.location.href='/mintProject/shop/service/notice?pg='+${pg}">목록</div>
	    <div class="notice-board-movement" style="display: none;">
	    	<ul>
	    		<li class="prev">
		    		<strong>이전글</strong>
		    		<a href=""></a>
	    		</li>
				<li class="next">
					<strong>다음글</strong>
					<a href=""></a>
				</li>
	    	</ul>
	    </div>
    </div>
</section>











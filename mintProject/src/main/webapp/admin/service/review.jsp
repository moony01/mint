<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
    <h2 class="out">후기 관리</h2>
    <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
    <span class="ar-title">></span>        
    <a href="" class="ch-title now-title">후기 관리</a>        
</div>
<div class="container">
    <table class="table table-bordered" id = "reviewArea">
    </table>
</div>
<script type="text/javascript">
function drawReview(data) {
	var html = '<tr class="th--dark"><th class="col-md-1">번호</th><th class="col-md-3">TITLE</th><th class="col-md-5">CONTENT</th><th class="col-md-1">작성일</th><th class="col-md-1">작성자</th><th class="col-md-1"></th></tr>';
	data.forEach(function(item){
		html+= '<tr>';
		html+= '<td>' + item.seq + '</td>';
		html+= '<td>' + item.subject + '</td>';
		html+= '<td>' + item.content + '</td>';
		html+= '<td>' + item.logtime + '</td>';
		html+= '<td>' + item.id + '</td>';
		html+= '<td><button type="button" class="btn btn-primary delBtn" data = "' + item.seq + '">선택 삭제</button></td>';
		html+= '</tr>';
	})
	$("#reviewArea").empty().append(html);
	$(".delBtn").click(function(){
		var id = $(this).attr("data");
		$.ajax({
			method: "GET",
			type: 'json',
			dataType: "json",
			url: "/mintProject/api/review/delete?id=" + id,
			success:function(data) {
				getReview ();	
			}
		});
	})
}
function getReview () {
	// /api/review
	$.ajax({
		method: "GET",
		type: 'json',
		dataType: "json",
		url: "/mintProject/api/review",
		success:function(data) {
			drawReview(data);  
		}
	});
}
getReview();
</script>
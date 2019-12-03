<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.swal-button {
  background-color: #45B8AC;
}
</style>
</head>
<body>
</body>
<script>
$(function(){
	swal({
		text : "수정 완료!",
		showConfirmButton: true,
		//confirmButtonColor: '#8CD4F5',
		timer : 1600
	})
	.then(() => {
		location.href="/mintProject/qnaboard/getQnaBoardList";
	});
});
</script>
</html>

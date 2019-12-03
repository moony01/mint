<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script>
$(function(){
	swal({
		text : "답변 등록완료!",
		showConfirmButton: true,
		//confirmButtonColor: '#8CD4F5',
		timer : 1600
	})
	.then(() => {
		location.href="/mintProject/admin/service/getAdminQnaBoardList?pg="+${pg}
	});
});
	
</script>
</html>

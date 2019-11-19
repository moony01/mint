<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="javascript:void(0)" onclick="aa()"> 테스트 </a>
</body>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script>
function aa(){
	$.ajax({
		type: 'get',
		url: '/mintProject/admin/member/test',
		data: {'id' : 'jisu'},
		dataType: 'text',
		success: function(result){
			console.log(result.trim());
		},
		error: function(err){ 
			console.log(err);
		}
	});
	
}
</script>
</html>

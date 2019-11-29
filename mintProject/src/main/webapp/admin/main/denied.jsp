<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
 $(function(){
	 swal({
			text : '접근 권한이 없는 페이지입니다. \n 메인 화면으로 이동합니다. ',
			icon : 'warning',
			timer : 2000,
			buttons : false,
		})
	 location.href='/mintProject/shop/main/index';
 });
</script>
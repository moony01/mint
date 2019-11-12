<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="pwd_check_div">
	<div class="tit"></div>
	<div>비밀번호 재확인</div>
	<div>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</div>
	<div class="field_pwd">
	<div>아이디</div>
	<span>${memId}</span>
	<div>비밀번호</div>
	<input type="password" id="pwd">
	</div>
	
	<input type="button" value="확인" id="pwd_check">
	<div id="pwdDiv" style="display: inline-block;"></div>
</div>

<script src="/mintProject/shop/js/myinfo.js"></script>
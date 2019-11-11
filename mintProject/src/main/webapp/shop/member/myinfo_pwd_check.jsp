<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="pwd_check_div">
	<span>아이디</span>
	<span>${memId}</span>
	<span>비밀번호</span>
	<input type="password" id="pwd">
	<input type="button" value="확인" id="pwd_check">
	<div id="pwdDiv" style="display: inline-block;"></div>
</div>

<script src="/mintProject/shop/js/myinfo.js"></script>
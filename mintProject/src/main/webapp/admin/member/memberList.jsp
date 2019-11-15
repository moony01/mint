<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main__title">
        <h2 class="out">회원 관리</h2>
        <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>회원 관리</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">회원 목록</a>        
    </div>
    <div class="container">
        <div class="main__select" style="display:inline-block; justify-content: flex-start;">
            <select name="" id="" class="select-box" onchange="">
                <option value="0">전체</option>
                <option value="1">아이디 오름차순</option>
                <option value="2">회원레벨 오름차순</option>
                <option value="3">수신동의(Y)</option>
                <option value="4">가입일 내림차순</option>
            </select>
        </div>
        
        <div class="searches" style="float: right; display:flex; justify-content: flex-end;">
            <input type="text" name="daterange"> <br>
            <div class="search">
                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
        
        <table class="table table-bordered table-offer">
            <tr class="th--dark">
                <th class="col-md-1"><input type="checkbox" name="" id=""></th>
                <th class="col-md-4">아이디</th>
                <th class="col-md-1">회원레벨</th>
                <th class="col-md-1">SMS 동의여부</th>
                <th class="col-md-1">가입일</th>
            </tr>

            <tr>
                <td><input type="checkbox" name="" id=""></td>
                <td class="table--left"><a href="">hong</a></td>
                <td>일반</td>
                <td>Y</td>
                <td>19.11.12</td>
            </tr>
    
        </table>
        <div class="paging">
            <ul class="pagination">
                  <li class="page-item prev"></li>
                  <li class="page-item next"></li>
            </ul>
        </div>
        <div class="main__btns">
            <div>
                <button type="button" class="btn btn-primary">상태 변경</button>
            </div>
        </div>
    </div>
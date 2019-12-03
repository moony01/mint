<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="main__title">
        <h2 class="out">후기 관리</h2>
        <a href="" class="pa-title"><i class="fas fa-tasks"></i><span>게시판</span></a>
        <span class="ar-title">></span>        
        <a href="" class="ch-title now-title">후기 관리</a>        
    </div>
   
    <div class="container">
        <div class="main__select" style="display:inline-block; justify-content: flex-start;">
            <select name="" id="" class="select-box" onchange="getListByOption($(this))">
                <option value="0">전체</option>
            </select>
        </div>
      
        <table class="table table-bordered table-member">
            <tr class="th--dark">
                <th class="col-md-1">번호</th>
                <th class="col-md-4">제목</th>
                <th class="col-md-1">아이디</th>
                <th class="col-md-1">작성일</th>
                <th class="col-md-1">비고</th>
            </tr>

           <!-- 여기에 컬럼 추가 -->
           <tbody class="table table-bordered" id="reviewArea"></tbody>
    	
        </table>
        <div class="paging">
            <ul class="pagination">
                  <li class="page-item prev"></li>
                  <li class="page-item next"></li>
            </ul>
        </div>
      
    </div>
<script src="/mintProject/admin/js/review.js"></script>
<script type="text/javascript">
getReview();
</script>
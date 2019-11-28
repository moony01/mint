<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main__title">
	<h2 class="out">회원 관리</h2>
	<a href="" class="pa-title"><i class="fas fa-tasks"></i><span>판매자 관리</span></a>
	<span class="ar-title">></span>        
	<a href="" class="ch-title now-title">판매자 상세보기</a> 
</div>
<div class="container">	
	<h2 class="main__title sub__title">판매자 상세정보</h2>
	<table class="table table-bordered table-member">
	    <tr class="th--dark">
	        <th class="col-md-3">사업자 번호</th>
	        <td colspan="2">${supplierDTO.supplierCode}</td>
	    </tr>
	         
		<tr class="th--dark">
             <th class="col-md-3">상호명</th>
             <td colspan="2">${supplierDTO.id}</td>
	    </tr>
	    
	    <tr class="th--dark">
			<th class="col-md-3">카테고리</th>
			<c:if test="${supplierDTO.category == '101'}"><td colspan="2">농산물</td></c:if>
			<c:if test="${supplierDTO.category == '102'}"><td colspan="2">수산물</td></c:if>
			<c:if test="${supplierDTO.category == '103'}"><td colspan="2">축산물</td></c:if>
			<c:if test="${supplierDTO.category == '104'}"><td colspan="2">일반식품</td></c:if>
			<c:if test="${supplierDTO.category == '105'}"><td colspan="2">반찬류</td></c:if>   
	    </tr>
	    
	    <tr class="th--dark">
	        <th class="col-md-3">연락처</th>
	        <td colspan="2">${supplierDTO.tel}</td>
	    </tr>
	    
	    <tr class="th--dark">
	        <th class="col-md-3">주소</th>
	        <td colspan="2">${supplierDTO.addr1} ${supplierDTO.addr2 }</td>
	    </tr>
	    
	    <tr class="th--dark">
	        <th class="col-md-3">상태</th>
	        <c:if test="${supplierDTO.status == '0'}"><td colspan="2">판매중</td></c:if>
	        <c:if test="${supplierDTO.status == '1'}"><td colspan="2">판매중지</td></c:if>
	        <c:if test="${supplierDTO.status == '2'}"><td colspan="2">계약종료</td></c:if>
	    </tr>
	</table>
</div>
	       
<div class="container">
	<h2 class="main__title sub__title">판매 등록 상품 </h2>   
	<table class="table table-bordered table-member">
       <tr class="th--dark">
           <th class="col-md-3" >상품코드</th>
           <th class="col-md-3" >상품명</th>
           <th class="col-md-3" >평균별점</th>
       </tr>
        
       <c:forEach items="${list }" var="product">
		<tr class="th--dark">
			<td class="col-md-3">${product.productCode }</td>
			<td class="col-md-3">${product.mainSubject }</td>
			<td class="col-md-3"><fmt:formatNumber value="${product.star/10 }" pattern="0.0" />점</td>
		</tr>
		</c:forEach>
	</table>
</div>

<div class="container">
	<h2 class="main__title sub__title" style="margin-bottom: 0px;">매출 차트 </h2> 
	<div id="supplierSalesChart" style="width: 100%; height: 400px; padding-top: 20px;"></div>  
</div>

<div class="modal-footer">
	<button type="button" class="btn btn-primary" onclick="location.href='/mintProject/admin/member/supplierList'">목록으로</button>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script>
$().ready(function(){
	var data = ${jsonArray};
	var chartData = [];
	$.each((data), function(index,item){
		chartData.push([item.LOGTIME,item.SALES]);
	});
	createChart(chartData);
});

function createChart(chartData){
	Highcharts.setOptions({
        lang: {
            decimalPoint: '.',
            thousandsSep: ','
        }
    });
	Highcharts.stockChart('supplierSalesChart',{
		chart : {type : 'spline'},
		colors: ['#3399CC'], 
		series : [{
			data : chartData
		}],
		tooltip : {
			pointFormat: '<b>{point.y:,.0f} 원</b><br/>',
			valueDecimals: 2
		}
	});
}
</script>
		  
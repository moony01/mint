<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container"> 
	<h2 class="main__title sub__title" style="margin-top: 30px;">전체 매출</h2>
	<div class="chart-wrap" >
		<div id="totalSalesContainer" style="width: 100%; height: 400px; margin-bottom: 30px;"></div>
	</div>
	<h2 class="main__title sub__title">오늘 팔린 상품 순위</h2>
	<div class="chart-wrap" >
		<div id="productSalesContainer" style="width: 100%; height: 400px; margin-bottom: 30px;"></div>
	</div>
	<h2 class="main__title sub__title">이번 달 카테고리별 판매율</h2>
	<div class="chart-wrap">
		<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto; margin-bottom: 30px;"></div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/broken-axis.js"></script>

<script type="text/javascript">

$().ready(function(){
	getTotalSales()
	.then(putTotalSales)
	.catch();
	
	getProductSales()
	.then(putProductSales)
	.catch();
	
	getCategorySales()
	.then(putCategorySales)
	.catch();
});

//전체매출
function getTotalSales(){
	return $.ajax({
		type : 'GET',
		url : '/mintProject/admin/sales_getTotalSales',
		dataType : 'json',		 			
 	});
}
function putTotalSales(data){
	var chartData = [];
	$.each((data), function(index, item) {
		chartData.push([item.LOGTIME,item.SALES]);
	});
	createTotalSalesChart(chartData);
}
function createTotalSalesChart(chartData){
	Highcharts.setOptions({
        lang: {
            decimalPoint: '.',
            thousandsSep: ','
        }
    });
	Highcharts.stockChart('totalSalesContainer', {
		chart: { 
			type: 'line',
		},
		navigator : {
			series : {
				type : 'line',
				pointRange : null,
				dataGrouping : {  
					groupPixelWidth : 10
				}
			}
		},
		colors: ['#3399CC'],
        series : [{ 
	       	name : 'test',
	       	data : chartData,
        }],
        xAxis : {
			type : 'datetime',
			tickWidth: 0,
			tickInterval : 24 * 3600 * 1000, // one day,
			ordinal : false
		},
       	tooltip: {
			pointFormat: '<b>{point.y:,.0f} 원</b><br/>',
			valueDecimals: 2
 		}
	});
}
// 오늘 팔린 상품 순위
function getProductSales(){
	return $.ajax({
		type : 'GET',
		url : '/mintProject/admin/sales_getProductSales',
		dataType : 'json',
	});
}
function putProductSales(data){
	var seriesData = [];
	var categories = [];
	$.each((data), function(index, item) {
		categories.push(item.MAINSUBJECT);
		seriesData.push(item.COUNT);
	});
	createProductSalesChart(categories,seriesData);
}
function createProductSalesChart(categories,seriesData){
	Highcharts.chart('productSalesContainer', {
	    chart: {
	        type: 'bar',  
	        marginLeft: 220
	    },
	    colors: ['#3399CC'],
	    title: { text: '' },
	    xAxis: {
	    	categories: categories,
	    	labels : {
	    		style : {
	    			fontSize : '13px'
	    		}
	    	},
	        min: 0,
	        max: 9,
	        scrollbar: { enabled: true },
	        tickLength: 0
	    },
	    yAxis: {
	        min: 0,
	        max: 20,
	        title: {
	            text: '상품수',
	            align: 'high'
	        }
	    },
	    plotOptions: {
	        bar: {
	            dataLabels: { enabled: true }
	        }
	    },
	    legend: { enabled: false },
	    credits: { enabled: false },
	    series: [{
	        name: 'Votes',
	        data: seriesData
	    }]
	});
}
// 이번달 카테고리별 판매율
function getCategorySales(){
	return $.ajax({
		type : 'GET',
		url : '/mintProject/admin/sales_getCategorySales',
		dataType : 'json',
	});
}
function putCategorySales(data){
	var categories = [];
	var seriesData = [];
	$.each((data), function(index, item) {
		if(item.MAINCATEGORY=='101'){ categories.push('농산물'); } 
		else if(item.MAINCATEGORY=='102'){ categories.push('수산물'); }
		else if(item.MAINCATEGORY=='103'){ categories.push('축산물'); }
		else if(item.MAINCATEGORY=='104'){ categories.push('일반식품'); }
		else if(item.MAINCATEGORY=='105'){ categories.push('반찬류'); }
		seriesData.push(item.COUNT);
	});
	createCategorySalesChart(categories,seriesData);
}
function createCategorySalesChart(categories,seriesData){
	Highcharts.chart('container', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'  
	    },
	    title: {
	        text: ''
	    }, 
	    xAxis: {
	    	categories: categories,
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	            	formatter: function() {
	            		var sliceIndex = this.point.index;
	                    var sliceName = this.series.chart.axes[0].categories[sliceIndex];
	                    return sliceName
	                  }
	            },
	            showInLegend:true
	        }
	    },
	    legend: { enabled: false },
	    series: [{
	    	name : '판매율',
	        data: seriesData
	    }] 
	}); 
}
</script>

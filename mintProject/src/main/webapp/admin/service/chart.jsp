<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="totalSalesContainer" style="width: 100%; height: 400px;"></div>
<div id="productSalesContainer" style="width: 100%; height: 400px;"></div>
<!-- <script src="http://code.highcharts.com/highcharts.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>

<script type="text/javascript">
 	
	 function createTotalSalesChart(categories,seriesData){
		Highcharts.setOptions({
	        lang: {
	            decimalPoint: '.',
	            thousandsSep: ','
	        }
	    });
		var startY = categories[0].substring(0,4);
		var startM = categories[0].substring(5,7);
		var startD = categories[0].substring(8,10);
		Highcharts.stockChart('totalSalesContainer', {
			chart: { type: 'line' }, //Bar Chart
            title: { text: '매출' },
            subtitle: { text: '전체매출' },
            series : [{
            	name : 'test',
            	data : seriesData,
            	pointStart: Date.UTC(startY, parseInt(startM)-1, startD), 
                pointInterval: 24 * 3600 * 1000 // one day,
            }],
            xAxis: { categories: categories },
            tooltip: {
	 			pointFormat: '<b>{point.y:,.0f} 원</b><br/>',
	 			valueDecimals: 2
	 		}
		});
	}
	
	$.ajax({
		type : 'GET',
		url : '/mintProject/admin/sales_getTotalSales',
		dataType : 'json',
		success : function(data){
			var seriesData = [];
			var categories = [];
			$.each((data), function(index, item) {
				categories.push(item.LOGTIME);
				seriesData.push(item.SALES);
			});
			createTotalSalesChart(categories, seriesData); 
		},
		error : function(err){
			console.log(err);
		}
	});  
	function createProductSalesChart(categories,seriesData){
		Highcharts.chart('productSalesContainer', {
		    chart: {
		        type: 'bar',
		        marginLeft: 150
		    },
		    title: { text: '많이 팔린 상품' },
		    subtitle: { text: '상품' },
		    xAxis: {
		    	categories: categories,
		        min: 0,
		        max: 8,
		        scrollbar: { enabled: true },
		        tickLength: 0
		    },
		    yAxis: {
		        min: 0,
		        max: 1200,
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
	
	$.ajax({
		type : 'GET',
		url : '/mintProject/admin/sales_getProductSales',
		dataType : 'json',
		success : function(data){
			var seriesData = [];
			var categories = [];
			$.each((data), function(index, item) {
				categories.push(item.MAINSUBJECT);
				seriesData.push(item.COUNT);
			});
			createProductSalesChart(categories,seriesData);
		},
		error : function(err){
			console.log(err);
		}
	});
</script>

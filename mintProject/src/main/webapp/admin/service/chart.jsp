<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="container" style="width: 100%; height: 400px;"></div>
<div id="container2" style="width: 100%; height: 400px;"></div>
<!-- <script src="http://code.highcharts.com/highcharts.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>

<script type="text/javascript">
 	 
 	 var seriesOptions = [],
	 seriesCounter = 0,
	 names = ['MSFT', 'AAPL', 'GOOG'];

	 function createChart() {

	 	Highcharts.stockChart('container', {
			rangeSelector: {
			 	selected: 4
			 },
		 	plotOptions: {
		 		series: {
		 			showInNavigator: true
				}
		 	},
			tooltip: {
	 			pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y} USD</b><br/>',
	 			valueDecimals: 2
	 		},

			series: seriesOptions
		});
	}

	function success(data) {
		var name = this.url.match(/(msft|aapl|goog)/)[0].toUpperCase();
		var i = names.indexOf(name);
		seriesOptions[i] = {
			name: name,
			data: data
		}; 
	
		seriesCounter += 1;
	
		if (seriesCounter === names.length) {
			createChart();
		}
	}

	Highcharts.getJSON(
		'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/msft-c.json',
		success  
	); 
	Highcharts.getJSON(
		'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/aapl-c.json',
		success
	);
	Highcharts.getJSON(
		'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/goog-c.json',
		success
	);   
	 
	 /* function createChart(categories,seriesData){
		console.log(categories);
		var startY = categories[0].substring(0,4);
		var startM = categories[0].substring(5,7);
		var startD = categories[0].substring(8,10);
		
		console.log(startY + " " + startM + " " + startD);
		Highcharts.stockChart('container', {
			chart: { type: 'line' }, //Bar Chart
            title: { text: '매출' },
            subtitle: { text: '전체매출' },
            series : [{
            	name : 'test',
            	data : seriesData,
            	pointStart: Date.UTC(startY, parseInt(startM)-1, startD), 
                pointInterval: 24 * 3600 * 1000 // one day
            }],
            xAxis: {
                categories: categories
            }
		});
	}
	
	$.ajax({
		type : 'GET',
		url : '/mintProject/admin/sales_getData',
		dataType : 'json',
		success : function(data){
			var seriesData = [];
			var categories = [];
			$.each((data), function(index, item) {
				categories.push(item.logtime);
				seriesData.push((item.qty * item.price));
			});
			createChart(categories, seriesData);
		},
		error : function(err){
			console.log(err);
		}
	});  */
	
	
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="container" style="width:100%; height:400px;"></div>
<div id="container2" style="width:100%; height:400px;"></div>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript">
/* document.addEventListener('DOMContentLoaded', function () {
    var myChart = Highcharts.chart('container', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Fruit Consumption'
        },
        xAxis: {
            categories: ['Apples', 'Bananas', 'Oranges']
        },
        yAxis: {
            title: {
                text: 'Fruit eaten'
            }
        },
        series: [{
            name: 'Jane',
            data: [1, 0, 4]
        }, {
            name: 'John',
            data: [5, 7, 3]
        }]
    });
}); */
Highcharts.setOptions({
    chart: {
        backgroundColor: {
            linearGradient: [0, 0, 500, 500],
            stops: [
                [0, 'rgb(255, 255, 255)'],
                [1, 'rgb(240, 240, 255)']
            ]
        },
        borderWidth: 2,
        plotBackgroundColor: 'rgba(255, 255, 255, .9)',
        plotShadow: true,
        plotBorderWidth: 1
    }
});
var chart1 = new Highcharts.Chart({
	title: {
	    text: '1번 차트'
	},
	subtitle: {
	    text: '여긴 소제목'
	},
    chart: {
        renderTo: 'container',
    },
    xAxis: {
        type: 'datetime'
    },
    series: [{
    	name : 'Data 1',
        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4], 
        pointStart: Date.UTC(2010, 0, 1),
        pointInterval: 3600 * 1000 // one hour
    },
    {
    	name : 'Data 2',
        data: [1.9, 122.5, 110.4, 145.2, 104.0, 100.0, 115.6, 127.5, 167.4, 188.4, 76.6, 94.4],
        pointStart: Date.UTC(2010, 0, 1),
        pointInterval: 3600 * 1000 // one hour
    },
    
    ]
});
var chart2 = new Highcharts.Chart({
    chart: {
        renderTo: 'container2',
        type: 'areaspline'
    },
    xAxis: {
        type: 'datetime'
    },
   /*  series: [{
        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
        pointStart: Date.UTC(2010, 0, 1),
        pointInterval: 3600 * 1000 // one hour
    }] */
    series: [{
        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5,
                { y: 216.4, color: '#BF0B23'}, 194.1, 95.6, 54.4]
    }]
});
</script>

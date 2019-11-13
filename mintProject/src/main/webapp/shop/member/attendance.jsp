<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://momentjs.com/downloads/moment.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/locale-all.js'></script>
<link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" />

<style>
.fc-row.fc-week.fc-widget-content{
	min-height: 6em;
}
.fc-left {
	font-size: 20px;
	font-weight: bolder;
}
#calendar_wrap {
	margin-top : 30px;  
	display: flex;
	justify-content: center;
}
</style>

<div id="calendar_wrap">
	<div id='calendar' style="width: 600px;"></div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var prevEvents;
$(document).ready(function(){
	$('#calendar').fullCalendar({
		height : 'auto',
		contentHeight: '600',
	    defaultView: 'month',
		locale : 'ko',
	    header: {
	      left : 'title',
	      center: '',
	      right : 'prev addEventButton next'
	    },
		events : function(start, end, timeaone, callback){
			$.ajax({
				type : 'POST',
     			url : '/mintProject/shop/mypage/getAttDates',
     			dataType : 'JSON',
     			success : function(data){
     				if(data.attDates=="!"){
     					alert("매일매일 출석체크해서 포인트를 모아보세요 :D");
     				} else { 
     					var events = [];
           				$.each(data.attDates, function(index,value){
           					events.push({
           					 	start: '20'+value,
           					 	imageurl : '../storage/mint/icon/main_logo.png',
           					 	color : 'transparent'
           					});
           				});
           				callback(events);
     				}
     			},
     			error : function(err){
     				console.log(err);
     			}
			});		
		},	
	    customButtons: {
	      addEventButton: {
	        text: '출석체크',
	        click: function() { checkAttDup(); }
	      }
	    },
	    eventRender:function(event, eventElement) {
            if(event.imageurl) {
                eventElement.find("div.fc-content").prepend("<center><img src='" + event.imageurl + "', width='40px;' height='40px;'><center>");
            }
        },
        eventAtferAllRender : function(){
        	$('.fc-row.fc-week.fc-widget-content').attr('style', 'min-height: 6em');
        }
	  });

	function checkAttDup(){ // 하루에 한 번만 가능
		$.ajax({
    		type : 'POST',
			url : '/mintProject/shop/mypage/attendance_checkdup',
			dataType : 'text',
			success : function(data){
				if(data=='already'){ 
					swal('이미 출석체크 하였습니다.'); 
				} 
				else { attCheckin(); }
			},
			error : function(err){
				console.log(err);
			}
    	}); 
	}
	
	function attCheckin(){ // 출석체크
		$.ajax({
			type : 'POST',
			url : '/mintProject/shop/mypage/attendance_checkin',
			dataType : 'text',
			success : function(date){
				$('#calendar').fullCalendar('renderEvent', {
		              start: date,
		              imageurl : '../storage/mint/icon/main_logo.png', 
   					  color : 'transparent'
		        });
			},
			error : function(err){
				console.log(err);
			}
		});	
	}
});
</script>


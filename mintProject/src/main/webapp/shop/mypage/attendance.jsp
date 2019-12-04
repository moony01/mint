<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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

<jsp:include page="mypage_main.jsp"/>

<section class="service">
    <div class="snb">
        <h2 class="snb__title">마이페이지</h2>
        <ul class="snb__list">
            <li class="snb__item"><a href="/mintProject/shop/mypage/myOrderList">주문내역</a></li>
            <li class="snb__item"><a href="">늘 사는 것</a></li>
            <li class="snb__item"><a href="/mintProject/shop/mypage/review">상품 후기</a></li>
            <li class="snb__item"><a href="">적립금</a></li>
            <li class="snb__item"><a href="/mintProject/shop/mypage/myinfo_pwd">개인 정보 수정</a></li>
            <li class="snb__item current"><a href="/mintProject/shop/mypage/attendance">출석체크</a></li>
        </ul>
    </div>
    <div class="service__main">
        <h2 class="service__main-title">출석체크</h2>
        <div id="calendar_wrap">
			<div id='calendar' style="width: 600px;"></div>
		</div>
    </div>
    
</section>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://momentjs.com/downloads/moment.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/locale-all.js'></script>
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
     					swal({
     						text : "매일매일 출석체크해서 포인트를 모아보세요 :D",
     						buttons : false
     					});
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
					swal({
						text: '이미 출석체크 하였습니다.',
						button: false
					}); 
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


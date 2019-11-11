<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://momentjs.com/downloads/moment.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/locale-all.js'></script>
<link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" />
</head>

<body>
	<div id='calendar' style="width: 600px; height: 500px;"></div> 
</body>  

<div id="fullCalModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="modalTitle" class="modal-title"></h4>
            </div>
            <div id="modalBody" class="modal-body"></div>
        </div>
    </div>
    Test
</div>

<script>
var prevEvents;
$(document).ready(function(){
	$('#calendar').fullCalendar({
		height : 'auto',
	    defaultView: 'month',
		locale : 'ko',
	    header: {
	      center: '',
	      right : 'addEventButton'
	    },
		events : function(start, end, timeaone, callback){
			$.ajax({
				type : 'POST',
     			url : '/mintProject/shop/member/getAttDates',
     			dataType : 'JSON',
     			success : function(data){
     				if(data.attDates=="!"){
     					alert("매일매일 출석체크해서 포인트를 모아보세요 :D");
     				} else {
     					var events = [];
           				$.each(data.attDates, function(index,value){
           					events.push({
           						title: ':D',
        			            	start: '20'+value,
        			            	allDay: true
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
	        click: function() {
	        	$.ajax({
	        		type : 'POST',
    				url : '/mintProject/shop/member/attendance_isAlready',
    				dataType : 'text',
    				success : function(data){
    					if(data=='already'){
    						alert("이미 출석체크를 하였습니다");
    					} else {
    						$.ajax({
    		    				type : 'POST',
    		    				url : '/mintProject/shop/member/attendance_checkin',
    		    				dataType : 'text',
    		    				success : function(date){
    		    					$('#calendar').fullCalendar('renderEvent', {
    		    			              title: ':D',
    		    			              start: date,
    		    			              allDay: true
    		    			        });
    		    				},
    		    				error : function(err){
    		    					console.log(err);
    		    				}
    		    			});	
    					}
    				},
    				error : function(err){
    					console.log(err);
    				}
	        	}); 
	        }
	      }
	    },
	    
	  /*   eventClick: function(event) {
            $('#fullCalModal').modal();
            $('#modalTitle').html(event.event.title);
            $('#modalBody').html(event.event.extendedProps.description);
        }, */
	  });
});
</script>


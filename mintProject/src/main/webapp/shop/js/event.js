/**
 *  이벤트 스크립트
 *  
 *  index.jsp에 js를 물렸으므로 어느 페이지에 있든 실행될 수 있다
 *  
 */

/////////////////////////////////////////////////////////////
/**
 *	이벤트 로직 쿼리
 *
 *  1. AJAX로 이벤트 리스트를 가져옴
 *  2. 
 *  3. startDate - 현재 시간(now)의 값을 이벤트 실행 setTimeout의 delay 패러미터에 넣음
 *  4. 이벤트 실행 setTimeout이 0이 되거나 음수가 되면 1~50ms 후 곧바로 product DB에 update
 *  5. endDate - 현재 시간(now)의 값을 이벤트 종료 setTimeout의 delay 패러미터에 넣음
 *  6. 이벤트 종료 setTimeout이 0이 되거나 음수가 되면 1~50ms 후 곧바로 product DB에 update
 *  7. 이벤트 종료시 모든 discountRate는 0이 된다(기존 discountRate를 보존할 수 있는 방법이 있다면 시도해보겠음)
 */

$(function(){	

	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getEventList',
		dataType:'json',
		success: function(result){
			eventExecute(result);
		},
		error: function(error){
			console.error(error);
		}
	});
});

function eventExecute(result){
	let event = result.list;
	var now = new Date();
	var eventOngoing = null;
	
	for(var i=0; i<event.length; i++){
		if(event[i].startDate < now) var startCount = 0;
		else var startCount = event[i].startDate - now;
		var endCount = event[i].endDate - now;
		let eventStatus = event[i].eventStatus;
		let productCode = event[i].productCode;
		let discountRate = event[i].discountRate;
		let prevDiscountRate = event[i].prevDiscountRate;
		
		/* 이벤트 진행 여부 */
		if(eventStatus === 1 && endCount > 0){
			console.log('시작까지 남은 시간 : '+startCount+', 종료까지 남은 시간 : '+endCount);
			// 이벤트 진행중이고 종료되지 않은 이벤트
			
			/* 일일특가 카운트 다운 */
			if(event[i].subject.indexOf('[일일특가]') !== -1){
				var countTo = event[i].startDate;
				dailySpecialCntDown(countTo, 'dscd');
			}
			
			eventOngoing = setTimeout(function(){
				$.ajax({
					type:'post',
					url:'/mintProject/admin/service/eventProductUpdate',
					data:'productCode='+productCode
						+'&discountRate='+discountRate,
					success: function(){
						console.log("이벤트 실행 성공!");
					},
					error: function(error){
						console.error(error);
					}
				});
			}, startCount);
			
			
		} else if(eventStatus === 1 && endCount <= 0) {
			console.log('시작까지 남은 시간 : '+startCount+', 종료까지 남은 시간 : '+endCount);			
			// 진행중 상태지만 이벤트 종료
						
			setTimeout(function(){
				clearTimeout(eventOngoing);
				console.log('이벤트 종료!');
			}, endCount);
			
			// 이전 할인율로 update하기
			$.ajax({
				type:'post',
				url:'/mintProject/admin/service/eventEndProductUpdate',
				data:'productCode='+productCode
					+'&prevDiscountRate='+prevDiscountRate,
				success: function(){
					console.log("되돌리기 성공!");
				},
				error: function(error){
					console.error(error);
				}
			});
		}
	}
	
	
	
	
}

/* 일일특가 카운트다운 실행 로직 */
//참고 : https://guwii.com/bytes/easy-countdown-to-date-with-javascript-jquery/
function dailySpecialCntDown(countTo, id){
	 countTo = new Date(countTo).getTime();
	  var now = new Date(),
	      countTo = new Date(countTo),
	      timeDifference = (countTo - now);
	      
	  var secondsInADay = 60 * 60 * 1000 * 24,
	      secondsInAHour = 60 * 60 * 1000;
	 hours = Math.floor((timeDifference % (secondsInADay)) / (secondsInAHour) * 1);
	 mins = Math.floor(((timeDifference % (secondsInADay)) % (secondsInAHour)) / (60 * 1000) * 1);
	 secs = Math.floor((((timeDifference % (secondsInADay)) % (secondsInAHour)) % (60 * 1000)) / 1000 * 1);
	 
	 
	var cntdwn = document.getElementById('dscd');
	cntdwn.getElementsByClassName('hours')[0].innerHTML = hours;
	cntdwn.getElementsByClassName('minutes')[0].innerHTML = mins;
	cntdwn.getElementsByClassName('seconds')[0].innerHTML = secs;
	
	clearTimeout(dailySpecialCntDown.interval);
	dailySpecialCntDown.interval = setTimeout(function(){ dailySpecialCntDown(countTo, 'dscd'); },1000);
}


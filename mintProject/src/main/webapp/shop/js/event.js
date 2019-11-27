/**
 *  이벤트 스크립트
 *  
 *  index.jsp에 js를 물렸으므로 어느 페이지에 있든 실행될 수 있다
 *
 *  1. AJAX로 이벤트 리스트를 가져옴
 *  2. eventStatus가 1이고 endDate에서 현재 시간을 뺀 값이 양수면 실행한다
 *  3. startDate - 현재 시간(now)의 값을 이벤트 실행 setTimeout의 delay 패러미터에 넣음
 *  4. 이벤트 실행 setTimeout이 0이 되거나 음수가 되면 1~50ms 후 곧바로 product DB에 update
 *  5. endDate - 현재 시간(now)의 값을 이벤트 종료 setTimeout의 delay 패러미터에 넣음
 *  6. 이벤트 종료 setTimeout이 0이 되거나 음수가 되면 1~50ms 후 곧바로 product DB에 update
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
	let now = new Date();
	var eventOngoing = null;
	
	for(var i=0; i<event.length; i++){
		if(event[i].startDate < now) var startCount = 0;
		else var startCount = event[i].startDate - now;
		let endCount = event[i].endDate - now
		  , eventStatus = event[i].eventStatus
		  , seq = event[i].seq
		  , discountRate = event[i].discountRate
		  
		/* 이벤트 진행 여부 */
		if(eventStatus === 1 && endCount > 0){
			/* 진행중인 일일특가 카운트 다운 */
			if(event[i].subject.indexOf('[일일특가]') !== -1){
				var countTo = event[i].endDate;
				dailySpecialCntDown(countTo, 'dscd');
				dailySpecialInfo(seq, discountRate);
			}
		} else {
			// 시간 지나면 해당 부분 종료 이미지로 처리하기
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

/* 일일특가 상품 정보 */
function dailySpecialInfo(seq, discountRate){
	// 상품 정보 가져오기 (ProductDTO)
	$.ajax({
		type:'post',
		url:'/mintProject/admin/service/getProductList',
		data:'seq='+seq,
		dataType:'json',
		success: function(result){
			let eventProduct = result.list[0];
			let subject = eventProduct.mainSubject;
			let price = eventProduct.price;
			
			// 할인가 계산
			let eventPrice = price-(price/100*discountRate); 
			$('.ds-subject').text(subject);
			$('.ds-discountrate').text(discountRate+'%');
			$('.ds-price').text(price+'원');
			$('.ds-eventprice').text(eventPrice+'원');
		},
		error: function(error){
			console.error(error);
		}
	});
}


/**
 *  이벤트 스크립트
 *  
 *  일일특가 이벤트 정보만 가져옴
 */

$(function(){	

	$.ajax({
		type:'post',
		url:'/mintProject/shop/service/getEventList',
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
		if(eventStatus === '1' && endCount > 0 && startCount == 0){
			var cnt = 0;
			/* 진행중인 일일특가 카운트 다운 */
			if(event[i].subject.indexOf('[일일특가]') !== -1){
				cnt++;
				var countTo = event[i].endDate;
				dailySpecialCntDown(countTo, 'dscd');
				dailySpecialInfo(seq, discountRate);
			}
			
			if(cnt === 0){
				$('.ds-thumbnail')
				.addClass('dailyspecial-thumb')
				.css({'background-image':'url(/mintProject/shop/storage/mint/event/event_end.png)'})
				.css('opacity', '0.5');
				$('#dscd').text('일일특가 종료');
				$('.main__special-count').css('opacity', '0.5');
			}
		}
	}	
}

/* 일일특가 카운트다운 실행 로직 */
//참고 : https://guwii.com/bytes/easy-countdown-to-date-with-javascript-jquery/
function dailySpecialCntDown(countTo, id) {
	countTo = new Date(countTo).getTime();
	var now = new Date()
	  , countTo = new Date(countTo), timeDifference = (countTo - now);

	var secondsInADay = 60 * 60 * 1000 * 24, secondsInAHour = 60 * 60 * 1000;
		hours = Math.floor
				((timeDifference % (secondsInADay)) / (secondsInAHour)* 1);
		mins = Math.floor
				(((timeDifference % (secondsInADay)) % (secondsInAHour))/ (60 * 1000) * 1);
		secs = Math.floor
				((((timeDifference % (secondsInADay)) % (secondsInAHour)) % (60 * 1000)) / 1000 * 1);
	if(hours <= 0 && mins <= 0 && secs <= 0){
		$('#dscd').text('일일특가 종료');
	} else {
		var cntdwn = document.getElementById('dscd');
		cntdwn.getElementsByClassName('hours')[0].innerHTML = hours;
		cntdwn.getElementsByClassName('minutes')[0].innerHTML = mins;
		cntdwn.getElementsByClassName('seconds')[0].innerHTML = secs;
		clearTimeout(dailySpecialCntDown.interval);
		dailySpecialCntDown.interval = setTimeout(function() {
			dailySpecialCntDown(countTo, 'dscd');
		}, 1000);		
	}
}

/* 일일특가 상품 정보 */
function dailySpecialInfo(seq, discountRate){
	// 상품 정보 가져오기 (ProductDTO)
	$.ajax({
		type:'post',
		url:'/mintProject/shop/service/getEventProductList',
		data:'seq='+seq,
		dataType:'json',
		success: function(result){
			let eventProduct = result.list[0];
			let mainSubject = eventProduct.mainSubject;
			let subSubject = eventProduct.subSubject;
			let price = eventProduct.price;
			let thumbnail = eventProduct.thumbnail;

			// 할인가 계산
			let eventPrice = price-(price/100*discountRate); 
			$('.ds-mainsubject').text(mainSubject);
			$('.ds-subsubject').text(subSubject);
			$('.ds-price').text(price+'원');
			$('.ds-eventprice').text(eventPrice+'원');
			$('.ds-thumbnail').addClass('dailyspecial-thumb').css({'background-image':'url(/mintProject/shop/storage/mint/product/'+thumbnail+')'});

			if(discountRate === '10'){
				$('.main__special-thumb').append('<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_10_mint.png"/>');				
			}else if(discountRate === '20'){
				$('.main__special-thumb').append('<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_20_mint.png"/>');			
			}else if(discountRate === '30'){
				$('.main__special-thumb').append('<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_30_mint.png"/>');				
			}else if(discountRate === '40'){
				$('.main__special-thumb').append('<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_40_mint.png"/>');				
			}else if(discountRate === '50'){
				$('.main__special-thumb').append('<img class="discount-rate" src="/mintProject/shop/storage/mint/icon/icon_save_50_mint.png"/>');				
			}
		},
		error: function(error){
			console.error(error);
		}
	});
}


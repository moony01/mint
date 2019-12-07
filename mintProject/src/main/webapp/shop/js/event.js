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
	
	$.ajax({
		type:'post',
		url:'/mintProject/shop/service/getEventListMain',
		dataType:'json',
		success: function(result){
			eventMainTemp(result);
		},
		error: function(error){
			console.error(error);
		}
	});
});

function eventExecute(result){	
	let now = new Date();
	var eventOngoing = null;
	
	let event = result.list;
	
	/* 이벤트 진행 여부 */
	var cnt = 0;
	
	for(var i=0; i<event.length; i++){
		if(event[i].startDate < now) var startCount = 0;
		else var startCount = event[i].startDate - now;
		let endCount = event[i].endDate - now
		, eventStatus = event[i].eventStatus
		, seq = event[i].seq
		, subject = event[i].subject
		, discountRate = event[i].discountRate;

		if(eventStatus === '1' && endCount > 0 && startCount == 0){
			if(subject.indexOf('일일특가') !== -1){
				cnt++;
				/* 진행중인 일일특가 카운트 다운 */
				var countTo = event[i].endDate;
				dailySpecialCntDown(countTo, 'dscd');
				dailySpecialInfo(seq, discountRate);
			}
		}	
	}	
		
	/* 진행중인 일일특가 없다면 종료 이미지 교체*/
	if(cnt === 0){
		$('.ds-thumbnail')
		.addClass('dailyspecial-thumb')
		.css({'background-image':'url(/mintProject/shop/storage/mint/event/event_end.png)'})
		.css('opacity', '0.5');
		$('#dscd').text('일일특가 종료');
		$('.main__special-count').css('opacity', '0.5');
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
	if(hours < 0 && mins < 0 && secs < 0){
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
			let mainSubject = eventProduct.mainSubject
			  , subSubject = eventProduct.subSubject
			  , productCode = eventProduct.productCode
			  , subCategory = eventProduct.subCategory
			  , price = eventProduct.price
			  , thumbnail = eventProduct.thumbnail;
			
			// 할인가 계산
			let eventPrice = price-(price/100*discountRate); 
			
			$('.ds-mainsubject').text(mainSubject);
			$('.ds-subsubject').text(subSubject);
			$('.ds-price').text(price+'원');
			$('.ds-eventprice').text(eventPrice+'원');
			$('.ds-thumbnail').addClass('dailyspecial-thumb').css({'background-image':'url(/mintProject/shop/storage/mint/product/'+thumbnail+')'});

			$('.main__special-thumb').attr('href', '/mintProject/shop/product/productView?productCode='+productCode+'&subCategory='+subCategory);
			
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

/* 메인 이벤트 소식 */
function eventMainTemp(result){
	let event = result.list;
	let now = new Date();
	
	for(var i=0; i<event.length; i++){
		if(event[i].startDate < now) var startCount = 0;
		else var startCount = event[i].startDate - now;
		let endCount = event[i].endDate - now
		, eventStatus = event[i].eventStatus
		, seq = event[i].seq
		, subject = event[i].subject
		, eventThumbnail = event[i].eventThumbnail;

		if(eventStatus === '1' && endCount > 0 && startCount == 0){
						
				$('.news__list').append
				($('<li/>',{
					class : 'news__item'
				}).append
					($('<a/>',{
						href : '/mintProject/shop/goods/eventProductList?seq='+seq+'&pg=1'
					}).append
						($('<img/>',{
							class : 'news__thumb',
							style : 'background-image:url(/mintProject/shop/storage/mint/event/'+eventThumbnail+')'
						})
					)).append
						($('<div/>',{
							class : 'news__subject',
							text : subject
						}))
					)
				;
			
		}
	}	
}

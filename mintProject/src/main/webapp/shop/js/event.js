/**
 *  이벤트 스크립트
 *  
 *  메인 화면 접근시 곧바로 실행
 *  
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

	// 이벤트 배열
	const events = [];
	// 이벤트 객체에 저장할 내용들
	var seq = {};
	var startDate = {};
	var endDate = {};
	var now = JSON.stringify(new Date());
	
	for(var i=0; i<event.length; i++){
		if(event[i].eventStatus === 1){
//			var eventOngoing = setTimeout(function(){
//				console.log(event.seq[i]);
//			}, event.startDate[i] - now);
//			setTimeout(function(){
//				clearTimeout(eventOngoing);
//			}, event.endDate[i] - now);
		} else {
			console.log(event[i].seq);
		}
	}
	
}



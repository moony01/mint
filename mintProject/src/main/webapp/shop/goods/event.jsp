<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<section class="wrap">

</section>

<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'/mintProject/shop/service/getEventList',
		dataType:'json',
		success: function(result){
			eventBannerTemp(result);
		},
		error: function(error){
			console.error(error);
		}
	});	
});


function eventBannerTemp(result){
	let event = result.list;
	let now = new Date();
	
	for(var i=0; i<event.length; i++){
		if(event[i].startDate < now) var startCount = 0;
		else var startCount = event[i].startDate - now;
		let endCount = event[i].endDate - now
		, eventStatus = event[i].eventStatus
		, seq = event[i].seq
		, eventThumbnail = event[i].eventThumbnail;
		
		if(eventStatus === '1' && endCount > 0 && startCount == 0){
			$('.wrap').append
				($('<div/>',{
					class : 'event__thumb'
				}).append
						($('<a/>',{
							href : '/mintProject/shop/goods/eventProductList?seq='+seq+'&pg=1'
						}).append
							($('<img/>',{
								class : 'event-thumb',
								src : '/mintProject/shop/storage/mint/event/'+eventThumbnail
							})
						))
				)
			;
		}
	}
	
}
</script>


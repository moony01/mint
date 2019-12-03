var swiper = new Swiper('.main__banner-slide', {
    loop: true,
    speed: 600,
    autoplay: {
        delay: 5000,
    },
    navigation: {
        nextEl: '#banner-next',
        prevEl: '#banner-pre',
    },
});

var swiper = new Swiper('.main__event-slide2', {
    slidesPerView: 4,
    slidesPerGroup: 2,
    speed: 200,
    spaceBetween: 30,
    loop: true,
    navigation: {
        nextEl: '#event2-next',
        prevEl: '#event2-pre',
    },
});
var swiper = new Swiper('.main__event-slide3', {
    slidesPerView: 4,
    slidesPerGroup: 2,
    speed: 200,
    spaceBetween: 30,
    loop: true,
    navigation: {
        nextEl: '#event3-next',
        prevEl: '#event3-pre',
    },
});

var windowWidth = $(window).width();
if(windowWidth < 480 && windowWidth >= 320) {
	var swiper = new Swiper('.main__event-slide1', {
	    slidesPerView: 2,
	    slidesPerGroup: 1,
	    speed: 200,
	    loop: true,
	    navigation: {
	        nextEl: '#event1-next',
	        prevEl: '#event1-pre',
	    },
	});
}else {
	var swiper = new Swiper('.main__event-slide1', {
	    slidesPerView: 4,
	    slidesPerGroup: 2,
	    speed: 200,
	    spaceBetween: 30,
	    loop: true,
	    navigation: {
	        nextEl: '#event1-next',
	        prevEl: '#event1-pre',
	    },
	});
}

	
	

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr" />
<meta name="title" content="마켓컬리 :: 내일의 장보기, 마켓컬리" />
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
<meta name="naver-site-verification" content="58ff7c242d41178131208256bfec0c2f93426a1d" />
<script type="text/javascript" src="https://res.kurly.com/js/lib/jquery-1.10.2.min.js?ver=20191028174155"></script>
<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<script>
var jwtToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjYXJ0X2lkIjoiODZlZWFmN2RmMDM2NzFmYzczNGQ0MmM3MDkyMzUyZjIiLCJpc19ndWVzdCI6dHJ1ZSwidXVpZCI6bnVsbCwic3ViIjpudWxsLCJpc3MiOiJodHRwOi8vbWt3ZWIuYXBpLmt1cmx5LnNlcnZpY2VzL3YxL3VzZXJzL2F1dGgvZ3Vlc3QiLCJpYXQiOjE1NzIyNDgwNTMsImV4cCI6MTU3MjI1MTY1MywibmJmIjoxNTcyMjQ4MDUzLCJqdGkiOiI0WTY3WWhjbFlmTlRobmNJIn0.jo8oNm0VEeyUfw1_T-q7QimxkYkbCpq49gWH-Bxfq9k';
var apiDomain = 'https://api.kurly.com';
var GD_ISMEMBER = !!Number('0');
var checkIsApp = true;// 해당스크립트관련으로 앱체크공용변수추가 생성.앱에서 불필요한 호출제거
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?ver=20191028174155"></script>
<script src="https://www.kurly.com/shop/data/skin/designgj/thefarmers.js?ver=20191028174155"></script>
<script src="https://www.kurly.com/shop/data/skin/designgj/common.js?ver=20191028174155"></script>
<script src="https://www.kurly.com/shop/data/skin/designgj/polify.js?ver=20191028174155"></script>
<script src="https://www.kurly.com/shop/data/skin/designgj/ui_v2.js?ver=20191028174155"></script>
<script src="https://res.kurly.com/js/lib/jquery.lazyload.min.js?ver=20191028174155"></script>

<script src="//res.kurly.com/js/vue/xdomain.min.js" slave="https://api.kurly.com/xdomain"></script>

<script src="//res.kurly.com/js/vue/es6-promise.min.js?ver=20191028174155"></script>
<script src="//res.kurly.com/js/vue/es6-promise.auto.min.js?ver=20191028174155"></script>

<script type="text/javascript" src="//res.kurly.com/js/vue/axios.min.js?ver=20191028174155"></script>


<script src="//res.kurly.com/js/vue/vue.min.js?ver=20191028174155"></script>
<script src="https://www.kurly.com/common_js/axios.js?ver=20191028174155"></script>
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/normalize.css?ver=20191028174155">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/section1.css?ver=20191028174155">
<link rel="styleSheet" href="https://www.kurly.com/shop/data/skin/designgj/common.css?ver=20191028174155">

<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript" src="https://www.kurly.com/shop/lib/js/naverCommonInflowScript.js?Path=main/index.php&amp;Referer=&amp;AccountID=s_4f41b5625072&amp;Inflow=kurly.com" id="naver-common-inflow-script"></script>


<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
	kakaoPixel('4255794279014838741').pageView();
</script>

<style>.async-hide { opacity: 0 !important} </style>
<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), 
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-90734988-1', 'auto');//'UA-90734988-1'
<!-- KM-201 장차석 : 구글 옵티마이즈&태그 메니저 -->
ga('require', 'GTM-MRW9DRV');
(function(a,s,y,n,c,h,i,d,e){s.className+=' '+y;h.start=1*new Date;
    h.end=i=function(){s.className=s.className.replace(RegExp(' ?'+y),'')};
    (a[n]=a[n]||[]).hide=h;setTimeout(function(){i();h.end=null},c);h.timeout=c;
})(window,document.documentElement,'async-hide','dataLayer',4000,{'GTM-MRW9DRV':true});

(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NJDKR7R');
<!-- End KM-201 장차석 : 구글 옵티마이즈&태그 메니저 -->

var uuidCheck = "";
var cookie_uuid = null;

function setCookieGa(cookieName, value){
	var exdays = 365;
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue +"; path=/;"
}

function getCookieGa(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

function deleteCookieGa(cookieName){
	var expireDate = new Date();
	//어제 날짜를 쿠키 소멸 날짜로 설정한다.
	expireDate.setDate( expireDate.getDate() - 1 );
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
}


/* 로그인 */
if(uuidCheck !== "") {
	if( !getCookieGa('ga_uuid') ){
		setCookieGa('ga_uuid', uuidCheck);
	}else{
		if( getCookieGa('ga_uuid') !== uuidCheck){
			deleteCookieGa('ga_uuid');
			setCookieGa('ga_uuid', uuidCheck); /* 로그인 사용자쿠키 추가 */
		}
	}
	ga('set', 'userId', uuidCheck);
	ga('send', 'pageview',{'dimension1':  uuidCheck});
}else{
	ga('send', 'pageview');
}

//edge browser correspondence
var enableSelection = true;
$(function(){
    $('input, textarea').on('focus', function(){
        enableSelection = false;
    }).on('blur', function(){
        enableSelection = true;
    });
});
</script>



<style>
body .criteo_header{display:none}
</style>
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script>
	var criteoEmail = "";
	if(uuidCheck != ""){
        // criteoEmail = uuidCheck+"@kurlycorp.com";
	}
</script>
<script>
// 메인
window.criteo_q = window.criteo_q || [];
window.criteo_q.push(
    { event: "setAccount", account: 56308, requiresDOM: "yes"},
    { event: "setHashedEmail", email: criteoEmail, requiresDOM: "yes"},
    { event: "setSiteType", type: "d", requiresDOM: "yes" },
    { event: "viewHome", requiresDOM: "yes" }
);
</script>




<script>
(function(b,r,a,n,c,h,_,s,d,k){if(!b[n]||!b[n]._q){for(;s<_.length;)c(h,_[s++]);d=r.createElement(a);d.async=1;d.src="https://cdn.branch.io/branch-latest.min.js";k=r.getElementsByTagName(a)[0];k.parentNode.insertBefore(d,k);b[n]=h}})(window,document,"script","branch",function(b,r){b[r]=function(){b._q.push([r,arguments])}},{_q:[],_v:1},"addListener applyCode autoAppIndex banner closeBanner closeJourney creditHistory credits data deepview deepviewCta first getCode init link logout redeem referrals removeListener sendSMS setBranchViewData setIdentity track validateCode trackCommerceEvent logEvent disableTracking".split(" "), 0);
branch.init('key_live_meOgzIdffiVWvdquf7Orkacksxa2LneN');
// branch.init('key_test_joIkrHgomhL3qaEreXL5QdigzEn6Ucd4');
branch.setIdentity(uuidCheck);
// reopen
branch.track("pageview");
</script>

</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !enableSelection">


<div id="wrap" class="">
<div id="pos_scroll"></div>
<div id="container">
<div id="header">
<style type="text/css">
    .notice_ie8{display:none;width:100%;height:70px;padding-top:23px;background-color:#d5586f;font-weight:400;font-size:16px;font-family:'Noto Sans';color:#fff;letter-spacing:-0.4px;text-align:center}
    .notice_ie8 .inner_noticeie8{display:block;width:1050px;margin:0 auto}
    .notice_ie8 .emph{padding:0 16px 0 11px;background:url(https://res.kurly.com/pc/ico/1801/ico_arrow_noticeie8.png) no-repeat 100% 55%;font-family:'Noto Sans';font-weight:700}
</style>
<a target="_blank" href="https://support.microsoft.com/ko-kr/help/17621/internet-explorer-downloads" id="noticeIe8" class="notice_ie8">
<span class="inner_noticeie8">
고객님의 브라우저에서는 마켓컬리가 정상 동작하지 않습니다. 최신버전의 인터넷 익스플로러를 이용해주세요.
<span class="emph">설치하기</span>
</span>
</a>
<script type="text/javascript">
if( (document.all && !document.querySelector) || (document.all && document.querySelector && !document.addEventListener) ){
    $('#noticeIe8').css({'display':'block'});
}
</script>

<div class="bnr_header" id="top-message">


<a href="http://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_191023" id="eventLanding">
지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png" class="bnr_arr">
<div class="bnr_top">
<div class="inner_top_close">
<button id="top-message-close" class="btn_top_bnr">가입하고 혜택받기</button>
</div>
</div>
</a>
<script>
            // PROM-476 장차석 : GA) 이벤트 트래킹
            $('#eventLanding').on('click', function(){
                ga('send', 'event', 'click', 'general_header_sighup', location.href);
            });
        </script>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#top-message-close").on("click",function(){
            setCookie('top_msg_banner2','set_cookie',1)
        });
        if(getCookie('top_msg_banner2') == 'set_cookie'){
            $("#top-message").hide()
        }else{
            $("#top-message").show() ;
        }
    });

    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue +"; path=/;"
    }

    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
</script>

<div id="userMenu">
<user-menu-pc :login-check="loginCheck" :notification-item="notificationItem" :user-info="userInfo" :return-url="returnUrl"></user-menu-pc>
</div>
<script src="https://www.kurly.com/common_js/usermenu_v1.js?ver=20191028174155"></script>
<script>
$(document).ready(function(){
    
    userMenu.loginCheck = false;
});
</script>

<style>
#headerLogo{position:relative;width:1050px;height:63px;margin:0 auto}
#headerLogo .bnr_delivery{position:absolute;left:17px;top:-28px;margin:auto;height:22px}
#headerLogo .bnr_delivery img{width:163px;height:22px}
#headerLogo .logo{position:absolute;left:476px;top:-22px;width:99px}
#headerLogo .logo img{width:103px;height:79px}
#gnb.gnb_stop{position:fixed;z-index:300;left:0;top:0;width:100%}
#gnb .gnb_kurly{position:relative;z-index:300;min-width:1050px;background-color:#fff;font-family:'Noto Sans';letter-spacing:-0.3px}
#gnb .gnb_kurly:after{content:"";position:absolute;z-index:299;left:0;top:56px;width:100%;height:9px;background:url(https://res.kurly.com/pc/service/common/1902/bg_1x9.png) repeat-x 0 100%}
#gnb .inner_gnbkurly{position:relative;width:1050px;height:56px;margin:0 auto}
/* 검색창 */
#gnb .gnb_search{position:absolute;right:45px;top:10px;width:238px}
#gnb .gnb_search .inp_search{width:238px;height:36px;padding:0 50px 0 20px;border:1px solid #f7f7f6;border-radius:18px;background-color:#f7f7f7;font-family: 'Noto Sans';font-weight:400;font-size:12px;color:#666;line-height:16px;outline:none}
#gnb .gnb_search .inp_search.focus{background-color:#fff;color:#333}
#gnb .gnb_search .btn_search{position:absolute;right:10px;top:3px;width:30px;height:30px}
/* 장바구니 */
#gnb .cart_count{position:absolute;right:-6px;top:10px}
#gnb .cart_count .inner_cartcount{text-align:center;font-weight:400}
#gnb .cart_count .num{display:none;position:absolute;left:19px;top:-1px;min-width:20px;height:20px;padding:0 5px;border:2px solid #fff;border-radius:10px;background-color:#5f0080;font-size:9px;color:#fff;line-height:15px;text-align:center;white-space:nowrap}
#gnb .cart_count img{display:block;width:36px;height:36px;margin:0 auto}
#gnb .cart_count .msg_cart{display:none;position:absolute;right:-7px;top:61px;width:348px;height:102px;border:1px solid #ddd;background-color:#fff;opacity:0}
#gnb .cart_count .inner_msgcart{display:block;overflow:hidden;padding:20px 0 0 20px}
#gnb .cart_count .msg_cart .thumb{float:left;width:46px;height:60px}
#gnb .cart_count .msg_cart .desc{float:left;width:240px;padding:8px 0 0 20px;font-weight:700;font-size:14px;line-height:21px}
#gnb .cart_count .msg_cart .tit{display:block;overflow:hidden;width:100%;color:#999;white-space:nowrap;text-overflow:ellipsis}
#gnb .cart_count .msg_cart .name{overflow:hidden;float:left;max-width:178px;text-overflow:ellipsis}
#gnb .cart_count .msg_cart .txt{display:block;padding-top:3px;color:#333}
#gnb .cart_count .msg_cart .point{position:absolute;right:13px;top:-14px;width:20px;height:14px;background:url(https://res.kurly.com/pc/ico/1903/ico_layer_point.png) no-repeat 0 0}
/* GNB메인 */
#gnb .gnb_main{overflow:hidden;width:1050px;margin:0 auto}
#gnb .gnb_main .gnb{float:left;width:100%}
#gnb .gnb_main .gnb li{float:left;background:url(https://res.kurly.com/pc/service/common/1902/line_1x11_c_ccc.png) no-repeat 100% 23px}
#gnb .gnb_main .gnb .lst{background:none}
#gnb .gnb_main .gnb a{overflow:hidden;float:left;height:55px;padding:16px 50px 0 48px;font-size:16px;color:#333;line-height:20px}
#gnb .gnb_main .gnb a .txt{font-weight:700}
#gnb .gnb_main .gnb a:hover,
#gnb .gnb_main .gnb a.on{font-weight:700;color:#5f0080}
#gnb .gnb_main .gnb a:hover .txt{border-bottom:1px solid #5f0080}
#gnb .gnb_main .menu1 a{padding-left:19px}
#gnb .gnb_main .menu1 .ico{float:left;width:16px;height:14px;margin:4px 14px 0 0;background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off.png) no-repeat}
#gnb .gnb_main .menu1 a.on .ico,
#gnb .gnb_main .menu1 a:hover .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all.png) no-repeat 0 0}
#gnb .gnb_main .menu1 a.on .txt,
#gnb .gnb_main .menu1 a:hover .txt,
#gnb .gnb_main .menu1 .txt{float:left;font-weight:700;border-bottom:0}
/* GNB서브 */
#gnb .gnb_sub{display:none;overflow:hidden;position:absolute;z-index:301;left:0;top:55px;width:213px;padding-top:1px}
#gnb .gnb_sub .inner_sub{width:100%;border:1px solid #ddd;background:url(https://res.kurly.com/pc/service/common/1908/bg_gnb_sub_v3.png) repeat-y 0 0}
#gnb .size_over{overflow-x:hidden;overflow-y:auto}
#gnb .gnb_sub .gnb_menu{width:219px}
#gnb .gnb_sub .gnb_menu li{width:100%;text-align:left}
#gnb .gnb_sub .gnb_menu li:first-child{padding-top:0}
#gnb .gnb_sub .menu{display:block;overflow:hidden;width:100%;height:40px;padding:8px 0 0 14px;cursor:pointer}
#gnb .gnb_sub .gnb_menu li:first-child .menu{height:39px;padding-top:7px}
#gnb .gnb_sub .current .menu{background:#f7f7f7}
#gnb .gnb_sub .current .txt,
#gnb .gnb_sub .menu.on.off:hover .txt,
#gnb .gnb_sub .menu.on .txt{font-weight:700;color:#5f0080}
#gnb .gnb_sub .ico{float:left;width:24px;height:24px}
#gnb .gnb_sub .ico img{width:24px;height:24px}
#gnb .gnb_sub .ico .ico_off{display:block}
#gnb .gnb_sub .ico .ico_on{display:none}
#gnb .gnb_sub .current .ico_off,
#gnb .gnb_sub .menu.on .ico_off,
#gnb .gnb_sub .menu:hover .ico_off{display:none}
#gnb .gnb_sub .current .ico_on,
#gnb .gnb_sub .menu.on .ico_on,
#gnb .gnb_sub .menu:hover .ico_on{display:block}
#gnb .gnb_sub .ico_arrow{display:none;float:right;width:16px;height:17px;padding:6px 9px 0 0}
#gnb .gnb_sub .ico_arrow img{width:7px;height:11px}
#gnb .gnb_sub .current .ico_arrow{display:block}
#gnb .gnb_sub .txt{float:left;padding:0 4px 0 10px;font-weight:400;font-size:14px;color:#333;line-height:22px;white-space:nowrap}
#gnb .gnb_sub .ico_new{overflow:hidden;float:left;width:14px;height:14px;margin-top:5px;background-position:50% 50%;background-repeat:no-repeat;background-size:14px 14px;font-size:0;line-height:0;text-indent:-9999px}
#gnb .gnb_sub .sub_menu{position:absolute;z-index:0;left:200px;top:0;width:248px;height:100%;padding:0 0 0 20px;background:url(https://res.kurly.com/images/common/bg_1_1.gif) repeat 0 0;opacity:0;transition:opacity 0.2s}
#gnb .gnb_sub .current .sub_menu{z-index:1;opacity:1;transition:opacity 0.5s}
#gnb .gnb_sub .sub_menu li:first-child{padding-top:11px}
#gnb .gnb_sub .sub_menu .sub{display:block;overflow:hidden;height:40px;padding-left:20px;font-size:14px;color:#333;line-height:18px;cursor:pointer}
#gnb .gnb_sub .sub_menu .sub:hover .name{border-bottom:1px solid #5f0080;font-weight:700;color:#5f0080}
#gnb .gnb_sub .sub_menu .sub.on{font-weight:700;color:#5f0080}
#gnb .gnb_sub .recommend{overflow:hidden;width:529px;padding:21px 0 0 40px}
#gnb .gnb_sub .recommend li{float:left;width:120px;height:130px;padding:0 10px 0 0}
#gnb .gnb_sub .recommend li:first-child{padding-top:0}
#gnb .gnb_sub .recommend .sub{display:block;overflow:hidden;width:120px;height:130px;padding:0;cursor:pointer}
#gnb .gnb_sub .recommend .thumb{display:block;width:110px;height:83.4px;margin-bottom:8px;background-position:50% 50%;background-repeat:no-repeat;background-size:cover}
#gnb .gnb_sub .recommend .thumb img{width:110px;height:84px}
#gnb .gnb_sub .recommend .name{font-size:14px;line-height:18px}
@media
only screen and (-webkit-min-device-pixel-ratio: 1.5),
only screen and (min-device-pixel-ratio: 1.5),
only screen and (min-resolution: 1.5dppx) {
    #gnb .gnb_sub .ico_new{background:url(https://res.kurly.com/pc/ico/1808/ico_new_gnb_16x16.png) no-repeat 0 0;background-size:8px 8px}
    #gnb .cart_count .msg_cart .point{background:url(https://res.kurly.com/pc/ico/1903/ico_layer_point_x2.png) no-repeat 0 0;background-size:20px 14px}
    #gnb .gnb_main .menu1 .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off_x2.png) no-repeat 0 0;background-size:16px 14px}
    #gnb .gnb_main .menu1 a.on .ico,
    #gnb .gnb_main .menu1 a:hover .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_x2.png) no-repeat 0 0;background-size:16px 14px}
}
</style>
<div id="headerLogo" class="layout-wrapper">
<h1 class="logo"><a href="/"><img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고"></a></h1>
<a href="/shop/board/view.php?id=notice&no=64" onclick="ga('send','event','etc','main_gif_btn_click');" class="bnr_delivery">
<img src="https://res.kurly.com/pc/service/common/1908/delivery_190819.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송">
</a>
</div>
<div id="gnb">
<h2 class="screen_out">메뉴</h2>
<div id="gnbMenu" class="gnb_kurly">
<div class="inner_gnbkurly">
<div class="gnb_main">
<ul class="gnb">
<li class="menu1"><a href="#none"><span class="ico"></span><span class="txt">전체 카테고리</span></a></li>
<li><a class="" href="/shop/goods/goods_list.php?category=038"><span class="txt">신상품</span></a></li>
<li><a class="" href="/shop/goods/goods_list.php?category=029"><span class="txt">베스트</span></a></li>
<li><a class="" href="/shop/goods/goods_list.php?list=sale"><span class="txt">알뜰쇼핑</span></a></li>
<li class="lst"><a class="" href="/shop/goods/event.php?&"><span class="txt">이벤트</span></a></li>
</ul>
<div id="side_search" class="gnb_search">
<form action="/shop/goods/goods_search.php?&" onsubmit="return chkForm(this)">
<input type=hidden name=searched value="Y">
<input type=hidden name=log value="1">
<input type=hidden name=skey value="all">
<input type="hidden" name="hid_pr_text" value="가을 수산 기획전 Week 1" />
<input type="hidden" name="hid_link_url" value="https://www.kurly.com/shop/goods/goods_list.php?category=357" />
<input type="hidden" id="edit" name="edit" value="" />
<input name=sword type=text id="sword" class="inp_search" value="가을 수산 기획전 Week 1" required label="검색어">
<input type=image src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
</form>
</div>
<div class="cart_count">
<div class="inner_cartcount">
<a href="/shop/goods/goods_cart.php" class="btn_cart">
<img src="https://res.kurly.com/pc/ico/1908/ico_cart_x2_v2.png" alt="장바구니">
<span class="num realtime_cartcount" id="cart_item_count"></span> </a>
</div>
<div id="addMsgCart" class="msg_cart">
<span class="point"></span>
<div class="inner_msgcart">
<img src="https://res.kurly.com/images/common/bg_1_1.gif" alt="" class="thumb">
<p class="desc">
<span class="tit"></span>
<span class="txt">장바구니에 담겼습니다.</span>
</p>
</div>
</div>
</div>
</div>
<div class="gnb_sub">
<div class="inner_sub">
<ul class="gnb_menu" data-default="219" data-min="219" data-max="731">
<gnb-menu-pc v-for="(item, idx) in dataGnb" :main-menu="item" :sub-menu="item.categories" :sub-open="item.subOpen" :get-category-num="getCategoryNum" :key="'gnb'+idx" :idx="idx"></gnb-menu-pc>
</ul>
</div>
</div>
</div>
</div>
</div>
<script src="https://www.kurly.com/common_js/gnb_v1.js?ver=20191028174155"></script>
<script type="text/javascript">
//
gnbMenu.update();

// 검색창 클래스 추가/삭제
$(document).ready(function(){
    $('#gnb .inp_search').focus(function(){
        $(this).addClass('focus');
    });
    $('#gnb .inp_search').blur(function(){
        $(this).removeClass('focus');
    });
    // 검색창기능 수정
    $('[name=sword]').on('keyup', function(){
        if($('#edit').length > 0) $('#edit').val('Y');
        var str = $(this).val();
        var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
        if(regExp.test(str)){
            var result = str.replace(regExp, "");
            $(this).val(result);
        }
    });
});
</script>
</div>
<div id="main">
<div id="content">

<div id="qnb" class="quick-navigation">
<style>
    #qnb{position:absolute;z-index:1;right:20px;top:70px;width:80px;font:normal 12px/16px "Noto Sans";color:#333;letter-spacing:-0.3px;transition:top 0.2s}
    .goods-goods_view #qnb{top:20px}
    /* 배너 */
    #qnb .bnr_qnb{padding-bottom:7px}
    #qnb .bnr_qnb .thumb{width:80px;height:120px;vertical-align:top}
    /* 메뉴 */    
    #qnb .side_menu{width:80px;border:1px solid #ddd;border-top:0 none;background-color:#fff}
    #qnb .link_menu{display:block;height:29px;padding-top:5px;border-top:1px solid #ddd;text-align:center}
    #qnb .link_menu:hover,
    #qnb .link_menu.on{color:#5f0080}
    /* 최근본상품 */
    #qnb .side_recent{position:relative;margin-top:6px;border:1px solid #ddd;background-color:#fff}
    #qnb .side_recent .tit{display:block;padding:22px 0 6px;text-align:center}
    #qnb .side_recent .list_goods{overflow:hidden;position:relative;width:60px;margin:0 auto}
    #qnb .side_recent .list{position:absolute;left:0;top:0}
    #qnb .side_recent .link_goods{display:block;overflow:hidden;width:60px;padding:1px 0 2px}
    #qnb .side_recent .name{overflow:hidden;width:100%;max-height:36px;padding-top:1px;font-size:12px;line-height:16px;letter-spacing:-0.3px;text-align:center;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;word-wrap:break-word}
    
    #qnb .side_recent .btn{display:block;overflow:hidden;width:100%;height:17px;border:0 none;font-size:0;line-height:0;text-indent:-9999px}
    #qnb .side_recent .btn_up{position:absolute;left:0;top:0;background:url(https://res.kurly.com/pc/service/main/1903/ico_quick_up.png) no-repeat 50% 50%;}
    #qnb .side_recent .btn_down{background:url(https://res.kurly.com/pc/service/main/1903/ico_quick_down.png) no-repeat 50% 0px;}
    /* pageTop */
    /*#qnb .btn_top{display:block;overflow:hidden;padding:5px 0 3px;border-top:1px solid #ddd;font-size:12px;color:#777;line-height:16px;text-align:center}*/
    /*#qnb .btn_top img{display:block;width:16px;margin:0 auto}*/
    @media
    only screen and (-webkit-min-device-pixel-ratio: 1.5),
    only screen and (min-device-pixel-ratio: 1.5),
    only screen and (min-resolution: 1.5dppx) {
        #qnb .side_recent .btn_up{background-image:url(https://res.kurly.com/pc/service/main/1903/ico_quick_up_x2.png);background-size:12px 18px}
        #qnb .side_recent .btn_down{background-image:url(https://res.kurly.com/pc/service/main/1903/ico_quick_down_x2.png);background-size:12px 18px}
    }
    @media all and (max-width: 1250px){
        #qnb{display:none}
    }
</style>

<div class="bnr_qnb">
<a href="/shop/board/view.php?id=notice&no=64">
<img class="thumb" src="https://res.kurly.com/pc/service/main/1904/bnr_quick_20190403.png" alt="퀄리티있게 샛별배송">
</a>
</div>

<div class="side_menu">
<a href="/shop/event/kurlyEvent.php?htmid=event/lovers/lovers_191001" class="link_menu ">등급별 혜택</a>
<a href="/shop/board/list.php?id=recipe" class="link_menu ">레시피</a>
<a href="/shop/goods/goods_review_best.php" class="link_menu ">베스트 후기</a>
</div>
</div>
<style>
    /* override */
    #content{padding-bottom:0}
    #qnb{top:516px}

    /* ############## */
    /* 메인 공지 팝업 */
    /* ############## */
    #mainNotice{position:relative;z-index:5000;width:1050px;margin:0 auto}
    #mainNotice .main_popup{overflow:hidden;position:absolute;left:0;top:40px;width:440px;border:1px solid #ccc;border-radius:6px;background-color:#f4f4f4}
    #mainNotice .main_popup1{left:0}
    #mainNotice .main_popup2{left:0}
    #mainNotice .main_popup3{left:0}
    #mainNotice .main_popup4{left:0}
    #mainNotice .inner_mainpopup{position:relative;height:100%}
    #mainNotice .pop_view img{width:100%;vertical-align:top}
    /* 하단버튼 */
    #mainNotice .pop_footer{overflow:hidden;width:100%;height:104px;padding:20px 30px 0;background-color:#fff}
    #mainNotice .pop_footer .btn{overflow:hidden;float:left;width:100%;height:54px;border:1px solid #5f0081;border-radius:3px;background-color:#5f0080;font-weight:700;font-size:16px;color:#fff;line-height:20px;text-align:center}
    #mainNotice .pop_select .btn{float:left;width:186px;border:1px solid #5f0080;background-color:#fff;color:#5f0080;}
    #mainNotice .pop_select .btn:last-child{float:right;border:1px solid #5f0081;background-color:#5f0080;color:#fff}
    /* 비밀번호변경 팝업 */
    #change_pw{position:absolute;left:0;top:0;width:404px}
    #change_pw .inner_popdiv{width:404px;padding:0 20px;background-color:#fff;border:2px solid #514859;text-align:left}
    #change_pw .line{height: 2px;border:none; outline: none;  background-color:#5f0080}
    #change_pw .line_grey{height: 2px;border:none; outline: none;background-color:#dddfe1}
    #change_pw .tit{display:block;padding:32px 0 15px;font-size:16px;font-weight:700;color:#5f0080}
    #change_pw .wrap_pw{padding:22px 0;font-size:16px;color:#000}
    #change_pw .desc{padding-bottom:10px;letter-spacing:-.5px}
    #change_pw .btn_group{height:50px}
    #change_pw .inner_popdiv .btn{overflow:hidden;position:absolute;bottom:2px;height:26px;font-size:14px;line-height:26px}
    #change_pw .inner_popdiv .btn_close { left:2px; width:200px; background-color:#fff; color:#5f0080; border-top:1px solid #5f0080; height:50px; text-align:center; line-height:50px; font-size:16px; letter-spacing:0.5px}
    #change_pw .inner_popdiv .link_move{right:2px;width:200px;background-color:#5f0080;color:#fff;border:1px solid #512771; height:50px; text-align:center; line-height:50px; font-size:16px; letter-spacing:0.5px}
    #change_pw .inp_tit{display:block;padding:13px 0 5px 0;font-size:14px;letter-spacing:-.5px; color:#5f0080;font-weight:bold}
    #change_pw .wrap_inp{position:relative}
    #change_pw .txt_placeholder {position:absolute; z-index:9; display:block; font-size:16px; top:12px; left:10px;font-family:"Noto Sans";font-weight:200;line-height:18px; color:#949296}
    #change_pw .pw_inp{width:100%;padding:10px}
    #change_pw .item_info dt{padding-bottom:5px}
    #change_pw .pw_notice{padding-top:19px}
    #change_pw .new_pw{margin-bottom:20px}
    #change_pw .mark_valid{ display:none;font-size:12px;color:#514859;line-height:20px}
    #change_pw .wrap_inp .mark_valid .good{ color:#0e851a }
    #change_pw .wrap_inp .mark_valid .bad{ color:#b3130b }
    #change_pw .wrap_inp .mark_coincide.good{ color:#0e851a }
    #change_pw .wrap_inp .mark_coincide.bad{ color:#b3130b }
    #change_pw .pw_inp.inp_invalid{border: 1px solid #b3130b}
    #change_pw input[type=password]{height:44px; outline: none; border: 1px solid #514859}

    /* #### */
    /* 공통 */
    /* #### */
    .page_main{overflow:hidden;width:100%;margin:0;opacity:0}
    .page_main *{color:#333}
    .page_main .bg{background-color:#f7f7f7}
    .page_main .tit_goods{padding:79px 0 35px}
    .page_main .tit_goods.top_short{padding-top:21px}
    .page_main .tit_goods .tit{font-weight:700;font-size:28px;line-height:32px;letter-spacing:-0.3px;text-align:center}
    .page_main .tit_goods .name{position:relative;font-weight:700}
    .page_main .tit_goods .name .ico{padding:0 31px;background:url(https://res.kurly.com/pc/service/main/1908/ico_title_link_x1.png) no-repeat 100% 50%;font-weight:700}
    .page_main .tit_goods .tit_desc{display:block;padding-top:10px;font-weight:400;font-size:16px;color:#999;line-height:20px;text-align:center}
    .page_main .list_goods .thumb_goods{display:block;overflow:hidden}
    .page_main .list_goods .thumb_goods .ico{z-index:1;transition:all 0.3s ease-in-out}
    .page_main .list_goods .thumb_goods .thumb{display:block;margin:0 auto;background-position:50% 50%;background-size:cover;transform:scale(1);transition:all 0.3s ease-in-out}
    .page_main .list_goods .thumb_goods:hover .thumb{transform:scale(1.02);transition:all 0.3s ease-in-out}

    /* 슬라이드_버튼 */
    .page_main .bx-controls-direction{position:relative;width:1050px;margin:0 auto}
    .page_main .bx-controls-direction .bx-next,
    .page_main .bx-controls-direction .bx-prev{overflow:hidden;position:absolute;bottom:316px;width:60px;height:60px;border:0 none;font-size:0;line-height:0;text-indent:-9999px;transition:opacity 0.5s}
    .page_main .bx-controls-direction .bx-prev{left:-30px;background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_default.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bx-controls-direction .bx-prev:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_default_hover_x1.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bx-controls-direction .bx-next{right:-30px;background:url(https://res.kurly.com/pc/service/main/1908/btn_next_default.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bx-controls-direction .bx-next:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_next_default_hover_x1.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bg .bx-controls-direction .bx-prev{left:-30px;background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_gray_x1.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bg .bx-controls-direction .bx-prev:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_gray_hover_x1.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bg .bx-controls-direction .bx-next{right:-30px;background:url(https://res.kurly.com/pc/service/main/1908/btn_next_gray_x1.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bg .bx-controls-direction .bx-next:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_next_gray_hover_x1.png?v=1) no-repeat 50% 50%;transition:background 0.5s}
    .page_main .bx-controls-direction .disabled{opacity:0}

    /* ####### */
    /* 1종노출 */
    /* ####### */
    /* 1종노출+슬라이드+fullsize */
    .main_type1 .list_goods .thumb_goods{width:100%;height:370px;background-repeat:no-repeat;background-position:50% 50%;background-size:auto auto;font-size:0;line-height:0;text-indent:-9999px}
    .main_type1 .bx-controls-auto{overflow:hidden;font-size:0;line-height:0;text-indent:-9999px}
    .main_type1 .bx-controls-direction .bx-next,
    .main_type1 .bx-controls-direction .bx-prev{bottom:159px;width:52px;height:52px;opacity:0}
    .main_type1 .bx-controls-direction .bx-prev:hover,
    .main_type1 .bx-controls-direction .bx-prev{left:-91px;background:url(https://res.kurly.com/pc/service/main/1908/ico_prev1_x1.png) no-repeat 50% 50%;transition:opacity 0.5s}
    .main_type1 .bx-controls-direction .bx-next:hover,
    .main_type1 .bx-controls-direction .bx-next{right:-91px;background:url(https://res.kurly.com/pc/service/main/1908/ico_next1_x1.png) no-repeat 50% 50%;transition:opacity 0.5s}
    .main_type1 .list_goods:hover .bx-next,
    .main_type1 .list_goods:hover .bx-prev{opacity:1}
    @media all and (max-width: 1250px){
        .main_type1 .bx-controls-direction .bx-prev:hover,
        .main_type1 .bx-controls-direction .bx-prev{left:-26px}
        .main_type1 .bx-controls-direction .bx-next:hover,
        .main_type1 .bx-controls-direction .bx-next{right:-26px}
    }

    /* ####### */
    /* 4종노출 */
    /* ####### */
    /* 4종노출+슬라이드 */
    .main_type2 .list_goods{width:1050px;height:506px;margin:0 auto}
    .main_type2 .list_goods .list{width:99999px}
    .main_type2 .list_goods li{float:left;width:249px;height:506px;margin-right:18px}
    .main_type2 .list_goods .thumb_goods{position:relative;background-color:#eee}
    .main_type2 .list_goods .ico{position:absolute;left:0;top:0;width:62px;height:54px}
    .main_type2 .list_goods .thumb{width:249px;height:320px}
    .main_type2 .list_goods .name{display:block;overflow:hidden;max-height:50px;margin-top:11px;
        text-overflow:ellipsis;display: -webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;word-wrap:break-word
    }
    .main_type2 .list_goods .txt{font-size:16px;line-height:23px}
    .main_type2 .list_goods .price{display:block;padding-top:6px;font-weight:700;font-size:16px;line-height:20px}
    .main_type2 .list_goods .cost{display:block;padding-top:4px;font-size:14px;color:#ccc;line-height:18px;text-decoration:line-through}
    /* 엠디의 추천 */
    .category_type{padding-bottom:100px}
    .category_type .list_goods{height:462px}
    .category_type .list_goods li{height:462px}
    .category_type .bx-controls-direction .bx-next,
    .category_type .bx-controls-direction .bx-prev{bottom:272px}
    .category_type .category .list_category{width:1050px;max-width:1050px;padding:0 0 20px;margin:0 auto;text-align:center;font-size:0}
    .category_type .category .list_category li{display:inline-block;padding:0 5px 20px}
    .category_type .category .list_category .cut:before{content:"";display:block;overflow:hidden;width:100%;height:0}
    .category_type .category .list_category .menu{display:inline-block;height:34px;padding:6px 16px 0 14px;border:1px solid #f7f7f6;border-radius:20px;background-color:#f7f7f7;font-size:14px;line-height:18px}
    .category_type .category .list_category .menu:hover{border:1px solid #f7f3f7;background-color:#f7f3f8;color:#5f0080}
    .category_type .category .list_category .on:hover,
    .category_type .category .list_category .on{border:1px solid #5f0081;background-color:#5f0080;font-weight:700;color:#fff}
    .category_type .link_cate{width:516px;margin:0 auto}
    .category_type .link_cate .link{display:block;overflow:hidden;height:56px;padding-top:16px;border:1px solid #e3e3e3;border-radius:3px;font-size:16px;line-height:20px;text-align:center;letter-spacing:-0.3px}
    .category_type .link_cate .ico{padding:0 18px;background:url(https://res.kurly.com/pc/service/main/1903/ico_more_link_x1.png) no-repeat 100% 3px}

    /* ####### */
    /* 3종노출 */
    /* ####### */
    .main_type3 .list_goods{width:1050px;margin:0 auto}
    .main_type3 .list_goods .list{width:99999px}
    .main_type3 .list_goods li{float:left;width:338px;margin-right:18px}
    .main_type3 .list_goods .thumb_goods{display:block;position:relative}
    .main_type3 .list_goods .ico{position:absolute;left:0;top:0;width:62px;height:54px}
    .main_type3 .list_goods .thumb{width:338px}
    .main_type3 .list_goods .name{display:block;overflow:hidden}
    .main_type3 .list_goods .desc{display:block;overflow:hidden;text-align:center;white-space:nowrap;text-overflow:ellipsis}
    .main_type3 .list_goods .desc .txt{font-size:16px;line-height:20px}
    /* 3종노출_이벤트 */
    .main_event .list_goods{overflow:hidden;height:538px}
    .main_event .list_goods .list{width:1068px}
    .main_event .list_goods li{height:538px}
    .main_event .list_goods .thumb{height:338px}
    .main_event .list_goods .name{max-height:54px;margin-top:17px;text-align:center;
        text-overflow:ellipsis;display: -webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;word-wrap:break-word
    }
    .main_event .list_goods .name .txt{font-weight:700;font-size:18px;line-height:28px;letter-spacing:-0.3px}
    .main_event .list_goods .desc{padding-top:8px}
    .main_event .list_goods .desc .txt{color:#999}
    /* 3종노출_레시피 */
    .main_recipe .list_goods{height:303px}
    .main_recipe .list_goods li{height:303px}
    .main_recipe .list_goods .thumb{height:225px}
    .main_recipe .list_goods .name{padding-top:12px;text-align:center;white-space:nowrap;text-overflow:ellipsis}
    .main_recipe .list_goods .txt{font-size:16px;line-height:20px}
    .main_recipe .bx-controls-direction .bx-next,
    .main_recipe .bx-controls-direction .bx-prev{bottom:160px}

    /* ####### */
    /* 6종노출 */
    /* ####### */
    /* 6종노출+슬라이드 : 인스타그램전용 */
    .main_type4 .list_goods{width:1050px;height:175px;margin:0 auto}
    .main_type4 .list_goods .list{width:99999px}
    .main_type4 .list_goods li{float:left;width:175px;height:175px}
    .main_type4 .list_goods .thumb{width:175px;height:175px}
    .main_type4 .list_goods .thumb_goods:hover .thumb{transform:scale(1)}
    .main_type4 .bnr{padding:39px 0 100px;font-weight:700;font-size:16px;line-height:29px;text-align:center}
    .main_type4 .bnr .txt{display:block;font-weight:400;color:#999}
    .main_type4 .bnr a{font-weight:700}
    .main_type4 .bx-controls-direction .bx-next,
    .main_type4 .bx-controls-direction .bx-prev{bottom:58px}
    .main_type4 .bx-controls-auto{overflow:hidden;font-size:0;line-height:0;text-indent:-9999px}

    /* ######## */
    /* 스페셜딜 */
    /* ######## */
    .main_special{padding-bottom:88px}
    .main_special .inner_special{overflow:hidden;width:1050px;margin:0 auto;padding-top:80px;border-top:1px solid #ddd}
    .main_special .inner_special.no_line{border-top:0 none}
    .main_special .tit_goods{float:left;width:338px;padding:11px 0 7px 12px}
    .main_special .tit_goods .tit{height:173px;text-align:left}
    .main_special .tit_goods .name{font-weight:700;font-size:32px;line-height:48px}
    .main_special .tit_goods .tit_desc:before{content:"";display:block;width:12px;height:1px;margin:7px 0 16px 2px;background-color:#999;word-break:break-all}
    .main_special .tit_goods .tit_desc{font-size:16px;line-height:24px;letter-spacing:0;text-align:left;}
    .main_special .sub_hook{padding:0 0 10px 22px;background:url(https://res.kurly.com/pc/service/main/1907/ico_hook.png) no-repeat 0 2px;font-size:14px;color:#ccc;line-height:20px;letter-spacing:-0.4px}
    .main_special .list_goods{float:right;width:694px}
    .main_special .list_goods .list{overflow:hidden;width:712px}
    .main_special .list_goods li{width:694px}
    .main_special .list_goods .thumb_goods{position:relative;background-color:#eee}
    .main_special .list_goods .thumb{display:block;width:694px;height:338px;}
    .main_special .list_goods .ico{position:absolute;left:0;top:0;width:62px;}
    .main_special .list_goods .bg{position:absolute;left:0;bottom:0;width:100%;height:40px;opacity:0.6}
    .main_special .list_goods .count{position:absolute;left:0;bottom:8px;width:100%;text-align:center}
    .main_special .list_goods .count .num{font-weight:bold;font-size:20px;color:#fff;line-height:24px}
    .main_special .list_goods .count .txt{font-size:14px;color:#fff;line-height:24px;vertical-align:2px}
    .main_special .list_goods .info_goods{position:relative}
    .main_special .list_goods .name{display:block;overflow:hidden;width:100%;padding:13px 0 0 4px;white-space:nowrap;text-overflow:ellipsis}
    .main_special .list_goods .name .txt{font-size:16px;line-height:24px}
    .main_special .list_goods .sub_name{display:block;overflow:hidden;width:100%;padding:5px 0 7px 4px;font-size:16px;color:#999;line-height:20px;white-space:nowrap;text-overflow:ellipsis}
    .main_special .list_goods .dc{position:absolute;right:10px;bottom:4px;font-weight:800;font-size:26px;line-height:30px}
    .main_special .list_goods .price{padding-left:4px;font-weight:bold;font-size:20px;line-height:30px}
    .main_special .list_goods .cost{padding-left:4px;font-size:14px;color:#ccc;line-height:30px;text-decoration:line-through}
    /* sold_out */
    .main_special .list_goods .sold_out .bg{height:100%;background-color:#000;opacity:0.5}
    .main_special .list_goods .sold_out .info{position:absolute;left:0;top:50%;width:100%;margin-top:-2px;transform:translate(0, -50%);text-align:center}
    .main_special .list_goods .sold_out .tit{display:block;font-weight:bold;font-size:28px;color:#fff;line-height:40px}
    .main_special .list_goods .sold_out .desc{display:block;padding:11px 10px 0;font-size:16px;color:#fff;line-height:24px;word-break:break-all}
    /* 2개일때 */
    .main_special .list_goods2 li{float:left;width:338px;margin-right:18px;padding-bottom:3px}
    .main_special .list_goods2 .thumb{width:338px;height:434px}
    .main_special .list_goods2 .name{height:66px;padding-top:14px;white-space:normal;
        display: -webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;word-wrap:break-word
    }
    .main_special .list_goods2 .sub_name{display:none;padding:0}
    
    /* #### */
    /* 배너 */
    /* #### */
    .bnr_main{width:1050px;margin:0 auto}
    .bnr_main .link{display:block;min-height:140px;background-color:#eee;background-position:50% 50%;background-size:cover}
    .bnr_main .tit{display:block;overflow:hidden;width:100%;padding:35px 50px 0;font-weight:700;font-size:28px;line-height:38px;white-space:nowrap;text-overflow:ellipsis}
    .bnr_main .txt{display:block;overflow:hidden;width:100%;padding:5px 50px 0;font-size:16px;line-height:24px;white-space:nowrap;text-overflow:ellipsis}
    .bnr_type2 .link{height:160px;padding-top:24px}
    .bnr_type2 .tit{line-height:40px}
    .bnr_type2 .txt{padding-top:7px}

    @media
    only screen and (-webkit-min-device-pixel-ratio: 1.5),
    only screen and (min-device-pixel-ratio: 1.5),
    only screen and (min-resolution: 1.5dppx) {
        .page_main .bx-controls-direction .bx-prev{background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_default_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .bx-controls-direction .bx-prev:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_default_hover_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .bx-controls-direction .bx-next{background:url(https://res.kurly.com/pc/service/main/1908/btn_next_default_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .bx-controls-direction .bx-next:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_next_default_hover_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .bg .bx-controls-direction .bx-prev{background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_gray_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .bg .bx-controls-direction .bx-prev:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_prev_gray_hover_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .bg .bx-controls-direction .bx-next{background:url(https://res.kurly.com/pc/service/main/1908/btn_next_gray_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .bg .bx-controls-direction .bx-next:hover{background:url(https://res.kurly.com/pc/service/main/1908/btn_next_gray_hover_x2.png?v=1) no-repeat 50% 50%;background-size:60px 60px}
        .page_main .tit_goods .name .ico{background:url(https://res.kurly.com/pc/service/main/1908/ico_title_link_x2.png) no-repeat 100% 50%;background-size:32px 32px}
        .main_type1 .bx-controls-direction .bx-prev:hover,
        .main_type1 .bx-controls-direction .bx-prev{background:url(https://res.kurly.com/pc/service/main/1908/ico_prev1_x2.png) no-repeat 50% 50%;background-size:52px 52px}
        .main_type1 .bx-controls-direction .bx-next:hover,
        .main_type1 .bx-controls-direction .bx-next{background:url(https://res.kurly.com/pc/service/main/1908/ico_next1_x2.png) no-repeat 50% 50%;background-size:52px 52px}
        .main_md .link_more .ico{background:url(https://res.kurly.com/pc/service/main/1903/ico_more_link_x2.png) no-repeat 100% 50%;background-size:20px 20px}
        .category_type .link_more .ico{background-image:url(https://res.kurly.com/pc/service/main/1903/ico_more_link_x2.png);background-size:20px 20px}
        .main_special .sub_hook{background:url(https://res.kurly.com/pc/service/main/1907/ico_hook_x2.png) no-repeat 0 2px;background-size:18px 18px}
    }
</style>

<div id="mainNotice">
<div id="mainNoticePop">
<pop-view-pc v-for="(popup, idx) in popList" v-if="!noData" :popup-id="popupId" :key="'popup'+idx" :idx="idx" :item="popup" @popup-close="popupClose"></pop-view-pc>
</div>
</div>
<script src="https://www.kurly.com/common_js/main_notice_v1.js?ver=20191028174155"></script>
<script>
    mainNotice.type='pc';
</script>

<div id="kurlyMain" class="page_aticle page_main" v-cloak>
<h2 class="screen_out">마켓컬리 메인</h2>
<component-printer v-for="section in mainData" :section="section" :type="type" :component-name="typeToComponent(section.section_type)"></component-printer>
</div>

<script src="https://res.kurly.com/js/lib/moment.min.js"></script>
<script src="https://res.kurly.com/js/lib/jquery.bxslider.min.js"></script>
<script src="https://www.kurly.com/common_js/common_filter.js?ver=20191028174155"></script>
<script src="https://www.kurly.com/common_js/main_v1.js?ver=20191028174155"></script>
<script>
$(document).ready(function(){
    kurlyMain.type = 'pc';
    kurlyMain.update();
});
</script>
</div>
</div>

<div id="layerDSR">
<div class="bg_dim"></div>
<div class="in_layer">
<div class="inner_layer layer_star">
<strong class="dsr_result">샛별배송 지역입니다.</strong>
<div class="ani">
<img src="https://res.kurly.com/mobile/img/1908/img_delivery_kurly.png" alt="샛별배송 이미지">
</div>
<p class="dsr_desc">
<strong class="emph">오늘 밤 11시 전</strong>까지 주문시<br>
<strong class="emph">다음날 아침 7시</strong> 이전 도착합니다!
</p>
<p class="dsr_notice">샛별배송은 휴무 없이 매일 배송 합니다</p>
</div>
<div class="inner_layer layer_normal">
<strong class="dsr_result">택배배송 지역입니다.</strong>
<div class="ani">
<img src="https://res.kurly.com/mobile/img/1908/img_delivery_car.png" alt="택배배송 이미지">
</div>
<p class="dsr_desc">
<strong class="emph">밤 8시 전</strong>까지 주문시<br>
<strong class="emph">다음날</strong> 도착합니다!
</p>
<p class="dsr_notice">일요일은 배송 휴무로 토요일에는 주문 불가</p>
</div>
<div class="inner_layer layer_none">
<strong class="dsr_result">배송 불가 지역입니다.</strong>
<div class="ani">
<img src="https://res.kurly.com/mobile/img/1908/img_delivery_none.png" alt="배송불가 이미지">
</div>
<p class="dsr_desc">
<strong class="emph">도로명 주소</strong>로 검색하셨다면,<br>
<strong class="emph">지번 주소(구 주소)</strong>로 다시 시도해 주세요.
</p>
<p class="dsr_notice">배송지역을 확장하도록 노력하겠습니다!</p>
</div>
<div class="layer_btn1">
<button type="button" class="btn_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();">확인</button>
</div>
<button type="button" class="layer_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();"></button>
</div>
</div>
<div id="footer">
<div class="inner_footer">
<div class="footer_cc">
<h2 class="tit_cc">고객행복센터</h2>
<div class="cc_view cc_call">
<h3><span class="tit">1644-1107</span></h3>
<dl class="list">
<dt>365고객센터</dt>
<dd>오전 7시 - 오후 7시</dd>
</dl>
</div>
<div class="cc_view cc_kakao">
<h3><a class="tit" href="#none">카카오톡 문의</a></h3>
<script type="text/javascript">
							$('.cc_kakao .tit').on('click',function(e){
								e.preventDefault();
								$.ajax({
									type: "GET",
									url: apiDomain+'/v1/mypage/asks/confirm/kakao',
									dataType: 'json',
									success: function(data) {
										if(data.data.ok_button_action_url.indexOf('https://api.happytalk.io/') > -1){
											if(confirm('['+data.data.title+'] '+data.data.message)) window.open(data.data.ok_button_action_url,'_blank');
										}else{
											alert(data.data.title+'\n'+data.data.message);
										}
									}
								})
							});
						</script>
<dl class="list">
<dt>365고객센터</dt>
<dd>오전 7시 - 오후 7시</dd>
</dl>
</div>
<div class="cc_view cc_qna">
<h3><a href="/shop/mypage/mypage_qna_register.php?mode=add_qna" class="tit">1:1 문의</a></h3>
<dl class="list">
<dt>24시간 접수 가능</dt>
<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
</dl>
</div>
</div>
<div class="company">
<ul class="list">
<li><a class="link" href="/shop/introduce/about_kurly.php">컬리소개</a></li>
<li><a class="link" href="https://www.youtube.com/embed/WEep7BcboMQ?rel=0&showinfo=0&wmode=opaque&enablejsapi=1" onclick="window.open(this.href, 'pop', 'width=1330,height=660,scrollbars=yes');return false;">컬리소개영상</a></li>
<li><a class="link" href="https://marketkurly.recruiter.co.kr/appsite/company/index" target="_blank">인재채용</a></li>
<li><a class="link" href="/shop/service/agreement.php">이용약관</a></li>
<li><a class="link emph" href="/shop/service/private.php">개인정보처리방침</a></li>
<li><a class="link" href="/shop/service/guide.php">이용안내</a></li>
</ul>
법인명 (상호) : 주식회사 컬리 <span class="bar">I</span> 사업자등록번호 : 261-81-23567 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2618123567&apv_perm_no=" target="_blank" class="link">사업자정보 확인</a>
<br>
통신판매업 : 제 2018-서울강남-01646 호 <span class="bar">I</span> 개인정보보호책임자 : 이지훈
<br>
주소 : 서울시 도산대로 16길 20, 이래빌딩 B1 ~ 4F <span class="bar">I</span> 대표이사 : 김슬아
<br>
입점문의 : <a href="https://forms.gle/NJNBNmtYeKQyX5Rn9" target="_blank" class="link">입점문의하기</a> <span class="bar">I</span> 제휴문의 : <a href="mailto:business@kurlycorp.com" class="link">business@kurlycorp.com</a>
<br>
채용문의 : <a href="mailto:recruit@kurlycorp.com" class="link">recruit@kurlycorp.com</a>
<br>
팩스: 070 - 7500 - 6098 <span class="bar">I</span> 이메일 : <a href="mailto:help@kurlycorp.com" class="link">help@kurlycorp.com</a>
<em class="copy">&copy; KURLY CORP. ALL RIGHTS RESERVED</em>
</div>
</div>
<div class="footer_link">
<div class="authentication">
<div class="mark">
<img src="https://res.kurly.com/mobile/service/common/1904/logo_isms.png" alt="isms 로고" class="logo">
<p class="txt">
[인증범위] 마켓컬리 쇼핑몰 서비스 개발 · 운영<br>
[유효기간] 2019.04.01 ~ 2022.03.31
</p>
</div>
<div class="mark lguplus">
<img src="https://res.kurly.com/pc/ico/1810/logo_lguplus_v2.png?v=1" alt="LG U+로고" class="logo">
<p class="txt">
고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
LG U+ 구매안전(에스크로) 서비스를 이용하실 수 있습니다. <a href="#none" target="_blank" onclick="popup('http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=go_thefarmers',460,520);return false;" class="emph">서비스 가입사실 확인</a>
</p>
</div>
</div>
<ul class="list_sns">
<li>
<a href="https://instagram.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="마켓컬리 인스타그램 바로가기"></a>
</li>
<li>
<a href="https://www.facebook.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="마켓컬리 페이스북 바로가기"></a>
</li>
<li>
<a href="http://blog.naver.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="마켓컬리 네이버블로그 바로가기"></a>
</li>
<li>
<a href="https://m.post.naver.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="마켓컬리 유튜브 바로가기"></a>
</li>
<li>
<a href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg" class="link_sns lst" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="마켓컬리 유튜브 바로가기"></a>
</li>
</ul>
</div>
</div>
</div>
</div>

<a href="#top" id="pageTop">맨 위로가기</a>
<script>
	$(document).ready(function(){
		var pageTop = {
			$target : $('#pageTop'),
			$targetDefault : 0,
			$scrollTop : 0,
			$window : $(window),
			$windowHeight : 0,
			setTime : 500,
			saveHeight : 0,
			init:function(){
			},
			action:function(){
				var $self = this;
				$self.$windowHeight = parseInt($self.$window.height());
				$self.$window.on('scroll', function(){
					$self.$scrollTop = parseInt($self.$window.scrollTop());
					if($self.$scrollTop >= $self.$windowHeight){
						if(!$self.$target.hasClass('on')){
							$self.position();
							$self.$target.addClass('on');
							$self.showAction();
						}
					}else{
						if($self.$target.hasClass('on')){
							$self.position();
							$self.$target.removeClass('on');
							$self.hideAction();
						}
					}
				});
                
				$self.$target.on('click', function(e){
					e.preventDefault();
					$self.topAction();
				});
			},
			showAction:function(){
				var $self = this;
				$self.$target.stop().animate({
					opacity:1,
					bottom:$self.saveHeight
				}, $self.setTime);
			},
			hideAction:function(){
				var $self = this;
				$self.$target.stop().animate({
					opacity:0,
					bottom:-$self.$target.height()
				}, $self.setTime);
			},
			topAction:function(){
				var $self = this;
				$self.hideAction();
				$('html,body').animate({
					scrollTop:0
				}, $self.setTime);
			},
			position:function(){
				var $self = this;
				$self.saveHeight = 15;
				if($('#sectionView').length > 0){
					$self.saveHeight = 25;
				}
				if($('#branch-banner-iframe').length > 0 && parseInt( $('#branch-banner-iframe').css('bottom') ) > 0){
					$('#footer').addClass('bnr_app');
					$self.saveHeight += $('#branch-banner-iframe').height();
				}
			}
		}
		pageTop.action();
	});
</script>

<script>
// 클릭인인경우(푸터에 있으나, 아직공용작업은 못함) => bgLoading 이부분 처리필요
var bodyScroll = {
	winScrollTop : 0,
	body : $('body'),
	gnb : $('#gnb'),
	bg : $('#bgLoading'),
	bodyFixed : function(){
		var $self = this;
		var gnbCheck = false;
		$self.gnb = $('#gnb');
		if($self.gnb.hasClass('gnb_stop')){
			gnbCheck = true;
		}
		$self.body = $('body');
		$self.bg = $('#bgLoading');
		$self.winScrollTop = $(window).scrollTop();
		$self.bg.show();
		$self.body.addClass('noBody').css({
			'top' : -$self.winScrollTop
		});
	},
	bodyDefault : function(type){
		var $self = this;
		$self.body.removeClass('noBody').removeAttr('style');
		$self.bg.hide();
		if(type === undefined){
			window.scrollTo(0, $self.winScrollTop);
		}
	}
}
</script>

<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display:none;width:100%;height:600px;"></iframe>
<script>
(function (theFrame) {
  theFrame.contentWindow.location.href = theFrame.src;
}(document.getElementById("ifrmHidden")));
</script>


<script>
var _nSA=(function(_g,_c,_s,_p,_d,_i,_h){
if(_i.wgc!=_g){var _ck=(new Image(0,0)).src=_p+'//'+_c+'/?cookie';_i.wgc=_g;_i.wrd=(new Date().getTime());
var _sc=_d.createElement('script');_sc.src=_p+'//sas.nsm-corp.com/'+_s+'gc='+_g+'&rd='+_i.wrd;
var _sm=_d.getElementsByTagName('script')[0];_sm.parentNode.insertBefore(_sc, _sm);_i.wgd=_c} return _i;
})('TR10082304856','ngc1.nsm-corp.com','sa-w.js?',location.protocol,document,window._nSA||{},location.hostname);
</script><noscript><img src="//ngc1.nsm-corp.com/?uid=TR10082304856&je=n&" border=0 width=0 height=0></noscript>

</body>
</html>
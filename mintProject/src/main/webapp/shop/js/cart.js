/**
 * 191111
 * 한문희
 */

$(document).ready(function(){
	if(memId != ''){
		$(function() {
			const $viewGoods = $('.viewGoods');
			
			getCartList()
				.then(printCartList)
				.catch(printError);
			
			function getCartList() {
				return $.ajax({
					url: '/mintProject/shop/goods/getCartList',
					type: 'GET',
					data: 'memId='+memId,
					dataType: 'json'
				});
			}
			
			function printError(error) {
				console.error(error);
			}
			
			function printCartList(data) {
				let cart = data.list;
				let $frag = $(document.createDocumentFragment());
				for (let i=0; i<cart.length; i++){
					const {
						PRODUCTCODE,//코드
						THUMBNAIL,//썸내일이미지
						MAINSUBJECT,//제목
						PRICE,//가격
						STOCK,//재고,수량
						DISCOUNTRATE,//할인율
						MEMLEVEL,//회원등급
						CTCOUNT//카드수량
					} = cart[i];
					let discoutPrice = PRICE*(DISCOUNTRATE/100);//상품할인된금액
					let price2 = PRICE - discoutPrice;//상품할인적용가
					let savingPrice = 0;//적립금
					
					// 여기서
					
					let customCart = `
						<tr class="viewDel">
							<input type="hidden" class="productCode" value="${PRODUCTCODE }">
							<input type="hidden" class="stock" value="${STOCK }">
						
							<input type="hidden" class="memlevel" value="${MEMLEVEL }">
							<input type="hidden" name="price2" class="prd_price_fix" value="${price2 }">
							<td class="cart-tb__check">
							<label for="" class="check-label checked" onclick="change_checkbox($(this))">
								<input type="checkbox" class="prdCheck ico_check" checked onchange="total_calcul()">
						 	</label>
							</td>
							<td class="cart-tb__thumb"><img src="/mintProject/shop/storage/mint/product/${THUMBNAIL }"></td>
							<td class="cart-tb__desc">
								<div class="cart-tb__name">${MAINSUBJECT }</div>
								<div class="price_Box">
									정가: <span class="product__dc cart-tb__num price1">${PRICE }</span>
									할인가격: <span class="product__price cart-tb__num price2">${price2}</span>
								</div>
							</td>
							<td class="cart-tb__count">
							 	<span class="goods-count">
									<button class="minus" onClick="fnDn($(this))"></button>
									<input type="text" value="${CTCOUNT }" id="${PRODUCTCODE }" class="qty clk_count" readonly>
									<button type="button" class="plus up_btn" onClick="fnUp($(this))"></button>
								</span>
							</td>
							<td class="cart-tb__total prd_price">${price2 }</td>
							<td>
								<button type="button" class="btn_delete_point" onclick="seldel($(this))"><img src="https://res.kurly.com/pc/ico/1801/btn_close_24x24_514859.png" alt="삭제"></button>
							</td>
						</tr>
					`;
					$frag.append($(customCart));
				}
				$viewGoods.append($frag);
				
				let chk_total_obj = [];//input checkBox 객체
				let chk_total_leng = 0;//input checkBox 개수
				let chk_obj = [];//상품row checkbox
				let chk_leng = 0;//상품row checkbox count
				let checked = 0;//상품 for문에 쓸 변수
				var lastPrice = 0;//총상품금액 계
				var stock = []; //수량의 배열을 담을 객체
				
				fnck();//체크박스
				total_calcul();//총상품금액
				PriceCntSum();//총상품금액 수량 1이상일때 계산
				hide_stock();//품절처리
				selectDelete();//선택삭제
			}
			
		});
		
	} else {
		swal("로그인을 하지 않았습니다.");
		history.back();
	}
});

//브라우저 로드 상품  카운트 1이상일때 계산
function PriceCntSum() {
	let salePrice = new Array();
	let cnt = $('.qty').length;
	
	for(i=0; i<cnt; i++) {
		salePrice[i] = parseInt($('.price2').eq(i).text() * $('.qty').eq(i).val());
		
		$('.prd_price').eq(i).text(salePrice[i]);
	}
}

//품절처리
function hide_stock() {
	stock = new Array();
	$(".stock").each(function(index, item) {
		stock.push(parseInt($(item).val()));
	});
	for(i=0; i<prdCnt; i++) {
		if(stock[i] == 0) {
			$(".stock").eq(i).parents(".viewDel").css("background", "white").css("opacity", "20%").addClass("soldOut");
		}
	}
}

//품절된상품 삭제
$('.soldOutBtn').click(function(){
	
	let soldCnt = $('.soldOut').length;
	let soldOutPrd = new Array(soldCnt);
	
	for(i=0; i<soldCnt; i++) {
		soldOutPrd[i] = $('.soldOut').eq(i).children('.productCode').val();
	}
	
	$.ajax({
		type: 'post',
		url: '/mintProject/shop/goods/cartSoldOutDelete',
		contentType: 'application/json; charset=utf-8',
		data: JSON.stringify({
			id : memId,
			productCode : soldOutPrd 
		}),
		success: function(data){
			location.reload(true);
		},
		error: function(err){
			console.log(err);
		}
	});
});

//선택삭제 이벤트
function selectDelete() {
	$(".selectBtn").click(function(){
		for(i=0; i<prdCnt; i++){
			if($('.prdCheck').eq(i).prop('checked') == true){
				$('.prdCheck').eq(i).parent().parent().next().next().next().next().next().children('.btn_delete_point').trigger('click','trigger');
			}
		}
	});
}

//총 체크 개수 카운트, 상품채크
function fnck() {
	chk_total_obj = document.getElementsByClassName('prdCheck');//상품채크박스
	chk_total_leng = chk_total_obj.length;//상품채크박스 개수
	$('.prd_count').text(chk_total_leng);//상품체크박스 선택한것만 카운트
	$('.prd_total_count').text(chk_total_leng);//상품체크박스 개수 카운트

}

//상품 각각 카운트: fnck() 함수 안에서 정의되었는데, 해당 함수 안에 있지 않아도 상관 없어서 위치를 밖으로 뺐습니다. 
$('.prdCheck').on("click", function(){
	chCount();
});

//allCheck.on(): 본래 click 이벤트였는데, trigger로 불러오려니까 꼬이더라구요.. 그래서 change로 바꿨습니다. (allCheck(체크박스) 가 클릭되었을 때 = 체크박스 상태가 변경되었을때 라서 바꿔도 액션은 동일하게 들어감) 
$('.allCheck').on('change', function(){
 	if($(this).prop('checked')) {
 		$(".prdCheck").prop("checked", true); 
 		$(".prdCheck").parent().attr('class', 'check-label checked'); // 라벨의 아이콘을 체크 상태로 바꿈
 		chCount();
 	}else{
 		$(".prdCheck").prop("checked", false);
 		$(".prdCheck").parent().attr('class', 'check-label'); // 라벨의 아이콘을 체크 상태로 바꿈
 		chCount();
 	}
	
 	total_calcul();
});

//상품개수카운트 함수
//제가 추가한 내용만 주석을 달아놨어요
function chCount() {
	chk_obj = $('.prdCheck');
	chk_leng = chk_obj.length;
	checked = 0;
	
	for(i=0; i<chk_leng; i++){
		if(chk_obj[i].checked){
			checked += 1;
		}
	}
	
	if(checked == chk_leng) { // 모든 상품이 체크 상태일 때, 상위의 [전체선택] 체크박스 라벨의 아이콘을 체크상태로 바꿈 
		$('.allCheck').parent().attr('class', 'check-label checked');
	}
	
	$('.prd_count').text(checked);
}

//수량 +버튼
function fnUp(btn) {
	let quan = btn.prev().val(); // span의 text (수량) 가져오기
	let stock = btn.parent().parent().prev().prev().prev().prev().prev().prev().val() //해당 상품 수량
	let discountPrice = btn.parent().parent().prev().prev().prev().prev().val(); // 할인가 (fix) 1개 당 가격: [상품금액] column에 들어가는 값이 할인가 * 수량 이길래 수정해서 받았습니다. 
	let discountTotPrice = discountPrice * quan; // 할인가 total = 가격 * 수량 
	
	quan++; // 값을 1 증가
	
	if(stock < quan){
		alert('선택한 수량이 남은 제고보다 많습니다. 남은제고 수량 = '+stock+"개");
		return;
	}
	
	btn.prev().val(quan); // 1 증가한 수를 span 의 text 에 넣고
	btn.parent().parent().next().text(discountTotPrice); // [상품금액] column에 계산된 할인가를 넣는다. 
	
	total_calcul();
}

//수량 -버튼
function fnDn(btn) {
	let quan = btn.next().val();
	let stock = btn.parent().parent().prev().prev().prev().prev().prev().prev().val() //해당 상품 수량
	let discountPrice = btn.parent().parent().prev().prev().prev().prev().val(); // 1개 가격 - 할인가 
	let discountTotPrice = discountPrice * quan; 
	
	quan--;
	
	if(quan == '0') {
		swal('0 이하로는 설정할 수 없습니다. ');
		return;
	}else if(stock < quan) {
		swal('선택한 수량이 남은 제고보다 많습니다. 남은제고 수량 = '+stock+"개 수량을 맞춰주세요");
	}
	
	btn.next().val(quan);
	btn.parent().parent().next().text(discountTotPrice);
	total_calcul();
}

//상품 delete버튼
function seldel(deleteBtn) {
	let rowDeleteSel = deleteBtn.parent().prev().prev().children().children('input').attr('id'); //구조 변경: children() ==> children().children('input')
	//특정product 삭제
	$(function() {
		cartListDelete()
			.then(printCartListDelete)
			.catch(printError);
		
		function cartListDelete() {
			return $.ajax({
				url: '/mintProject/shop/goods/cartListDelete',
				type: 'POST',
				data: 'memId='+memId+'&productCode='+rowDeleteSel
			});
		}
		
		function printError(error) {
			console.error(error);
		}
		
		function printCartListDelete() {
			location.reload(true);
			$('#'+rowDeleteSel).parents().parents('.viewDel').remove();
			
			chk_total_obj = $('.prdCheck');
			chk_total_leng = chk_total_obj.length;
			$('.prd_total_count').text(chk_total_leng);
			
			total_calcul();
			$('.prd_count').text(chk_total_leng);//상품체크박스 선택한것만 카운트
			$('.prd_total_count').text(chk_total_leng);//상품체크박스 개수 카운트
		}
	});
}

//장바구니 총 상품금액 계산
function total_calcul() {
	prdCnt = $('span.price1').length; // 장바구니에 담긴 상품 개수 
	var originalArr = new Array(prdCnt); //정가의 배열을 담을 객체
	var discountArr = new Array(prdCnt); //할인가의 배열을 담을 객체
	var memlevel = 0;
	
	//변수 초기화 
	let deliveryPrice = 0; 
	let originalTotPrice = 0;
	let discountTotPrice = 0;
	
	for(var i=0; i<prdCnt; i++){
		if($(".prdCheck").eq(i).prop("checked")){ //구조 변경:$('.clk_count').eq(i).text() ==> $('.clk_count').eq(i).val()
			originalArr[i] = parseInt($('span.price1').eq(i).text() * $('.clk_count').eq(i).val()); // 정가의 수량 * 갯수 (3000*2)를 각각 배열에 넣는다.  
			discountArr[i] = parseInt($('span.price2').eq(i).text() * $('.clk_count').eq(i).val());// 할인가의 수량 * 갯수 (2700*2)를 각각 배열에 넣는다. 
			
			originalTotPrice += parseInt(originalArr[i]); // [상품금액 div]의 값: 각 배열을 더하여 정가의 총 합 계산
			discountTotPrice += parseInt(originalArr[i] - discountArr[i]); // [상품할인금액 div]의 값: 정가(3000*2) - 할인가(2700*2) = 할인금액
		}
	}
	
	if(originalTotPrice === 0) {
		deliveryPrice = 0;
	}else if(originalTotPrice - discountTotPrice < 30000) { // [상품금액div - 상품할인금액 div] 값이 30000원 이하면 배송비가 붙는다. 
		deliveryPrice = 3000;
	}
	
	$('#amountPrice').text(originalTotPrice); // 정가의 총 합 > [상품금액 div] - span 에 담기
	$('#amountSale').text(discountTotPrice); // 할인금액 총 합 > [상품할인금액 div] - span에 담기
	$('#amountCourier').text(deliveryPrice); // 배송비
	$('#amountTotal').text(originalTotPrice - discountTotPrice + deliveryPrice); // 최종 [결제예정금액 div]

	memlevel = $('.memlevel').eq(0).val();
	if(memlevel == 0) {
		$('#totalPoint span').text(parseInt((originalTotPrice - discountTotPrice) * 0.05)); // 적립금 : 최종 결제 예정 금액 * 적립금 비율(memLevel에 따라 달라짐: pointRate의 값 가져옴)
		//savingPrice = $('#totalPoint span').text();
		//$('.savingPrice').eq(0).val(savingPrice);
	}else if(memlevel == 1) {
		$('#totalPoint span').text(parseInt((originalTotPrice - discountTotPrice) * 0.07));
	}else if(memlevel == 2) {
		$('#totalPoint span').text(parseInt((originalTotPrice - discountTotPrice) * 0.1));
	}

}

//장바구니 리스트의 체크박스(라벨)이 클릭되었을 때 실행하는 함수
//<label><input type="checkbox"></label>의 구조이기 때문에, [라벨]을 클릭하였을 때 [체크박스]의 prop('checked')를 직접 변경해주어야 함. 
function change_checkbox(label){
	if(label.children(':first').prop('checked')) {
		label.children(':first').prop('checked', false); // [체크박스]의 prop('checked')을 변경하고
		label.children(':first').trigger('change', 'trigger'); // 체크박스의 프로퍼티가 변경되었기 때문에, trigger로 이벤트를 수행하러 보냄. 
		label.attr('class', 'check-label'); // [라벨]의 아이콘을 체크 해제 상태로 바꿈
		
		$('.allCheck').parent().attr('class', 'check-label');
	} else {
		label.children(':first').prop('checked', true);
		label.children(':first').trigger('change', 'trigger');
		label.attr('class', 'check-label checked'); 
	}
	chCount();
	
}

//[전체선택] 체크박스(라벨)이 클릭되었을 때 실행하는 함수
function change_Allcheckbox(label){
	if(label.children(':first').prop('checked')){
		label.children(':first').prop('checked', false); // [체크박스]의 prop('checked')을 변경하고
		label.children(':first').trigger('change', 'trigger'); // 체크박스의 프로퍼티가 변경되었기 때문에, trigger로 이벤트를 수행하러 보냄. 
		label.attr('class', 'check-label'); // [라벨]의 아이콘을 체크 해제 상태로 바꿈
	} else{
		label.children(':first').prop('checked', true);
		label.children(':first').trigger('change', 'trigger');
		label.attr('class', 'check-label checked');
	}
		
	total_calcul();
	
}


















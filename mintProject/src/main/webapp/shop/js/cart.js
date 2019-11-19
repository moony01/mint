/**
 * 191111
 * 한문희
 */

$(document).ready(function(){
	if(memId != ''){
		$(function() {
			console.log("session memId : "+memId);
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
						MEMLEVEL//회원등급
					} = cart[i];
					let discoutPrice = PRICE*(DISCOUNTRATE/100);//상품할인된금액
					let price2 = parseInt(PRICE - discoutPrice);//상품할인적용가
					let savingPrice = 0;//적립금
					let customCart = `
						<tr class="viewDel">
						
						<input type="hidden" class="mainSubject" value="${MAINSUBJECT }">
						<input type="hidden" class="productCode" value="${PRODUCTCODE }">
						<input type="hidden" class="thumbnail" value="${THUMBNAIL }">
						<input type="hidden" class="price" value="${PRICE }">
						<input type="hidden" class="discountRate" value="${DISCOUNTRATE }">
						
						
						
						
						
							<input type="hidden" class="stock" value="${STOCK }">
							<input type="hidden" class="savingPrice" value="${savingPrice }">
						
							<input type="hidden" class="memlevel" value="${MEMLEVEL }">
							<input type="hidden" name="price2" class="prd_price_fix" value="${price2 }">
							<td><input type="checkbox" class="prdCheck ico_check" checked onchange="total_calcul()"></td>
							<td><img src="../storage/product/thumb/${THUMBNAIL }" style="width: 100px;"></td>
							<td>
								<div>${MAINSUBJECT }</div>
								<div class="price_Box">
									할인가격: <span class="price2">${price2}</span>
									정가: <span class="price1">${PRICE }</span>
								</div>
							</td>
							<td>
								<button type="button" class="dwn_btn" onClick="fnDn($(this))">-</button>
								<span id="${PRODUCTCODE }" class="clk_count">1</span>
								
								<button type="button" class="up_btn" onClick="fnUp($(this))">+</button>
							</td>
							<td class="prd_price">${price2 }</td>
							<td>
								<button type="button" class="btn btn_delete_point" onclick="seldel($(this))"></button>
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
				
				fnck();//체크박스
				total_calcul();//총상품금액
				hide_stock();//품절처리
				selectDelete();//선택삭제
				dataProcess();//데이터가공
			}
			
		});
		
	} else {
		alert("로그인을 하지 않았습니다.");
		history.back();
	}
});

//품절처리
function hide_stock() {
	var stock = new Array(); //정가의 배열을 담을 객체
	$(".stock").each(function(index, item) {
		stock.push(parseInt($(item).val()));
	});
	
	for(i=0; i<prdCnt; i++) {
		if(stock[i] == 0) {
			$(".stock").eq(i).parents(".viewDel").css("background", "red").addClass("soldOut");
		}
	}
}

//선택삭제 이벤트
function selectDelete() {
	$(".selectBtn").click(function(){
		for(i=0; i<prdCnt; i++){
			if($('.prdCheck').eq(i).prop('checked') == true){
				$('.prdCheck').eq(i).parents().next().next().next().next().next().children('.btn_delete_point').trigger('click','trigger');
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
	
	//상품 전체선택
	$('.allCheck').on('click', function(){
		if($(this).prop('checked') == true) {
			$(".prdCheck").prop("checked", true);
			chCount();
		}else{
			$(".prdCheck").prop("checked", false);
			chCount();
		}
	});
	
	//상품 각각 카운트
	$('.prdCheck').on("click", function(){
		chCount();
	});
	
	//상품개수카운트 함수
	function chCount() {
		chk_obj = $('.prdCheck');
		chk_leng = chk_obj.length;
		checked = 0;
		
		for(i=0; i<chk_leng; i++){
			if(chk_obj[i].checked){
				checked += 1;
			}
		}
		$('.prd_count').text(checked);
	}
}

//수량 +버튼
function fnUp(btn) {
	let quan = btn.prev().text(); // span의 text (수량) 가져오기
	quan++; // 값을 1 증가
	let discountPrice = btn.parent().prev().prev().prev().prev().val(); // 할인가 (fix) 1개 당 가격: [상품금액] column에 들어가는 값이 할인가 * 수량 이길래 수정해서 받았습니다. 
	let discountTotPrice = discountPrice * quan; // 할인가 total = 가격 * 수량 
	
	btn.prev().text(quan); // 1 증가한 수를 span 의 text 에 넣고
	btn.parent().next().text(discountTotPrice); // [상품금액] column에 계산된 할인가를 넣는다. 
	
	total_calcul();
}

//수량 -버튼
function fnDn(btn) {
	let quan = btn.next().text();
	quan--;
	let discountPrice = btn.parent().prev().prev().prev().prev().val(); // 1개 가격 - 할인가 
	let discountTotPrice = discountPrice * quan; 
	
	if(quan == '0') {
		alert('0 이하로는 설정할 수 없습니다. ');
		return;
	}
	
	btn.next().text(quan);
	btn.parent().next().text(discountTotPrice);
	total_calcul();
}

//상품 delete버튼
function seldel(deleteBtn) {
	let rowDeleteSel = deleteBtn.parents().prev().prev().children('span').attr('id');
	
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
		if($(".prdCheck").eq(i).prop("checked")){
			originalArr[i] = parseInt($('span.price1').eq(i).text() * $('span.clk_count').eq(i).text()); // 정가의 수량 * 갯수 (3000*2)를 각각 배열에 넣는다.  
			discountArr[i] = parseInt($('span.price2').eq(i).text() * $('span.clk_count').eq(i).text());// 할인가의 수량 * 갯수 (2700*2)를 각각 배열에 넣는다. 
			
			originalTotPrice += parseInt(originalArr[i]); // [상품금액 div]의 값: 각 배열을 더하여 정가의 총 합 계산
			discountTotPrice += parseInt(originalArr[i] - discountArr[i]); // [상품할인금액 div]의 값: 정가(3000*2) - 할인가(2700*2) = 할인금액
		}
	}
	
	if(originalTotPrice - discountTotPrice < 30000) { // [상품금액div - 상품할인금액 div] 값이 30000원 이하면 배송비가 붙는다. 
		deliveryPrice = 3000;
	}
	
	$('#totalPrdPrice span').text(originalTotPrice); // 정가의 총 합 > [상품금액 div] - span 에 담기
	$('#totalDiscountPrice span').text(discountTotPrice); // 할인금액 총 합 > [상품할인금액 div] - span에 담기
	$('#DeliveryPrice span').text(deliveryPrice); // 배송비
	$('#totalSumPrice span').text(originalTotPrice - discountTotPrice + deliveryPrice); // 최종 [결제예정금액 div]

	memlevel = $('.memlevel').eq(0).val();
	if(memlevel == 0) {
		 $('#totalPoint span').text((originalTotPrice - discountTotPrice + deliveryPrice) * 0.05); // 적립금 : 최종 결제 예정 금액 * 적립금 비율(memLevel에 따라 달라짐: pointRate의 값 가져옴)
		savingPrice = $('#totalPoint span').text();
		$('.savingPrice').eq(0).val(savingPrice);
	}else if(memlevel == 1) {
		console.log("memlevel : 1");
	}

}

//데이터 가공
function dataProcess() {
	var form = document.createElement("form");
	
	form.setAttribute("id", "process");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "POST");
	form.setAttribute("action", "/mintProject/shop/goods/order");
	
	//상품이름
	var input = document.createElement("input");
	input.name = 'mainSubject';
	input.type = 'hidden';
	let checkValue = [];
	for(var i=0; i<prdCnt; i++) {
		let value = $('.mainSubject').eq(i).val();
		checkValue.push(value);
	}
	input.value = checkValue;
	form.appendChild(input);
	document.body.appendChild(form);
	console.log(form);
	
	//데이터셋팅
//	let mainSubject = document.querySelectorAll('.mainSubject');
//	for(var i=0; i<prdCnt; i++) {
//		form.append("mainSubject", mainSubject.item(i).value);
//	}
}













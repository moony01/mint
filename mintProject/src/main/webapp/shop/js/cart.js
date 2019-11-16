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

				
				/* DB 쿼리문이 수정됩니다. (사유: member 테이블의 memLevel을 가져와야 적립금 적용할 수 있음 => id를 사용하여 member 테이블 join )
					const {} 템플릿 리터럴로 받는 값에 memLevel도 추가 후, level에 따라 적립률 계산하여 hidden value = ${pointRate} 로 넣어놨다가 적립금 계산 시에만 사용하면 될 듯 합니다. 
					ex) if(memLevel == '0') pointRate = 0.05; 
					
					select productCode, thumbNail, mainSubject, price, stock, discountRate, memLevel from product
					join cart using(productCode)
					join member using(id) where id='hong';

					단, 이 경우 resultType = product 가 불가하여...., java.util.Map으로 변경해서 받을 수 있을지 확인 필요. (지수님 한거같던데? 일욜에 물어봅시다)
				*/
				
				let cart = data.list;
				let $frag = $(document.createDocumentFragment());
				for (let i=0; i<cart.length; i++){
					const {
						productCode,//코드
						thumbnail,//썸내일이미지
						mainSubject,//제목
						price,//가격
						stock,//재고,수량
						discountRate//할인율
					} = cart[i];
					let discoutPrice = price*(discountRate/100);
					let price2 = parseInt(price - discoutPrice);
					let customCart = `
						<tr class="viewDel">
							<input type="hidden" class="prd_price_fix" value="${price2 }">
							<td><input type="checkbox" name="prdCheck" class="ico_check" checked onchange="chMinusPrice($(this))"></td>
							<td><img src="../storage/cartTest/${thumbnail }" style="width: 30px;"> </td>
							<td>
								<div>${mainSubject }</div>
								<div class="price_Box">
									할인가격: <span class="price2">${price2}</span>
									정가: <span class="price1">${price }</span>
								</div>
							</td>
							<td>
								<button type="button" class="dwn_btn" onClick="fnDn($(this))">-</button>
								<span id="${productCode }" class="clk_count">1</span>
								
								<button type="button" class="up_btn" onClick="fnUp($(this))">+</button>
							</td>
							<td class="prd_price">${price2 }</td>
							<td>
								<button type="button" class="btn btn_delete"></button>
							</td>
						</tr>
					`;
					$frag.append($(customCart));
				}
				$viewGoods.append($frag);
				
				//fnPrice
				let dctrPrice = 0;
				let finalPrice = 0;
				
				//fnck
				let chk_total_obj = [];//input checkBox 객체
				let chk_total_leng = 0;//input checkBox 개수
				let chk_obj = [];//상품row checkbox
				let chk_leng = 0;//상품row checkbox count
				let checked = 0;//상품 for문에 쓸 변수
				
				let prdPriceFix = 0;//hide시킨 최초 상품금액
				
				var lastPrice = 0;//총상품금액 계
				
				//fnPrice();//상품금액계산
				fnck();//체크박스
				seldel();//상품삭제
				total_calcul();//총상품금액
			}
			
		});
		
	} else {
		alert("로그인을 하지 않았습니다.");
		history.back();
	}
	
});

//총 체크 개수 카운트, 상품채크
function fnck() {
	chk_total_obj = document.getElementsByName('prdCheck');//상품채크박스
	chk_total_leng = chk_total_obj.length;//상품채크박스 개수

	$('.prd_count').text(chk_total_leng);//상품체크박스 선택한것만 카운트
	$('.prd_total_count').text(chk_total_leng);//상품체크박스 개수 카운트
	
	//상품 전체선택
	$('input[name="allCheck"]').on('click', function(){
		if($(this).prop('checked') == true) {
			$(".ico_check").prop("checked", true);
			chCount();
		}else{
			$(".ico_check").prop("checked", false);
			//5800
			chCount();
		}
	});
	
	//상품 각각 카운트
	$('input:checkbox[name=prdCheck]').on("click", function(){
		chCount();
	});
	
	//상품개수카운트 함수
	function chCount() {
		chk_obj = $('input:checkbox[name=prdCheck]');
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

function fnUp(btn) {
	let quan = btn.prev().text(); // span의 text (수량) 가져오기
	quan++; // 값을 1 증가
	let discountPrice = btn.parent().prev().prev().prev().prev().val(); // 할인가 (fix) 1개 당 가격: [상품금액] column에 들어가는 값이 할인가 * 수량 이길래 수정해서 받았습니다. 
	let discountTotPrice = discountPrice * quan; // 할인가 total = 가격 * 수량 
	
	btn.prev().text(quan); // 1 증가한 수를 span 의 text 에 넣고
	btn.parent().next().text(discountTotPrice); // [상품금액] column에 계산된 할인가를 넣는다. 
	
	total_calcul();
}

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

function seldel() {
	$('.btn_delete').click(function(){
		let rowDeleteSel = $(this).parents().prev().prev().children('span').attr('id');
		$('#'+rowDeleteSel).parents().parents('.viewDel').remove();
		
		chk_total_obj = document.getElementsByName('prdCheck');
		chk_total_leng = chk_total_obj.length;
		$('.prd_total_count').text(chk_total_leng);
		
		total_calcul();
		$('.prd_count').text(chk_total_leng);//상품체크박스 선택한것만 카운트
		$('.prd_total_count').text(chk_total_leng);//상품체크박스 개수 카운트
	});
}

//장바구니 총 상품금액
function total_calcul() {
	prdCnt = $('span.price1').length; // 장바구니에 담긴 상품 개수 
		
	var originalArr = new Array(prdCnt); //정가의 배열을 담을 객체
	var discountArr = new Array(prdCnt); //할인가의 배열을 담을 객체
	
	//변수 초기화 
	let deliveryPrice = 0; 
	let originalTotPrice = 0;
	let discountTotPrice =0;
	
	//for문을 돌면서.. 
	//$('span.price1').eq(i).text(): 상품의 정가를 하나씩 가져옴 ex) 3000
	//$('span.clk_count').eq(i).text(): 상품의 수량을 하나씩 가져옴  ex) 2
	//$('span.price2').eq(i).text(): 상품의 할인가를 하나씩 가져옴 ex) 2700
	for(var i=0; i<prdCnt; i++){
		originalArr[i] = parseInt($('span.price1').eq(i).text() * $('span.clk_count').eq(i).text()); // 정가의 수량 * 갯수 (3000*2)를 각각 배열에 넣는다.  
		discountArr[i] = parseInt($('span.price2').eq(i).text() * $('span.clk_count').eq(i).text());// 할인가의 수량 * 갯수 (2700*2)를 각각 배열에 넣는다. 
		
		originalTotPrice += parseInt(originalArr[i]); // [상품금액 div]의 값: 각 배열을 더하여 정가의 총 합 계산
		discountTotPrice += parseInt(originalArr[i] - discountArr[i]); // [상품할인금액 div]의 값: 정가(3000*2) - 할인가(2700*2) = 할인금액
	}

	if(originalTotPrice - discountTotPrice < 30000) { // [상품금액div - 상품할인금액 div] 값이 30000원 이하면 배송비가 붙는다. 
		deliveryPrice = 3000;
	}
	
	$('#totalPrdPrice span').text(originalTotPrice); // 정가의 총 합 > [상품금액 div] - span 에 담기
	$('#totalDiscountPrice span').text(discountTotPrice); // 할인금액 총 합 > [상품할인금액 div] - span에 담기
	$('#DeliveryPrice span').text(deliveryPrice); // 배송비
	$('#totalSumPrice span').text(originalTotPrice -discountTotPrice + deliveryPrice); // 최종 [결제예정금액 div]
	$('#totalPoint span').text((originalTotPrice -discountTotPrice + deliveryPrice) * 0.05); // 적립금 : 최종 결제 예정 금액 * 적립금 비율(memLevel에 따라 달라짐: pointRate의 값 가져옴)

}

function chMinusPrice(check){
	console.log("chMinusPrice");
	var fileData = new Array(prdCnt);

	lastPrice=0;
	for(var i=0; i<prdCnt; i++){
		fileData[i] = parseInt($('.prd_price').eq(i).text());
		console.log("for loop; "+fileData[i]);
		
		if($("input[name=prdCheck]").eq(i).prop("checked")){
			lastPrice += fileData[i];
			console.log("when checked: "+lastPrice);
		}
	}
	
	$('#totalPrdPrice span').text(lastPrice);
}















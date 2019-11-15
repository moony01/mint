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
						productCode,//코드
						thumbnail,//썸내일이미지
						mainSubject,//제목
						price,//가격
						stock,//재고,수량
						discountRate//할인율
					} = cart[i];
					
					let customCart = `
						<tr class="viewDel">
							<input type="hidden" class="prd_price_fix" value="${price }">
							<td><input type="checkbox" name="prdCheck" class="ico_check" checked onchange="chMinusPrice($(this))"></td>
							<td><img src="../storage/cartTest/${thumbnail }" style="width: 30px;"> </td>
							<td>
								<div>${mainSubject }</div>
								<div class="price_Box">
									<span class="dctrPrice"></span>
									<span class="finalPrice">${price }</span>
								</div>
							</td>
							<td>
								<button type="button" class="dwn_btn" onClick="fnDn($(this))">-</button>
								<span id="${productCode }" class="clk_count">1</span>
								
								<button type="button" class="up_btn" onClick="fnUp($(this))">+</button>
							</td>
							<td class="prd_price">${price }</td>
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
	chk_total_obj = document.getElementsByName('prdCheck');
	chk_total_leng = chk_total_obj.length;

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
	let quan = btn.prev().attr('id');
	prdPriceFix = parseInt(btn.parents().prev().prev().prev().prev().val());
	let price = parseInt(btn.parents().next().text());
	
	$('#'+quan).text(parseInt($('#'+quan).text())+1);
	
	$('#'+quan).parents().next('.prd_price').text(price+prdPriceFix);
	total_calcul();
}

function fnDn(btn) {
	let quan = btn.next().attr('id');
	prdPriceFix = parseInt(btn.parents().prev().prev().prev().prev().val());
	let price = parseInt(btn.parents().next().text());
	
	if($('#'+quan).text() > 1) {
		$('#'+quan).text(parseInt($('#'+quan).text())-1);
		
		$('#'+quan).parents().next('.prd_price').text(price-prdPriceFix);
		total_calcul();
	}else {
		console.log("1밑으로 수량을 설정할수 없다!");
	}
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
	prdCnt = $('.prd_price').length;
	prdPrice = $('.prd_price').text();
	
	var fileData = new Array(prdCnt);
	lastPrice = 0;

	for(var i=0; i<prdCnt; i++){
		fileData[i] = parseInt($('.prd_price').eq(i).text());
		lastPrice += fileData[i];
		
	}

	$('#totalPrdPrice span').text(lastPrice);
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















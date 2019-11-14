/**
 * 191111
 * 한문희
 */

let chk_total_obj = [];
let chk_total_leng = 0;

let chk_obj = [];
let chk_leng = 0;
let checked = 0;

let pur_cnt = 1; //구매개수

let prd_price = [];//총 상품금액


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
						productCode,
						thumbnail,
						mainSubject,
						price,
						stock,
						discountRate
					} = cart[i];
					
					let customCart = `
						<tr class="viewDel">
							<td><input type="checkbox" name="prdCheck" class="ico_check"></td>
							<td><img src="../storage/cartTest/${thumbnail }" style="width: 30px;"> </td>
							<td>${mainSubject }</td>
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
				let first_price = 0
				
				fnck();//총 체크 개수
				seldel();//상품삭제
				total_calcul();
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

	//상품전체개수
	$('.prd_total_count').text(chk_total_leng);
	
	//상품 전체선택
	$('input[name="allCheck"]').on('click', function(){
		if($(this).prop('checked') == true) {
			$(".ico_check").prop("checked", true);
			chCount();
		}else{
			$(".ico_check").prop("checked", false);
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
	first_price = parseInt(btn.parents().next().text());
	let price = parseInt(btn.parents().next().text());
	
	price = first_price+price;
	
	$('#'+quan).text(parseInt($('#'+quan).text())+1);
	
	
	
	console.log(price);
	console.log(first_price);
	$('#'+quan).parents().next('.prd_price').text(price);
}

function fnDn(btn) {
	let quan = btn.next().attr('id');
	let price = parseInt(btn.parents().next().text());
	
	if($('#'+quan).text() > 1) {
		$('#'+quan).text(parseInt($('#'+quan).text())-1);
		price-=price;
		console.log(price);
		$('#'+quan).parents().next('.prd_price').text(price);
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
	});
}

function total_calcul() {
	//상품금액
	prdCnt = $('.prd_price').length;
	prdPrice = parseInt($('.prd_price').text());
	var fileData = new Array(prdCnt);
	
	console.log(prdCnt);
	
	
	for(var i=0; i<prdCnt; i++){
		fileData[i] = prdPrice[i];
	}
	
	console.log(fileData);
	
//	console.log(prdCnt);
//	console.log(prd_price);
//	
//	for(i=1; i<prdCnt; i++) {
//		prd_price+=prd_price;
//		console.log(prd_price);
//		
//		console.log(prd_price[i]=i);
//	}
	

}






















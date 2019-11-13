/**
 * 191111
 * 한문희
 */

let chk_total_obj = [];
let chk_total_leng = 0;

let chk_obj = [];
let chk_leng = 0;
let checked = 0;

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
						<tr>
							<td><input type="checkbox" name="prdCheck" class="ico_check"></td>
							<td><img src="../storage/cartTest/${thumbnail }" style="width: 30px;"> </td>
							<td>${mainSubject }</td>
							<td>00</td>
							<td>${price }</td>
							<td>X</td>
						</tr>
					`;
					$frag.append($(customCart));
				}
				$viewGoods.append($frag);
				
				//총 체크 개수
				fnck();
			}
			
		});
		
	} else {
		alert("로그인을 하지 않았습니다.");
		history.back();
	}
	
	//상품 전체선택
//	$('input[name="allCheck"]').on('click', function(){
//		if($(this).prop('checked') == true) {
//			$(".ico_check").prop("checked", true);
//		}else{
//			$(".ico_check").prop("checked", false);
//		}
//	});
	
});


function fnck() {
	chk_total_obj = document.getElementsByName('prdCheck');
	chk_total_leng = chk_total_obj.length;

	$('.prd_total_count').text(chk_total_leng);
	
	$('input:checkbox[name=prdCheck]').on("click", function(){
		chk_obj = $('input:checkbox[name=prdCheck]:checked');
		chk_leng = chk_obj.length;
		checked = 0;
		
		console.log(chk_obj);
		console.log(chk_leng);
		
		for(i=0; i<chk_leng; i++){
			if(chk_obj[i].checked==true){
				checked += 1;
				console.log(checked);
				$('.prd_count').text(checked);
			}
		}
		
		
	});
	
	
}











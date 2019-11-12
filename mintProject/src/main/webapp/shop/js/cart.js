/**
 * 191111
 * 한문희
 */

$(document).ready(function(){

	$(function() {
		console.log(memId);
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
			console.log("cart : "+cart);
			let $frag = $(document.createDocumentFragment());
			
			for (let i=0; i<cart.length; i++){
				const {
					id,
					productCode,
					ctCount,
					ctDateTime
				} = cart[i];
				
				let customCart = `
					<tr>
						<td><input type="checkbox" class="ico_check"></td>
						<td>상품이미지</td>
						<td>상품이름</td>
						<td>00</td>
						<td>상품금액</td>
						<td>X</td>
					</tr>
				`;
				$frag.append($(customCart));
			}
			$viewGoods.append($frag);
			console.log($viewGoods);
		}
		
	});
});
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
			console.log("$frag : "+$frag);
			for (let i=0; i<cart.length; i++){
				const {
					productCode,
					thumbNail,
					mainSubject,
					price,
					stock,
					discountRate
				} = cart[i];
				
				let customCart = `
					<tr>
						<td><input type="checkbox" class="ico_check"></td>
						<td>${thumbNail }</td>
						<td>${mainSubject }</td>
						<td>00</td>
						<td>${price }</td>
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
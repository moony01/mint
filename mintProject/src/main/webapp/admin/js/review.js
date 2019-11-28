/**
 * 191127
 * 홍소연(@hhhongso) 
 */

var html = '';
let $frag = $(document.createDocumentFragment());
function drawReview(data) {
	data.forEach(function(item){
		let review = `<tr class="subject_wrap" id="review_${item.seq}">
						<td><input type="checkbox" class="checkbox-one" value="${item.seq}"></td>
						<td>${item.seq}</td>
						<td style="cursor:pointer;">${item.subject}</td>
						<td>${item.id}</td>
						<td>${item.logtime}</td>
						<td><button type="button" class="btn btn-primary delBtn" data = "${item.seq}">선택 삭제</button></td>
					</tr>
					<tr class="content_wrap review_${item.seq}">
						<td colspan="6" style="text-align:left;">
						<img src="/mintProject/shop/storage/member/review/${item.imgName}" alt="" style="vertical-align:unset; width: 300px;">
						<pre style="background-color: #fff;">${item.content}</pre></td>
					</tr>`;
	
		$frag.append($(review));
	})
	$("#reviewArea").empty().append($frag);
	
	$('.content_wrap').hide();
	
	$('.subject_wrap').on({
		click : function(){
			var aaa = $(this).attr('id');
			$('.'+aaa).slideToggle();
		}
	})
	
	$(".delBtn").click(function(){
		if(confirm('정말 삭제하시겠습니까?')){
			var id = $(this).attr("data");
			$.ajax({
				method: "GET",
				type: 'json',
				dataType: "json",
				url: "/mintProject/api/review/delete?id=" + id,
				success:function(data) {
					getReview ();	
				}
			});
			
		}
	})
}


function getReview () {
	// /api/review
	$.ajax({
		method: "GET",
		type: 'json',
		dataType: "json",
		url: "/mintProject/api/review",
		success:function(data) {
			drawReview(data);  
		}
	});
}


//전체선택
$('.checkbox-all').on('change', function cbxChecked(){
	let cbxOne  = $('.checkbox-one');
	if(this.checked) {
		for (var i = 0; i < cbxOne.length; i++) {
			cbxOne.eq(i).prop('checked', true);
		}
	} else {
		for (var i = 0; i < cbxOne.length; i++) {
			cbxOne.eq(i).prop('checked', false);
		}
	}
	
});
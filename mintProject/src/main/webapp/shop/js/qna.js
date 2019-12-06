//삭제버튼 클릭 시 
function qnaDelete(seq) {
	swal({
		text : '정말로 삭제하시겠습니까?',
		icon : 'warning',
		showConfirmButton : true
	}).then(function(isConfirm){
		if(isConfirm) {
			$.ajax({
				type:'post',
				url:'/mintProject/qnaboard/qnaBoardDelete',
				data: {'seq' : seq},
				success: function(result){
					swal({
				    	text : '삭제 완료되었습니다.',
				    	buttons : false
				    }).then(function(){
				    	location.href='/mintProject/qnaboard/getQnaBoardList';
				    });
				},
				error: function(error){
					console.error(error);
				}
			});
		}
	});
}

(function() {
	const contents = document.querySelectorAll(".tb-content");
	const length = contents.length;

	for (let i = 0; i < length; i++) {
		contents[i].addEventListener("click", function() {
			const viewContent = contents[i].nextElementSibling;
			viewContent.classList.toggle("tb-on");

			const viewAnswer = viewContent.nextElementSibling;
			if (viewAnswer) {
				viewAnswer.classList.toggle("tb-on");
			}
		});
	}

})();

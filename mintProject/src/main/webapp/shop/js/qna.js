//삭제버튼 클릭 시 
function qnaDelete(seq) {
	alert(seq);
	if(confirm("정말 삭제할거야??")){
		$.ajax({
			type : "post",
			url : "/mintProject/qnaboard/qnaBoardDelete",
			data : {'seq' : seq},
			success : function(){
				location.href = "/mintProject/qnaboard/getQnaBoardList";
				alert("삭제 완료!");
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	
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

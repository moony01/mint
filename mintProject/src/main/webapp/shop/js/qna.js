const contents = document.querySelectorAll(".tb-content");
const length = contents.length;

for(let i=0; i<length; i++){
    
    contents[i].addEventListener("click",function(){
        const viewContent = contents[i].nextElementSibling;
        console.log(viewContent);
        viewContent.classList.toggle("tb-on");
        
        const viewAnswer = viewContent.nextElementSibling;
        if(viewAnswer){
            viewAnswer.classList.toggle("tb-on");
        }
    });
}

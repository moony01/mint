(function(){
    const contents = document.querySelectorAll(".tb-conent");
    const length = content.length;

    for(let i=0; i<length; i++){
        contents[i].addEventListener("click",function(){
            const view = contents[i].nextElementSibling;
            
            view.classList.toggle("tb-on")
        })    
    }

})()
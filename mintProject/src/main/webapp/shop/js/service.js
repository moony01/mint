window.onload = function(){
    const td = document.querySelector(".tb-content");
    const c = td.children[2];
    console.log(c);
    
    const view = document.querySelector(".tb-view");
    console.log(view.style);
    
    c.addEventListener("click",function(){
        view.classList.toggle("tb-on");
    });
}
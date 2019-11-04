
window.addEventListener("scroll",function(){
    const scrollTop = document.documentElement.scrollTop;
    const gnb = document.querySelector(".gnb");
    if(scrollTop>140){
        gnb.classList.add("fixed");
    }else{
        gnb.classList.remove("fixed");
    }
});

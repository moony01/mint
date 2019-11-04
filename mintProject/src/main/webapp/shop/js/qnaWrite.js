(function(){
    const orders = document.querySelector(".orders");
    const closeBtn = document.querySelector(".orders-close");
    const orderBtn = document.querySelector("#orderBtn");
    const orderTxt = document.querySelector("#orderTxt");
    const ordersList = document.querySelectorAll(".orders__list");
    const ordersListLength = ordersList.length;

    orderBtn.addEventListener("click",function(){    
        orders.style.display="block";
    })

    closeBtn.addEventListener("click",function(){
        orders.style.display="none";
    });


    for(let i=0; i<ordersListLength; i++){
        ordersList[i].addEventListener("click",function(){
            const orderNum = ordersList[i].querySelectorAll("td")[0].innerText;
            orderTxt.value = orderNum;
            orders.style.display="none";
        });
    }

})()
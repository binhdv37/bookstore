// let item = document.getElementsByClassName("ctm-item");
let checkbox = document.getElementsByClassName("ctm-checkbox");
let price = document.getElementsByClassName("ctm-price");
let quantity = document.getElementsByClassName("ctm-quantity");
let totalprice = document.getElementsByClassName("ctm-totalprice");
// let hr = document.getElementsByClassName("ctm-hr");
let bookid = document.getElementsByClassName("ctm-bookid");
let total = document.getElementById("total");

//plus button event :
function plus(pos, bookid){
    /*
        - send ajax request : plus?book=bookid
        - quantity += 1
        - totalprice[pos] += price[pos]
        - checkbox.ischeck => total += price;
    */
    //send ajax request :
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", "addtocart?book="+bookid, true);
    xhttp.send();

    //change quantity
    quantity[pos].innerHTML = Number(quantity[pos].innerHTML) + 1;

    //change total price :
    totalprice[pos].innerHTML = Number(totalprice[pos].innerHTML) + Number(price[pos].innerHTML);

    //check if checkbox is checked
    if(checkbox[pos].checked)
        total.value = Number(total.value) + Number(price[pos].innerHTML);
}


//minus button event :
function minus(pos, bookid){
    /*
        - if(quantity<=1) => return
        - else :
            + send ajax request to server : minus?book=bookid
            + quantity -= 1
            + total price -= price
            + if(ischeck) => total -= price
    */
    if(Number(quantity[pos].innerHTML) <= 1) return;

    //send ajax request :
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", "minus?book="+bookid, true);
    xhttp.send();

    //change quantity :
    quantity[pos].innerHTML = Number(quantity[pos].innerHTML) - 1;

    //change total price :
    totalprice[pos].innerHTML = Number(totalprice[pos].innerHTML) - Number(price[pos].innerHTML);

    //change total if checked :
    if(checkbox[pos].checked) total.value = Number(total.value) - Number(price[pos].innerHTML);
}


//checkbox event :
function check(pos){
    /*
        - if ischeck==true => total += totalprice
        - else => total -= totalprice
    */
    if(checkbox[pos].checked)
        total.value = Number(total.value) + Number(totalprice[pos].innerHTML);
    else
        total.value = Number(total.value) - Number(totalprice[pos].innerHTML);
}


//delete button event :
function deleteItem(pos, bookid){
    /*
        - confirm : delete?
        - false=> return
        - true :
            - send ajax request to server : delete?book=bookid
            - reload page;
    */

    if(!window.confirm("Delete item ?")) return;

    //send ajax request :
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
            window.alert("Delete item successfully");
            window.setTimeout(function () {
                window.location.href = "shoppingcart";
                },500);
        }
    };
    xhttp.open("GET", "delete?book="+bookid, true);
    xhttp.send();

}


//purchase button event :
function purchase(){
    /*
        - check if at least 1 check box is checked
        - false => alert plz choose at least 1
        - true
            - send ajax : purchase?book=bookid
            - response ok => alert thanh cong., reload page
    */

    if(!window.confirm("Buy all choosen item ?")) return;

    let flag = false;
    for(let i=0 ; i<checkbox.length; i++){
        if(checkbox[i].checked){
            flag = true;
            //send ajax request :
            let xhttp = new XMLHttpRequest();
            xhttp.open("GET", "purchase?book="+bookid[i].innerHTML, true);
            xhttp.send();
        }
    }

    if(flag){
        window.alert("Success!!");
        window.location.href = "shoppingcart";
    }
    else{
        window.alert("Please choose at least 1 item!");
    }


}
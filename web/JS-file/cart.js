function deleteFromCart(id){
    if(id !== undefined && id !== null){
        var url = "http://" + window.location.host + window.location.pathname;
        window.location.href = (url + "?" + "delete=" + id);
    }
}

function calc(price, name, beanId, form) {
    var pri = parseInt(price);
    var strUser = form.value;
    var count = parseInt(strUser);
    if (isNaN(count) || isNaN(pri)) {
        return;
    }
    if (count > 20) {
        form.value = 20;
        count = 20
    }
    if (count < 1) {
        form.value = 1;
        count = 1
    }
    if (price < 1) {
        price = 1;
    }
    var res = pri * count;
    document.getElementById(name + beanId).innerHTML = res;
    calcSumm(name);

}
function calcSumm(prefix) {
    var allBeans = document.getElementById("allBeansList").innerHTML;
    var arr = allBeans.split(" ");
    var summary = 0;
    for (var i = 0; i < arr.length; i++) {
        var id = prefix + arr[i];
        var elem = document.getElementById(id);
        if (elem === undefined || elem === null) {
            continue;
        }
        var inh = elem.innerHTML;
        var value = parseInt(inh);
        if (!isNaN(value)) {
            summary += value;
        }
    }
    document.getElementById("cartTotal").innerHTML = summary;
}
function addToCart(id, element, onSuccessText) {
    var xhr = new XMLHttpRequest();

    var body = 'order=' + encodeURIComponent(id);

    xhr.open("POST", 'Cart', true)
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')

    xhr.onreadystatechange = function(){//когда произошли именения
        if(element !== undefined || element !== null) {
            element.innerHTML = onSuccessText;
        }
    };
    xhr.send(body);
}

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
        vars[key] = value;
    });
    return vars;
}
function itemsChanged() {
    var l = getUrlVars()["lang"];

    var value = document.getElementsByTagName('select')[0].value;
    var params = '?value=' + value;
    if (undefined !== l && l !== null) {
        params += "&lang=" + l;
    }
    window.location = params
}

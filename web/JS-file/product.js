function addToCart(id, element, onSuccessText) {
    var xhr = new XMLHttpRequest();

    var body = 'order=' + encodeURIComponent(id);

    xhr.open("POST", 'Cart', true)
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')

    xhr.onreadystatechange = function(){
        if(element !== undefined || element !== null) {
            element.innerHTML = onSuccessText;
        }
    };
    xhr.send(body);
}


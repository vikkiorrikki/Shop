/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function loadActiveTab() {
    var xhr = new XMLHttpRequest();

    xhr.open("POST", 'Servlet1', true)
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    xhr.onreadystatechange = function(){
        document.getElementById("activeTab").innerHTML = xhr.responseText;
    };
    xhr.send("body");
}


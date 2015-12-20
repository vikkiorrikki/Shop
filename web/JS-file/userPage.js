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
    ajaxRequest();
}

function ajaxRequest() {
    var xmlhttp = null;
    if (window.XMLHttpRequest){
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200){
            document.getElementById("commentText").value = "";
            var text = xmlhttp.responseText;
            document.getElementById("RESULT").innerHTML = text;
        }
    };
    var text = document.getElementById("commentText").value;
    var param = "";
    if(text !== null && text !== undefined && text !== ""){
        param = "text=" + text;
    }
    xmlhttp.open("POST", "/Shop/comments?" + param, true);
    xmlhttp.send();
}


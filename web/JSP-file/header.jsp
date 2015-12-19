<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)===' ') c = c.substring(1);
        if (c.indexOf(name) === 0) return c.substring(name.length, c.length);
    }
    return "";
}

function checkCookie() {
    var user = getCookie("username");
    if (user !== "") {
        alert("Welcome again " + user);
    } else {
        user = prompt("Please enter your name:", "");
        if (user !== "" && user !== null) {
            setCookie("username", user, 365);
        }
    }
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? null : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function onHeaderLoad() {
    var lang = getParameterByName("lang");
    if(lang !== null){
        setCookie("lang", lang, 1);
    }
}
        </script> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
            <style type="text/css">
                A {
                 text-decoration: none; /* Убирает подчеркивание для ссылок */
                } 
                A:hover { 
                 text-decoration: underline; /* Добавляем подчеркивание при наведении курсора на ссылку */
                 color: red; /* Ссылка красного цвета */
                } 
            </style>
            
    </head>
    <body onload='onHeaderLoad()'>   
        <%
            Cookie[] cookies = request.getCookies();
            String lang = request.getParameter("lang");
            ResourceBundle resourceBundle= null;
            if(lang == null || lang.isEmpty()){
                if (cookies != null) {
                    for (Cookie item : cookies) {
                        if (item.getName().equals("lang")) {
                            lang = item.getValue();
                            if((lang == null)){
                                lang = "RU";
                            }
                            break;
                        }
                    }
                } else {
                    lang = "RU";
                }
            }
            if (lang.equals("ENG")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_en_US", Locale.US);
            } else if (lang.equals("IT")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_it_IT", Locale.ITALY);
            } else {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
            } 
            String url1 = "/Shop/?lang=" + lang;
            String url2 = "/Shop/Cart?lang=" + lang;
            String url3 = "";
            String button3Name = "Login";
            String name = null;
            if(request.getUserPrincipal() != null) {
                name = request.getUserPrincipal().getName();
                session.setAttribute("userName", name);
            } else {
                session.setAttribute("userName", "");
            }
            if(name != null && !name.isEmpty()){
                url3 += "logout";
                button3Name = "Logout";
            } else {
                url3 += "enterToProducts?lang=" + lang;
                button3Name = "Login";
            }
            String nameForLabel = (name != null && !name.isEmpty()) 
                    ? resourceBundle.getString("UserNameHeaderLabel") + ":" + name
                    : "";
            String urlForUser = "/Shop/userPage?lang=" + lang;
        %>
        
        <div style='width: 100%;
                    height: 80px;
                    background-color: #deedfb'>
            <p><a href='<%= url1%>'><font color='black' face='Calibri' size='350%'> HandBag </font></a>
                <button style='float: right'><%=resourceBundle.getString("List")%></button>
                <a onclick="window.location.href='<%= url2%>'">
                    <button style='float: right'>
                        <%=resourceBundle.getString("Bag")%>
                    </button>
                </a>
                        
                <a onclick="window.location.href='<%= url3%>'">
                    <button style='float: right'>
                        <%=resourceBundle.getString(button3Name)%>
                    </button>
                </a>
                    <a onclick="window.location.href='<%= urlForUser%>'" style="float:right; size: 10pt">
                        <font color='black' face='Calibri' >
                        <%=nameForLabel%>
                        </font>
                    </a>
            </p>
                <form method=GET action='' style='float: right'>                        
                    <input name='lang' type='submit' value='RU' style='float: right'/><br>
                    <input name='lang' type='submit' value='ENG' style='float: right'/><br>
                    <input name='lang' type='submit' value='IT' style='float: right'/>
                </form>
        </div>
    </body>
</html>

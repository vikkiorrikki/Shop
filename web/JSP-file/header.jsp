<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html>
<html>
    <head>
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
    <body>   
        <%
            Cookie[] cookies = request.getCookies();
            String lang = request.getParameter("lang");
            ResourceBundle resourceBundle= ResourceBundle.getBundle("LocaleFiles.Text", request.getLocale());
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
            if ((lang.equals("RU"))){
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
            } else if (lang.equals("ENG")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_en_US", Locale.US);
            } else if (lang.equals("IT")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_it_IT", Locale.ITALY);
            } 
            String url1 = "http://localhost:8080/Shop/?lang=" + lang;
            String url2 = "http://localhost:8080/Shop/Cart?lang=" + lang;
        %>
        
        <div style='width: 100%;
                    height: 80px;
                    background-color: #deedfb'>
            <p><a href='<%= url1%>'><font color='black' face='Calibri' size='350%'> HandBag </font></a>
                <button style='float: right'><%=resourceBundle.getString("List")%></button>
                <a onclick="window.location.href='<%= url2%>'">
                    <button style='float: right'><%=resourceBundle.getString("Bag")%></button></a>
                <button style='float: right'><%=resourceBundle.getString("Login")%></button>
                
                
            </p>
                <form method=GET action='' style='float: right'>                        
                    <input name='lang' type='submit' value='RU' style='float: right'/><br>
                    <input name='lang' type='submit' value='ENG' style='float: right'/><br>
                    <input name='lang' type='submit' value='IT' style='float: right'/>
                </form>
        </div>
    </body>
</html>

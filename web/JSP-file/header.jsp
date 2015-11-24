<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head>
    <body>   
        <%
            Cookie[] cookies = request.getCookies();
            String optForL = request.getParameter("optForL");
            ResourceBundle resourceBundle= ResourceBundle.getBundle("LocaleFiles.Text", request.getLocale());
            if(optForL == null || optForL.isEmpty()){
                if (cookies != null) {
                    for (Cookie item : cookies) {
                        if (item.getName().equals("optForL")) {
                            optForL = item.getValue();
                            if((optForL == null)){
                                optForL = "RU";
                            }
                            break;
                        }
                    }
                } else {
                    optForL = "RU";
                }
            }
            if ((optForL.equals("RU"))){
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
            } else if (optForL.equals("ENG")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_en_US", Locale.US);
            } else if (optForL.equals("IT")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_it_IT", Locale.ITALY);
            } 
            
        %>
        
        <div style='width: 100%;
                    height: 80px;
                    background-color: #deedfb'>
            <p><font color='black' face='Calibri' size='350%'> HandBag </font>
                <button style='float: right'><%=resourceBundle.getString("List")%></button>
                <a onclick="window.location.href='/Shop/JSP-file/cart.jsp?product=<%=request.getParameter("productId")%>'"><button style='float: right'><%=resourceBundle.getString("Bag")%></button></a>
                <button style='float: right'><%=resourceBundle.getString("Login")%></button>
            </p>
                <form method=GET action='' style='float: right'>                        
                    <input name='optForL' type='submit' value='RU' style='float: right'/><br>
                    <input name='optForL' type='submit' value='ENG' style='float: right'/><br>
                    <input name='optForL' type='submit' value='IT' style='float: right'/>
                </form>
        </div>
 
    </body>
</html>

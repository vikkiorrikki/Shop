<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<!DOCTYPE html>
<%
    Cookie[] cookies = request.getCookies();
    String lang = request.getParameter("lang");
    ResourceBundle resourceBundle = null;
    if (lang == null || lang.isEmpty()) {
        if (cookies != null) {
            for (Cookie item : cookies) {
                if (item.getName().equals("lang")) {
                    lang = item.getValue();
                    if ((lang == null)) {
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
    String urlForButtonToCabinet = "/Shop/userPageWithHistory?lang=" + lang;
    String urlToCart = "/Shop/Cart?lang=" + lang;
    String urlForLogginButton = "/Shop";
    String buttonForLoginText = "Login";
    String name = null;
    if (request.getUserPrincipal() != null) {
        name = request.getUserPrincipal().getName();
        session.setAttribute("userName", name);
    } else {
        session.setAttribute("userName", "");
    }
    if (name != null && !name.isEmpty()) {
        urlForLogginButton += "/logout";
        buttonForLoginText = "Logout";
    } else {
        urlForLogginButton += "/enterToProducts?lang=" + lang;
        buttonForLoginText = "Login";
    }
    String nameForLabel = (name != null && !name.isEmpty())
            ? resourceBundle.getString("UserNameHeaderLabel") + ":" + name
            : "";
    String urlForUser = "/Shop/userPageWithHistory?lang=" + lang;
%>

<div style='width: 100%;
     height: 100px;
     background-color: #deedfb'>
    <p>
        <a onclick="window.location.href = '/Shop'">
            <font color='black' face='Calibri' size='350%'> HandBag </font>
        </a>

        <a href='<%= urlForButtonToCabinet%>'>
            <button style='float: right'><%=resourceBundle.getString("List")%></button>
        </a>
        <a onclick="window.location.href = '<%= urlToCart%>'">
        <button style='float: right'>
            <%=resourceBundle.getString("Bag")%>
        </button>
        </a>
        <a onclick="window.location.href = '<%= urlForLogginButton%>'">
            <button style='float: right'>
                <%=resourceBundle.getString(buttonForLoginText)%>
            </button>
        </a>
        <a onclick="window.location.href = '<%= urlForUser%>'" style="float:right; size: 10pt">
            <font color='black' face='Calibri' >
            <%=nameForLabel%>
            </font>
        </a>
        <div class="currentTime" id="currentTime">
            
        </div>
    </p>
    <form method=GET action='' style='float: right'>                        
        <input name='lang' type='submit' value='RU' style='float: right'/><br>
        <input name='lang' type='submit' value='ENG' style='float: right'/><br>
        <input name='lang' type='submit' value='IT' style='float: right'/>
    </form>
</div>


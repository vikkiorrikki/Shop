<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Serializable"%>
<%@page import="Bean.ProductBean"%>
<%@page import="Bean.TypeF"%>
<%@page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html>
        <%
            Cookie[] cookies = request.getCookies();
            String lang = request.getParameter("lang");
            ResourceBundle resourceBundle = null;
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
            } else{
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
            }
            String url1 = "http://localhost:8080/Shop/Servlet1?lang=" + lang;
            String pid = request.getParameter("productId");
            if(pid != null && !pid.isEmpty()){
                url1 += "&id=" + pid;
            }
        %>
<div>
    <div id="left-mini" style="width: 40%; height: 100%; float: left">
        <a href='<%= url1%>' ><font color='black' size='4pt' face='Calibri'> <%=request.getParameter("nameBag")%></font></a>
        <p><img src='<%=request.getParameter("productImage")%>' alt='Photo' width="250" height="175"></p></div>
            
    <div id="right-mini" style='width: 60%; height: 100%; float: left'> 
        <p style="color: red; font-weight: lighter; font-size: 15pt">EUR <%=request.getParameter("price")%></p>
        <p><font color='black' size='3pt' face='Calibri'><%=request.getParameter("description1")%></font></p>
        <p><font color='black' size='3pt' face='Calibri'><%=request.getParameter("description2")%></font></p>
        <p><font color='black' size='3pt' face='Calibri'><%=request.getParameter("description3")%></font></p>
        <p><font color='black' size='3pt' face='Calibri'><%=request.getParameter("description4")%></font></p> 
        <p style='text-align: left'>
            <button onclick="addToCart('<%=request.getParameter("productId")%>', this, '<%=resourceBundle.getString("AddToCart")%>')">
                <%=resourceBundle.getString("Buy")%>
            </button>
        </p>
    </div>
</div>



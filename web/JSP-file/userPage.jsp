<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
         <script type="text/javascript">
            <c:import url="/JS-file/userPage.js" />
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${resources.UserNameHeaderLabel}</title>
    </head>

    <body onload='loadActiveTab()'>
        
        <div>
        <%
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
        %>
       

        <fmt:setBundle basename="myprop" />

        <c:import url="/JSP-file/header.jsp" />
        
        <div id="left-mini" style="width:20%; height: 100%; float: left">
            <p>
                <font face='Calibri'>
                    <big><big><b><label><fmt:message key="userNameLable" /></label></b></big></big>
                    <big><big><b><label style="font-style: italic"><c:out value="${ sessionScope.userName }"></c:out></label></b></big></big>
                </font>
            </p>
            <img src="IMG-file/noavatar.jpg"  />
        </div>
        
        <div id="right-mini" style='width: 60%; height: 100%; float: left'> 
            <br><br>
            <p>
                <font face='Calibri'>
                    <label><fmt:message key="activeTabeLable" />:</label>
                    <label id="activeTab"></label>
                </font>
            </p>
        </div>
    </div>

    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="/JSP-file/header.jsp" />
        <c:if test = "${cookie.lang.value eq 'ENG' }">
            <fmt:setLocale value="ENG" />
            <fmt:setBundle basename="myprop_en_US" var="pageLang"/>
        </c:if>
        <c:if test="${cookie.lang.value == 'IT' }">
            <fmt:setLocale value="IT" />
            <fmt:setBundle basename="myprop_it_IT" var="pageLang"/>
        </c:if>
        <c:if test="${ cookie.lang.value eq  'RU' }">
            <fmt:setLocale value="RU" />
            <fmt:setBundle basename="myprop" var="pageLang"/>
        </c:if>
        
        <c:if test = "${param.lang eq 'ENG' }">    
            <fmt:setLocale value="ENG" />
            <fmt:setBundle basename="myprop_en_US" var="pageLang"/>
        </c:if>
        <c:if test="${param.lang == 'IT' }">
            <fmt:setLocale value="IT" />
            <fmt:setBundle basename="myprop_it_IT" var="pageLang" />
        </c:if>
        <c:if test="${param.lang eq  'RU' }">
            <fmt:setLocale value="RU" />
            <fmt:setBundle basename="myprop" var="pageLang"/>
        </c:if>
        <title>Authentification fail!</title>
        
    </head>
    <body>
        <div class="welcome">
            <center>
                <font color='red' face='Calibri' ><big><big><big><fmt:message key="loginError" bundle="${pageLang}"/></big></big></big></font>
            </center>
        </div>

        <div class="failMessage" >
            <br>
            <hr>
            <p> <a href="login"><font color='black' face='Calibri' ><b><fmt:message key="again" bundle="${pageLang}"/></b></font></a></p>
        </div>

    </body>
</html>
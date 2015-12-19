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
            <c:set var="lang" value="ENG" />
            <fmt:setBundle basename="myprop_en_US" var="pageLang"/>
        </c:if>
        <c:if test="${cookie.lang.value == 'IT' }">
            <fmt:setLocale value="IT" />
            <c:set var="lang" value="IT" />
            <fmt:setBundle basename="myprop_it_IT" var="pageLang"/>
        </c:if>
        <c:if test="${ cookie.lang.value eq  'RU' }">
            <fmt:setLocale value="RU" />
            <c:set var="lang" value="RU" />
            <fmt:setBundle basename="myprop" var="pageLang"/>
        </c:if>
        
        <c:if test = "${param.lang eq 'ENG' }">    
            <fmt:setLocale value="ENG" />
            <c:set var="lang" value="ENG" />
            <fmt:setBundle basename="myprop_en_US" var="pageLang"/>
        </c:if>
        <c:if test="${param.lang == 'IT' }">
            <fmt:setLocale value="IT" />
            <c:set var="lang" value="IT" />
            <fmt:setBundle basename="myprop_it_IT" var="pageLang" />
        </c:if>
        <c:if test="${param.lang eq  'RU' }">
            <fmt:setLocale value="RU" />
            <c:set var="lang" value="RU" />
            <fmt:setBundle basename="myprop" var="pageLang"/>
        </c:if>
        
        <title><fmt:message key="Login" bundle="${pageLang}"/></title>

    </head>
    <body>
       
        
        <div class="welcome">
            <center>
                <font color='red' face='Calibri' ><big><big><big>
                                <fmt:message key="welcome" bundle="${pageLang}"/>
                </big></big></big></font>
            </center>
        </div>

        <div class="loginForm">
            <br>
            <hr>
            <form action="j_security_check" method="post" >
                <input type="text" name="j_username" size="25" > <br><br>
                <input type="password" name="j_password" size="25" > <br>
                <input type="hidden" name="lang" value="${ lang }" >
                <input class="authButton" type="submit" value="<fmt:message key="AuthEnter" bundle="${pageLang}"/>">
            </form>

        </div>

    </body>
</html>
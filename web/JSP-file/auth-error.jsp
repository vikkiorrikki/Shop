<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentification fail!</title>

    </head>
    <body>
        <c:import url="/JSP-file/header.jsp" />

        <c:if test="${ empty sessionScope.lang } ">
            <fmt:setLocale value="RU" />
        </c:if>

        <c:if test="${ param.lang eq 'RU' ||  sessionScope.lang eq 'RU'}">
            <fmt:setLocale value="RU"/>
            <c:set var="lang" value="${ param.lang }" scope="session" />  
        </c:if>
        <c:if test="${ param.lang eq 'ENG' ||  sessionScope.lang eq 'ENG' }">
            <fmt:setLocale value="ENG"/>
            <c:set var="lang" value="${ param.lang }" scope="session" />
        </c:if>
        <c:if test="${ param.lang eq 'IT' ||  sessionScope.lang eq 'IT' }">
            <fmt:setLocale value="IT"/>
            <c:set var="lang" value="${ param.lang }" scope="session" />
        </c:if>

        <fmt:setBundle basename="myprop" />

        <div class="welcome">
            <center>
                <font color='red' face='Calibri' ><big><big><big><fmt:message key="loginError"/></big></big></big></font>
            </center>
        </div>

        <div class="failMessage" >
            <br>
            <hr>
            <p> <a href="login"><font color='black' face='Calibri' ><b><fmt:message key="again"/></b></font></a></p>
        </div>

    </body>
</html>
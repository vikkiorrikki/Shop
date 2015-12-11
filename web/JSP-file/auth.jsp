<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="${resources.Login}" /></title>

    </head>
    <body>
        <c:import url="/JSP-file/header.jsp" />
        <c:if test="${ param.lang eq 'RU' ||  sessionScope.lang eq 'RU'}">
            <fmt:setLocale value="RU"/>

        </c:if>
        <c:if test="${ param.lang eq 'ENG' ||  sessionScope.lang eq 'ENG' }">
            <fmt:setLocale value="ENG"/>

        </c:if>
        <c:if test="${ param.lang eq 'IT' ||  sessionScope.lang eq 'IT' }">
            <fmt:setLocale value="IT"/>

        </c:if>
            
        <fmt:setBundle basename="myprop" />
        
        <div class="welcome">
            <center>
                <font color='red' face='Calibri' ><big><big><big>
                                <fmt:message key="welcome"/>
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
                <input class="authButton" type="submit" value="<fmt:message key="AuthEnter"/>">
            </form>

        </div>

    </body>
</html>
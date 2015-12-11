<%-- 
    Document   : lang
    Created on : 29.11.2015, 12:43:52
    Author     : Vikki
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${ param.lang eq 'RU' }">
    <c:set var="lang" value="${ param.lang }" scope="session" />  
</c:if>
<c:if test="${ param.lang eq 'ENG' }">
    <c:set var="lang" value="${ param.lang }" scope="session" />
</c:if>
<c:if test="${ param.lang eq 'IT' }">
    <c:set var="lang" value="${ param.lang }" scope="session" />
</c:if>

<c:if test="${ cookie['lang'].value eq 'IT' }">
    <c:set var="lang" value="IT" scope="session" />
</c:if>
<c:if test="${ cookie['lang'].value eq 'RU' }">
    <c:set var="lang" value="RU" scope="session" />
</c:if>
<c:if test="${ cookie['lang'].value eq 'ENG' }">
    <c:set var="lang" value="ENG" scope="session" />
</c:if>

<c:if test="${ sessionScope.lang eq 'IT' }">
    <fmt:setLocale value="IT"/>
</c:if>
<c:if test="${ sessionScope.lang eq 'RU' }">
    <fmt:setLocale value="RU"/>
</c:if>
<c:if test="${ sessionScope.lang eq 'ENG' }">
    <fmt:setLocale value="ENG"/>
</c:if>
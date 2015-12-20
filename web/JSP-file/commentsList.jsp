<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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

<c:forEach var="a" items="${sessionScope.comments}" >
    <div class="oneComment" >
        <label class="profileNameCommentsLable"><fmt:message key="profileName" /></label>
        <label class="profileNameComments">${a.username}</label>
        <label class="textComment">${a.text}</label>
    </div>
</c:forEach>  

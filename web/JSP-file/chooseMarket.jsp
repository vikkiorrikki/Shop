<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose market</title>
<!--        <script type="text/javascript"
                src="http://maps.google.com/maps/api/js?sensor=false">
        </script>-->
        <script type="text/javascript">
            <c:import url="/JS-file/chooseMarket.js" />
            <c:import url="/JS-file/header.js" />
        </script>
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
    </head>

    <body >

        <div class="chooseHeader">
            <h1><fmt:message key="marketChoose" bundle="${pageLang}"/></h1>
        </div>

        <c:set var="orderderedProducts" value="${ sessionScope.orderderedProducts }"  />
        <div id="map" style="width: 400px; height: 400px; display: inline-block;"></div> 
        <!--<div id='map' ></div>-->

        <%
            System.out.println("delivery.jsp: request[" + request.getParameter("lang") + "], session[" + (String) session.getAttribute("lang") + "]\n");

        %>
        <div class="market" class="market">
            <fmt:message key="shopAddress" bundle="${pageLang}"/>:
            <form action="buy" >
                <input type="text" id="1" size="50" name="store" onchange="checkAddress()" /> 
                <input type="hidden" name="lang" value="${ sessionScope.lang }" />  
                <c:forEach var="pageParameter" items="${param}">
                    <input type="hidden" name="${pageParameter.key}" value="${pageParameter.value}" />  
                </c:forEach>
                <input type="submit" onclick="checkAddress()" value="ok">
            </form>                                       
        </div>
        <script async defer
      src="https://maps.googleapis.com/maps/api/js?callback=initialize">
    </script>
    </body>
</html>
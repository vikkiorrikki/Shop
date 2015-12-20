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
        <jsp:useBean id="productBean" class="Bean.ProductBean" scope="session"/>        
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
        <div class="deliveryHistory">
            
            <c:forEach var="a" items="${sessionScope.history}">
                <c:forEach var="item" items="${a.list}">
                    <%
                        System.out.println(pageContext.getAttribute("item"));
                    %>
                    <jsp:setProperty name="productBean" property="lang" value="${lang}"/>
                    <jsp:setProperty name="productBean" property="productId" value="${item.beanId}"/>
                    <div class="profileOrder">
                        <a href="${pageContext.request.contextPath}/product?id=${item.beanId}">
                            <img src='IMG-file/<jsp:getProperty name="productBean" property="productImage"/>' 
                                 width=40 height=40 />
                        </a>
                    </div>
                    <a class="profileProductItem" href='${pageContext.request.contextPath}/product?id=${item.beanId}'>
                        <jsp:getProperty name="productBean" property ="nameBag"/>
                    </a>
                    <lable>Count:</lable>
                    <lable>${item.count}</lable>
                </c:forEach>
                <div class="profileDate">${a.timestamp}</div>
                <div class="profileAddress">
                    <label class="addressLable"><fmt:message key="shopAddress" />:</label>
                    <label class="address">${a.store}</label>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
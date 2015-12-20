<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE>
<html>
    <head>
        <script type="text/javascript">
            <c:import url="/JS-file/cart.js" />
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${resources.Bag}</title>
    </head>

    <body onload='calcSumm("summ_")'>
        <div>
            <div id="header">
                <c:import url="/JSP-file/header.jsp" />
            </div>
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
            <c:set var="lang" value="${lang}" scope="session"  />
            <div id="left" style='width:  90%; height: 40%; float: left'>
                <fmt:setBundle basename="myprop" />
                <c:set var="allBeans" value="" />
                <c:set var="orderderedProducts" value="${ sessionScope.orderderedProducts }" />
                <c:forEach var="entry" items="${beans}">
                    <c:set var="bean" value="${entry.value}"/>
                    <c:set var="allBeans" value='${allBeans} ${bean.productId}' />
                    <c:import url="/JSP-file/productCart.jsp">
                        <c:param name="nameBag"    value="${ bean.nameBag }" />
                        <c:param name="productId"    value="${ bean.productId }" />
                        <c:param name="productImage"    value="${ bean.productImage }" />
                        <c:param name="price"     value="${ bean.price }" />
                        <c:param name="description1" value="${ bean.description1 }" />
                        <c:param name="description2" value="${ bean.description2 }" />
                        <c:param name="description3"  value="${ bean.description3 }" />
                        <c:param name="description4"  value="${ bean.description4 }" />
                        <c:param name="type" value="${ bean.groupOfProduct }" />
                    </c:import>
                </c:forEach>
            <p id="allBeansList" hidden >${allBeans}</p>
            
                <c:set var="userName" value="${ sessionScope.userName }" />
                <c:if test="${not empty allBeans }">
                    <label>${resources.FinalPrice}:</label>
                    <p>
                    <label id="cartTotal" style='color: red'>0</label>
                    <p>
                    <label>${resources.ForOrder} </label>
                    <c:if test="${empty userName }">
                        <a onclick="window.location.href='enterToCart'">
                            <button>${resources.AuthBuy}</button>
                            </a>
                    </c:if>
                    <c:if test="${not empty userName }">
                        <button onclick="goToTheMarkets('count_')">${resources.OrderInCart}</button>
                    </c:if>
                </c:if>
                <c:if test="${empty allBeans }">
                    <label>${resources.emptyCart} </label>
                    <p>
                    <label>${resources.ForOrder} </label>
                    <a onclick="window.location.href='productList'">
                    <button>${resources.chooseProducts}</button>
                    </a>
                </c:if>
            </p>

            </div>    
        </div>
    </body>
</html>
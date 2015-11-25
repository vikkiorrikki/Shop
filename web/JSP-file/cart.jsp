<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <script type="text/javascript">
            <c:import url="/JS-file/cart.js" />
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>

    <body onload='calcSumm("summ_")'>
        <div class='cartPage'>
            <c:import url="/JSP-file/header.jsp" />
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
            
            <div class="cartAllTotal">
                <label>${resources.FinalPrice}:</label>
                <label id="cartTotal">0</label>
                <!--<button class="cartButtonBuy">${resources.NotAuthBuy}</button>-->
                <!--<button>${resources.AuthBuy}</button>-->
            </div>
        </div>

    </body>
</html>
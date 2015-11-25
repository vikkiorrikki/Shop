<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="nameBag"    value="${ param.nameBag }" />
<c:set var="beanId"    value="${ param.productId }" />
<c:set var="productImage"    value="${ param.productImage }" />
<c:set var="price"     value="${ param.price }" />
<c:set var="description1" value="${ param.description1 }" />
<c:set var="description2" value="${ param.description2 }" />
<c:set var="description3"  value="${ param.description3 }" />
<c:set var="description4"  value="${ param.description4 }" />
<c:set var="type" value="${ param.type }" />


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

<div class="cartelem" >
    <div class="cartproductImg" > 
        <img src="${ ProductImage }" height=100 width=100 />
        <a href="Servlet1?id=${ beanId }" > </a>
    </div>

    <div class="cartelementProductName">

        <a class="cartelementLink" href='${pageContext.request.contextPath}/Servlet1?id="${beanId}"'>
            <c:out value="${ nameBag }" />
        </a>
    </div>

    <div class="cartelementProductProperties" >
        <c:out value="${ description1 }" />
    </div>

    <div class="cartproductPriceAndButton">
        <div class="cartproductPrice">
            <c:out value=" ${ price }" />
        </div>
        <form>
            <label>
                ${resources.CartProductCount}:
                <input type="number" min="1" max="20" 
                       size="5" value="1" onchange="calc('${ price }', 'summ_', '${beanId}', this)">
            </label>
           <label>${resources.FinalPrice}:</label>
           <label id="summ_${beanId}">
               ${price}
           </label>
         </form>
        <div class="cartDeleteButton">
            <button onclick="deleteFromCart('${beanId}')" >${resources.DeleteFromCartButton}</button>
        </div>
    </div>

</div>

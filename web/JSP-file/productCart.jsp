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

<div>
    <div id="left-mini" style="width: 40%; height: 100%; float: left">
        <a href='${pageContext.request.contextPath}/Servlet1?lang=${param.lang}&id=${beanId}'>
            <font color='black' size='4pt' face='Calibri'><c:out value="${ nameBag }" /></font>
        </a>
        <p><img src="IMG-file/${ productImage }" alt='Photo' width="250" height="175" /></p>
        <a href="Servlet1?id=${ beanId }" > </a>
    </div>
 
    <div id="right-mini" style='width: 30%; height: 100%; float: left'>
        <p style="color: red; font-weight: lighter; font-size: 15pt"><c:out value="EUR ${ price }" /></p>
        <p><font color='black' size='2pt' face='Calibri'><c:out value="${ description1 }" /></font></p>
        <p><font color='black' size='2pt' face='Calibri'><c:out value="${ description2 }" /></font></p>
        <p><font color='black' size='2pt' face='Calibri'><c:out value="${ description3 }" /></font></p>
        <p><font color='black' size='2pt' face='Calibri'><c:out value="${ description4 }" /></font></p>
    </div>

    <div id="right-mini" style='width: 30%; height: 100%; float: left'>    
        <form>
            <label><font color='black' size='3pt' face='Calibri'>
                ${resources.CartProductCount}:</font>
                <input type="number" min="1" max="20" 
                       size="5" value="1" onchange="calc('${ price }', 'summ_', '${beanId}', this)">
            </label>
            <p><label><font color='black' size='3pt' face='Calibri'>${resources.FinalPrice}:</font></label>
            <label id="summ_${beanId}" style='color: red'>
                 ${price}
            </label></p>
        </form>
            
        <div>
            <button onclick="deleteFromCart('${beanId}')" >${resources.DeleteFromCartButton}</button>
        </div>
    </div>

</div>

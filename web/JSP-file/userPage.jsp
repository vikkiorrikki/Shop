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
                <c:import url="/JS-file/header.js" />
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

    <body onload='loadActiveTab();onHeaderLoad();'>
        
            <%
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
            %>


            <fmt:setBundle basename="myprop" />

            <c:import url="/JSP-file/header.jsp" />

            <div id="left-mini" style="width:20%; height: 40%; float: left">
                <p>
                    <font face='Calibri'>
                <big><big><b><label><fmt:message key="userNameLable" bundle="${pageLang}" /></label></b></big></big>
                <big><big><b><label style="font-style: italic"><c:out value="${ sessionScope.userName }"></c:out></label></b></big></big>
                    </font>
                    </p>
                    <img src="IMG-file/noavatar.jpg"  />
                
                    <br><br>
                    <p>
                        <font face='Calibri'>
                        <label><fmt:message key="activeTabeLable" bundle="${pageLang}" />:</label>
                    <label id="activeTab"></label>
                    </font>
                </p>
            </div>
    
        <div class="deliveryHistory" style='width: 60%; float: left'>
            
            <c:forEach var="a" items="${sessionScope.history}">
                <c:forEach var="item" items="${a.list}">
                    <div style='width: 30%; height: 50%; float: left'>                
                    <jsp:setProperty name="productBean" property="lang" value="${lang}"/>
                    <jsp:setProperty name="productBean" property="productId" value="${item.beanId}"/>
                    <div class="profileOrder">
                        <a href="${pageContext.request.contextPath}/Servlet1?lang=${lang}&id=${item.beanId}">
                            <img src='IMG-file/<jsp:getProperty name="productBean" property="productImage"/>' 
                                 width=200 height=150 />
                        </a>
                    </div>
                    <a class="profileProductItem" href='${pageContext.request.contextPath}/Servlet1?lang=${lang}&id=${item.beanId}'>
                        <font color='black' face='Calibri' >
                        <jsp:getProperty name="productBean" property ="nameBag"/>
                        </font>
                    </a>
                    <p>
                    <font color='black' face='Calibri' >
                        <lable>Count:</lable>
                        <lable>${item.count}</lable>
                    </font>
                    </div>
                </c:forEach>
                <font color='black' face='Calibri' >        
                    <div class="profileDate">${a.timestamp}</div>
                    <div class="profileAddress">
                        <label class="addressLable"><fmt:message key="shopAddress" bundle="${pageLang}" />:</label>
                        <label class="address">${a.store}</label>
                    </div>
                </font>
                <hr style="width: 80%">
             
            </c:forEach>
               
        </div>

        <div id="RESULT" class="commentsList" style='width: 20%; height: 100%; float: left'>
            
        </div>
        <div class="commentDiv" style='width: 10%; height: 100%; float: left'>
            <div class="" >
                <textarea id="commentText" class="textAreaComment" ></textarea> 
            </div>
            <div class="profileSendButton">
                <button onclick="ajaxRequest()" ><fmt:message key="commentButtonSend" bundle="${pageLang}"/></button>  
            </div>
        </div>
    </body>
</html>
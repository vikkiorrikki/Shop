<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Корзина</title>
    </head>
    <body>
        <div id="header">
            <c:import url="/JSP-file/header.jsp">                            
                <c:param name="url" value="/Shop/JSP-file/cart.jsp"/>
            </c:import>  
        </div>
        
        <div id="right" style='width:  20%; height: 80%; float: right'>
            
        </div>
     
        <div id="left" style='width:  80%; height: 80%; float: left'>
            
        </div>
    </body>
</html>

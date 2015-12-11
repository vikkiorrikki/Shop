<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.TypeF"%>
<%@page import="Bean.ProductBean"%>
<%@page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JS-file/product.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        request.setCharacterEncoding("UTF-8");
        
            Cookie[] cookies = request.getCookies();

            ResourceBundle resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text", request.getLocale());
            String lang = request.getParameter("lang");

            /*String ruClass = new String();
            String enClass = new String();
            String itClass = new String();*/
            
            //  Если у нас есть куки
            if (cookies != null) {
                for (Cookie item : cookies) {
                    if (item.getName().equals("lang")) { // Находим куки с языком и устанавливаем ей нужное нам значение
                        String valCook = item.getValue();
                        if(valCook != null && lang == null || (lang.isEmpty())){
                            lang = valCook;
                        }
                        if ((lang.equals("RU")) || (lang.equals("undefined"))){
                            // resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
                            item.setValue("RU");
                            //ruClass = "class='active'";
                        } else if (lang.equals("ENG")) {
                            //resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_en_US", Locale.US);
                            item.setValue("ENG");
                            //enClass = "class='active'";
                        } else if (lang.equals("IT")) {
                            //resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_it_IT", Locale.ITALY);
                            item.setValue("IT");
                           // itClass = "class='active'";
                        }
                        break;
                    }
                }
            }
            // Выбор нужного файла с языком 
            if ((lang == null) ||  (lang.equals("RU")) ||  (lang.equals("undefined"))){
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
                Cookie c= new Cookie("lang","RU");

                response.addCookie(c);                  
            } else if (lang.equals("ENG")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_en_US", Locale.US);
                Cookie c= new Cookie("lang","ENG");
                
                response.addCookie(c);
            } else if (lang.equals("IT")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_it_IT", Locale.ITALY);
                Cookie c= new Cookie("lang","IT");
                response.addCookie(c);
            }          
         %>
   
    <title><%=resourceBundle.getString("Title")%></title>
    <!--<meta name='viewport' content='width=device-width, initial-scale=1.0'>-->
    <%--<jsp:useBean id="ListBean" class="Bean.TypeF" scope="session"/>--%>
        
    <body>
        <div id="header">
           <jsp:include page="/JSP-file/header.jsp"/> 
        </div>
                
        <div id="right" style='width:  20%; height: 80%; float: right'> 
                
                <%--<jsp:setProperty name="ListBean" property="id" param="value" />--%>
                 
                <%              
                    ArrayList<TypeF> clothTypeList = new ArrayList<>();
                    clothTypeList.add(new TypeF("all",resourceBundle.getString("All")));
                    clothTypeList.add(new TypeF("bags",resourceBundle.getString("Bags")));
                    clothTypeList.add(new TypeF("clutches",resourceBundle.getString("Clutches")));
                    clothTypeList.add(new TypeF("backpacks",resourceBundle.getString("Backpacks")));
                %>
                
                        <select name="brand" onchange="itemsChanged();" id="coolSZ">
                            <%
                                String val = "all";
                                if (cookies != null) {
                                    for (Cookie item : cookies) {
                                        if (item.getName().equals("value")) {
                                            val = item.getValue();
                                            break;
                                        }
                                    }
                                }          
                                if (val.equals(""))
                                    val = "all";
                                Cookie cookie1 = new Cookie("value",val); 
                                
                                // Если в строке что-то есть, то фильструем по нему
                                if (request.getParameter("value") != null){                                       
                                    for (TypeF ct : clothTypeList) {
                                        // проход по списку объектов для фильтра
                                        String selected = "";
                                        String reqValue = request.getParameter("value");
                                            if (ct.getId().equals(reqValue)) {
                                                // сравнение с выбранным id
                                                selected = "selected";
                                                // тут делаем значение какие реально были открыты
                                                cookie1.setValue(request.getParameter("value"));
                                            }
                                %>
                                        <option value="<%=ct.getId()%>" <%=selected%>>
                                            <%=ct.getName()%>
                                        </option>
                                <%
                                    }
                                }
                                else // В строке ничего нет
                                {
                                    // Посмотрим, если что-то в куки 
                                    if (cookies != null) {
                                        for (Cookie item : cookies) {
                                            if (item.getName().equals("value")) { 
                                                val = item.getValue();
                                                break;
                                            }
                                        }
                                    }
                                                                
                                    for (TypeF ct : clothTypeList) {
                                        // проход по списку объектов для фильтра
                                        String selected = "";
                                        if (ct.getId().equals(val)) {
                                        // сравнение с выбранным id
                                            selected = "selected";
                                            // тут делаем значение какие реально были открыты
                                            String reqVal = request.getParameter("value");
                                            if(reqVal != null && !reqVal.isEmpty()){
                                                cookie1.setValue(reqVal);
                                            }
                                        }
                                %>
                                        <option value="<%=ct.getId()%>" <%=selected%>>
                                            <%=ct.getName()%>
                                        </option>
                                <%
                                    }
                                }
                                // Добавляем нашу печеньку в ответ
                                response.addCookie(cookie1);  
                            %>
                        </select>
                    </div>
        <div id="left" style='width:  80%; height: 80%; float: left'>
                       <%   
                // Список товаров            
                ArrayList<ProductBean> clothList = new ArrayList<>();     
                clothList.add(new ProductBean("1", lang));
                clothList.add(new ProductBean("2", lang));
                clothList.add(new ProductBean("3", lang));
                clothList.add(new ProductBean("4", lang));
                clothList.add(new ProductBean("5", lang));
                clothList.add(new ProductBean("6", lang));
                clothList.add(new ProductBean("7", lang));
                clothList.add(new ProductBean("8", lang));
                clothList.add(new ProductBean("9", lang));
                
                // Пробегаем по списку с товарами, чтобы отобразить необходимые по заданному фильтру
            for(ProductBean cloth : clothList) {
                if (request.getParameter("value") != null) {
                    if ((cloth.getGroupOfProduct().equals(request.getParameter("value"))) || (request.getParameter("value") == null) || (request.getParameter("value").equals("all"))){%>
                                    <jsp:include page="/JSP-file/product.jsp"> 
                                        <jsp:param name="productId" value="<%=cloth.getProductId() %>"/> 
                                        <jsp:param name="nameBag" value="<%=cloth.getNameBag()%>"/> 
                                        <jsp:param name="productImage" value="<%=cloth.getProductImageFull()%>"/> 
                                        <jsp:param name="price" value="<%=cloth.getPrice()%>"/> 
                                        <jsp:param name="description1" value="<%=cloth.getDescription1()%>"/> 
                                        <jsp:param name="description2" value="<%=cloth.getDescription2()%>"/>
                                        <jsp:param name="description3" value="<%=cloth.getDescription3()%>"/> 
                                        <jsp:param name="description4" value="<%=cloth.getDescription4()%>"/> 
                                    </jsp:include>
                                <%}
                }
                else {
                    if (cookies != null) {
                        for (Cookie item : cookies) {
                            if (item.getName().equals("value")) { 
                                val = item.getValue();
                                break;
                            }
                        }
                    }
                    
                    if ((val == null) || val.isEmpty() || (cloth.getGroupOfProduct().equals(val)) || (val.equals("all"))){%>
                                    <jsp:include page="/JSP-file/product.jsp"> 
                                        <jsp:param name="productId" value="<%=cloth.getProductId() %>"/> 
                                        <jsp:param name="nameBag" value="<%=cloth.getNameBag()%>"/> 
                                        <jsp:param name="productImage" value="<%=cloth.getProductImageFull()%>"/> 
                                        <jsp:param name="price" value="<%=cloth.getPrice()%>"/> 
                                        <jsp:param name="description1" value="<%=cloth.getDescription1()%>"/> 
                                        <jsp:param name="description2" value="<%=cloth.getDescription2()%>"/>
                                        <jsp:param name="description3" value="<%=cloth.getDescription3()%>"/> 
                                        <jsp:param name="description4" value="<%=cloth.getDescription4()%>"/> 
                                    </jsp:include>
                                <%}
                }                
            }
            %> 
        </div>
    </body>
</html>


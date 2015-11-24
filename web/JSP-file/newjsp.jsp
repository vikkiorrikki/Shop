<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.TypeF"%>
<%@page import="Bean.ProductBean"%>
<%@page import="javax.servlet.http.Cookie"%>
<!DOCTYPE html>
<html>
    <%
        request.setCharacterEncoding("UTF-8");
        
            Cookie[] cookies = request.getCookies();

            ResourceBundle resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text", request.getLocale());
            String optForL = request.getParameter("optForL");

            /*String ruClass = new String();
            String enClass = new String();
            String itClass = new String();*/
            
            //  Если у нас есть куки
            if (cookies != null) {
                for (Cookie item : cookies) {
                    if (item.getName().equals("optForL")) { // Находим куки с языком и устанавливаем ей нужное нам значение
                        String valCook = item.getValue();
                        if(valCook != null && optForL == null || (optForL.isEmpty())){
                            optForL = valCook;
                        }
                        if ((optForL.equals("RU")) || (optForL.equals("undefined"))){
                             resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
                            item.setValue("RU");
                            //ruClass = "class='active'";
                        } else if (optForL.equals("ENG")) {
                            resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_en_US", Locale.US);
                            item.setValue("ENG");
                            //enClass = "class='active'";
                        } else if (optForL.equals("IT")) {
                            resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_it_IT", Locale.ITALY);
                            item.setValue("IT");
                           // itClass = "class='active'";
                        }
                        break;
                    }
                }
            }
            // Выбор нужного файла с языком 
            if ((optForL == null) ||  (optForL.equals("RU")) ||  (optForL.equals("undefined"))){
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_ru_RU", request.getLocale());
                Cookie c= new Cookie("optForL","RU");
                response.addCookie(c);                  
            } else if (optForL.equals("ENG")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_en_US", Locale.US);
                Cookie c= new Cookie("optForL","ENG");
                response.addCookie(c);
            } else if (optForL.equals("IT")) {
                resourceBundle = ResourceBundle.getBundle("LocaleFiles.Text_it_IT", Locale.ITALY);
                Cookie c= new Cookie("optForL","IT");
                response.addCookie(c);
            }          
         %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=resourceBundle.getString("Title")%></title>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <jsp:useBean id="ListBean" class="Bean.TypeF" scope="session"/>
        
    <body>
        <div id="header">
           <jsp:include page="/JSP-file/header.jsp"/> 
        </div>
                
        <div id="right" style='width:  20%; height: 80%; float: right'>
           <script>
                    function getUrlVars() {
                        var vars = {};
                        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
                            vars[key] = value;
                        });
                        return vars;
                    }                                                       
                    function itemsChanged(){
                        var l = getUrlVars()["optForL"];
                        var value = document.getElementsByTagName('select')[0].value;
                        window.location='?value='+value+"&optForL="+l; 
                    }                   
                </script> 
                
                <jsp:setProperty name="ListBean" property="id" param="value" />
                 
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
                ProductBean.addNewProduct("1","bags",resourceBundle.getString("ProductImage1"),
                                                    resourceBundle.getString("NameBag1"),
                                                    resourceBundle.getString("Price1"),
                                                    resourceBundle.getString("Description11"),
                                                    resourceBundle.getString("Description21"),
                                                    resourceBundle.getString("Description31"),
                                                    resourceBundle.getString("Description41"));
                ProductBean.addNewProduct("2","bags",resourceBundle.getString("ProductImage2"),
                                                    resourceBundle.getString("NameBag2"),
                                                    resourceBundle.getString("Price2"),
                                                    resourceBundle.getString("Description12"),
                                                    resourceBundle.getString("Description22"),
                                                    resourceBundle.getString("Description32"),
                                                    resourceBundle.getString("Description42"));
                ProductBean.addNewProduct("3","clutches",resourceBundle.getString("ProductImage3"),
                                                    resourceBundle.getString("NameBag3"),
                                                    resourceBundle.getString("Price3"),
                                                    resourceBundle.getString("Description13"),
                                                    resourceBundle.getString("Description23"),
                                                    resourceBundle.getString("Description33"),
                                                    resourceBundle.getString("Description43"));
                ProductBean.addNewProduct("4","clutches",resourceBundle.getString("ProductImage4"),
                                                    resourceBundle.getString("NameBag4"),
                                                    resourceBundle.getString("Price4"),
                                                    resourceBundle.getString("Description14"),
                                                    resourceBundle.getString("Description24"),
                                                    resourceBundle.getString("Description34"),
                                                    resourceBundle.getString("Description44"));
                ProductBean.addNewProduct("5","backpacks",resourceBundle.getString("ProductImage5"),
                                                    resourceBundle.getString("NameBag5"),
                                                    resourceBundle.getString("Price5"),
                                                    resourceBundle.getString("Description15"),
                                                    resourceBundle.getString("Description25"),
                                                    resourceBundle.getString("Description35"),
                                                    resourceBundle.getString("Description45"));
                ProductBean.addNewProduct("6","clutches",  resourceBundle.getString("ProductImage6"),
                                                    resourceBundle.getString("NameBag6"),
                                                    resourceBundle.getString("Price6"),
                                                    resourceBundle.getString("Description16"),
                                                    resourceBundle.getString("Description26"),
                                                    resourceBundle.getString("Description36"),
                                                    resourceBundle.getString("Description46"));
                ProductBean.addNewProduct("7","backpacks",  resourceBundle.getString("ProductImage7"),
                                                    resourceBundle.getString("NameBag7"),
                                                    resourceBundle.getString("Price7"),
                                                    resourceBundle.getString("Description17"),
                                                    resourceBundle.getString("Description27"),
                                                    resourceBundle.getString("Description37"),
                                                    resourceBundle.getString("Description47"));
                ProductBean.addNewProduct("8","clutches",  resourceBundle.getString("ProductImage8"),
                                                    resourceBundle.getString("NameBag8"),
                                                    resourceBundle.getString("Price8"),
                                                    resourceBundle.getString("Description18"),
                                                    resourceBundle.getString("Description28"),
                                                    resourceBundle.getString("Description38"),
                                                    resourceBundle.getString("Description48"));
                ProductBean.addNewProduct("9","bags",  resourceBundle.getString("ProductImage9"),
                                                    resourceBundle.getString("NameBag9"),
                                                    resourceBundle.getString("Price9"),
                                                    resourceBundle.getString("Description19"),
                                                    resourceBundle.getString("Description29"),
                                                    resourceBundle.getString("Description39"),
                                                    resourceBundle.getString("Description49"));
                
                //ArrayList<CardBean> clothList = CardBean.getAllProducts();
                // Список товаров            
                ArrayList<ProductBean> clothList = new ArrayList<>();
                clothList.add(new ProductBean("1","bags",resourceBundle.getString("ProductImage1"),
                                                    resourceBundle.getString("NameBag1"),
                                                    resourceBundle.getString("Price1"),
                                                    resourceBundle.getString("Description11"),
                                                    resourceBundle.getString("Description21"),
                                                    resourceBundle.getString("Description31"),
                                                    resourceBundle.getString("Description41")));
                clothList.add(new ProductBean("2","bags",resourceBundle.getString("ProductImage2"),
                                                    resourceBundle.getString("NameBag2"),
                                                    resourceBundle.getString("Price2"),
                                                    resourceBundle.getString("Description12"),
                                                    resourceBundle.getString("Description22"),
                                                    resourceBundle.getString("Description32"),
                                                    resourceBundle.getString("Description42")));
                clothList.add(new ProductBean("3","clutches",resourceBundle.getString("ProductImage3"),
                                                    resourceBundle.getString("NameBag3"),
                                                    resourceBundle.getString("Price3"),
                                                    resourceBundle.getString("Description13"),
                                                    resourceBundle.getString("Description23"),
                                                    resourceBundle.getString("Description33"),
                                                    resourceBundle.getString("Description43")));
                clothList.add(new ProductBean("4","clutches",resourceBundle.getString("ProductImage4"),
                                                    resourceBundle.getString("NameBag4"),
                                                    resourceBundle.getString("Price4"),
                                                    resourceBundle.getString("Description14"),
                                                    resourceBundle.getString("Description24"),
                                                    resourceBundle.getString("Description34"),
                                                    resourceBundle.getString("Description44")));
                clothList.add(new ProductBean("5","backpacks",resourceBundle.getString("ProductImage5"),
                                                    resourceBundle.getString("NameBag5"),
                                                    resourceBundle.getString("Price5"),
                                                    resourceBundle.getString("Description15"),
                                                    resourceBundle.getString("Description25"),
                                                    resourceBundle.getString("Description35"),
                                                    resourceBundle.getString("Description45")));
                clothList.add(new ProductBean("6","clutches",  resourceBundle.getString("ProductImage6"),
                                                    resourceBundle.getString("NameBag6"),
                                                    resourceBundle.getString("Price6"),
                                                    resourceBundle.getString("Description16"),
                                                    resourceBundle.getString("Description26"),
                                                    resourceBundle.getString("Description36"),
                                                    resourceBundle.getString("Description46")));
                clothList.add(new ProductBean("7","backpacks",  resourceBundle.getString("ProductImage7"),
                                                    resourceBundle.getString("NameBag7"),
                                                    resourceBundle.getString("Price7"),
                                                    resourceBundle.getString("Description17"),
                                                    resourceBundle.getString("Description27"),
                                                    resourceBundle.getString("Description37"),
                                                    resourceBundle.getString("Description47")));
                clothList.add(new ProductBean("8","clutches",  resourceBundle.getString("ProductImage8"),
                                                    resourceBundle.getString("NameBag8"),
                                                    resourceBundle.getString("Price8"),
                                                    resourceBundle.getString("Description18"),
                                                    resourceBundle.getString("Description28"),
                                                    resourceBundle.getString("Description38"),
                                                    resourceBundle.getString("Description48")));
                clothList.add(new ProductBean("9","bags",  resourceBundle.getString("ProductImage9"),
                                                    resourceBundle.getString("NameBag9"),
                                                    resourceBundle.getString("Price9"),
                                                    resourceBundle.getString("Description19"),
                                                    resourceBundle.getString("Description29"),
                                                    resourceBundle.getString("Description39"),
                                                    resourceBundle.getString("Description49")));                
                // Пробегаем по списку с товарами, чтобы отобразить необходимые по заданному фильтру
            for(ProductBean cloth : clothList) {
                if (request.getParameter("value") != null) {
                    if ((cloth.getGroupOfProduct().equals(request.getParameter("value"))) || (request.getParameter("value") == null) || (request.getParameter("value").equals("all"))){%>
                                    <jsp:include page="product.jsp"> 
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
                                    <jsp:include page="product.jsp"> 
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


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vikki
 */

public class Servlet1 extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html; charster=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String value = getInitParameter("activeTab"); //получение параметров инициализации
        PrintWriter out = response.getWriter();
        Locale locale = new Locale("");
        String lang = request.getParameter("lang");
        String ruClass = new String();
        String enClass = new String();
        String itClass = new String();
        if(lang != null) {
            if(lang.equals("ENG")) {
                locale = Locale.US;
                enClass = "class='active'";
            } else if(lang.equals("IT")) {
                locale = Locale.ITALY;
                itClass = "class='active'";
            } else {
                ruClass  = "class='active'";
            }
        } else {
            ruClass  = "class='active'";
        }
        String id = request.getParameter("id");
        boolean isId1 = id != null && id.equals("1");
        String price = isId1 ? "EUR 2130" : "EUR 3375";
        String photoFileName = isId1 ? "IMG-file/bag.JPG" : "IMG-file/bag1.JPG";
        String propName = isId1 ? "NameBag" : "NameBag1";
        String url2 = "http://localhost:8080/Shop/Cart?lang=" + lang;
        String url1 = "http://localhost:8080/Shop/?lang=" + lang;
        
        ResourceBundle bundles = ResourceBundle.getBundle("myprop", locale);
        out.println("<!DOCTYPE html>");
        out.println("<!--");
        out.println("To change this license header, choose License Headers in Project Properties.");
        out.println("To change this template file, choose Tools | Templates");
        out.println("and open the template in the editor.");
        out.println("-->");
        out.println("<html>");
        out.println("    <head>");
        out.println("        <script src='JS-file/product.js'></script>");
        out.println("        <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>");
        out.println("        <title>" + bundles.getString("Title") + "</title>");
        out.println("        <meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("        <link rel='stylesheet' type='text/css' href='CSS-file/style.css'>");
        out.println("    </head>");
        out.println("    <body>");
        out.println("        <div id='header'>");
        out.println("            <p><a href='" + url1 + "'><font color='black' face='Calibri' size='350%'> HandBag </font></a>");
        out.println("            <a onclick=\"window.location.href='" + url2 + "'\">" +
"                                <button style='float: right'>" + bundles.getString("Bag") + "</button></a>");
        
        out.println("            <div id='ButtonL' class='switch-lang'>");
        out.println("            <ul>");
        out.println("               <li><a " + ruClass + "href='Servlet1?lang=RU'>РУС</a></li>");
        out.println("               <li><a " + enClass + " href='Servlet1?lang=ENG'>ENG</a></li>");
        out.println("               <li><a " + itClass + " href='Servlet1?lang=IT'>IT</a></li>");
        out.println("           </ul>");
        out.println("           </div></p>");
        out.println("        </div>");
        out.println("");
        out.println("        <div id='left'>");
        out.println("            <p style='color:black; font-size: 20pt'>" + bundles.getString(propName) + "</p>");
        out.println("            <p><img src='" + photoFileName + "' alt='Photo'></p>");
        out.println("        </div>");
        out.println("");
        out.println("        <div id='right'>");
        out.println("            <p style='color: red; font-weight: lighter; font-size: 30pt'>" + price +" </p>");
        out.println("");
        if (value.equals("1")) {
        out.println("            <ul id='Tabs'>");
        out.println("                <li id='ThreeTab' class='Tab'><a href='#Three' onclick='Three(); return false;'>" + bundles.getString("Tab3") + "</a></li>");
        out.println("                <li id='TwoTab' class='Tab'><a href='#Two' onclick='Two(); return false;'>" + bundles.getString("Tab2") + "</a></li>");
        out.println("                <li id='OneTab' class='SelectedTab'><a href='#One' onclick='One(); return false;'>" + bundles.getString("Tab1") + "</a></li>");
        out.println("            </ul>");
        }else if (value.equals("2")) {
        out.println("            <ul id='Tabs'>");
        out.println("                <li id='ThreeTab' class='Tab'><a href='#Three' onclick='Three(); return false;'>" + bundles.getString("Tab3") + "</a></li>");
        out.println("                <li id='TwoTab' class='SelectedTab'><a href='#Two' onclick='Two(); return false;'>" + bundles.getString("Tab2") + "</a></li>");
        out.println("                <li id='OneTab' class='Tab'><a href='#One' onclick='One(); return false;'>" + bundles.getString("Tab1") + "</a></li>");
        out.println("            </ul>");
        }else{
        out.println("            <ul id='Tabs'>");
        out.println("                <li id='ThreeTab' class='SelectedTab'><a href='#Three' onclick='Three(); return false;'>" + bundles.getString("Tab3") + "</a></li>");
        out.println("                <li id='TwoTab' class='Tab'><a href='#Two' onclick='Two(); return false;'>" + bundles.getString("Tab2") + "</a></li>");
        out.println("                <li id='OneTab' class='Tab'><a href='#One' onclick='One(); return false;'>" + bundles.getString("Tab1") + "</a></li>");
        out.println("            </ul>");
        }
        out.println("");
        out.println("            <!-- Содержимое вкладок -->");
        out.println("            <div id='Content'>");
        out.println("                <!-- Первая -->");
        out.println("                <div id='One'>");
        out.println("                    <p>" + bundles.getString("Description1") + "</p>");
        out.println("                    <p>" + bundles.getString("Description2") + "</p>");
        out.println("                    <p>" + bundles.getString("Description3") + "</p>");
        out.println("                    <p>" + bundles.getString("Description4") + "</p>");
        out.println("                    <p>" + bundles.getString("Description5") + "</p>");
        out.println("                </div>");
        out.println("");
        out.println("                <!-- Вторая -->");
        out.println("                <div id='Two' style='display: none;'>");
        out.println("                    <p>" + bundles.getString("Consist1") + "</p>");
        out.println("                    <p>" + bundles.getString("Consist2") + "	</p>");
        out.println("                </div>");
        out.println("                ");
        out.println("                <div id='Three' style='display: none;'>");
        out.println("                    <p>" + bundles.getString("Review1") + "</p>");
        out.println("                </div>");
        out.println("            </div>");
        out.println("");
        out.println("            <script type='text/javascript'>");
        out.println("            // 1");
        out.println("            function One()");
        out.println("            {");
        out.println("              // Табы");
        out.println("              document.getElementById('OneTab').className = 'SelectedTab';");
        out.println("              document.getElementById('TwoTab').className = 'Tab';");
        out.println("              document.getElementById('ThreeTab').className = 'Tab';");
        out.println("");
        out.println("              // Страницы");
        out.println("              document.getElementById('One').style.display = 'block';");
        out.println("              document.getElementById('OneTab').className = 'SelectedTab';");
        out.println("              document.getElementById('Two').style.display = 'none';");
        out.println("              document.getElementById('Three').style.display = 'none';");
        out.println("");
        out.println("            }");
        out.println("            // 2");
        out.println("            function Two()");
        out.println("            {");
        out.println("              // Табы");
        out.println("              document.getElementById('OneTab').className = 'Tab';");
        out.println("              document.getElementById('TwoTab').className = 'SelectedTab';");
        out.println("              document.getElementById('ThreeTab').className = 'Tab';");
        out.println("");
        out.println("              // Страницы");
        out.println("              document.getElementById('One').style.display = 'none';");
        out.println("              document.getElementById('Two').style.display = 'block';");
        out.println("              document.getElementById('Three').style.display = 'none';");
        out.println("");
        out.println("            }");
        out.println("            ");
        out.println("            function Three()");
        out.println("            {");
        out.println("              // Табы");
        out.println("              document.getElementById('OneTab').className = 'Tab';");
        out.println("              document.getElementById('TwoTab').className = 'Tab';");
        out.println("              document.getElementById('ThreeTab').className = 'SelectedTab';");
        out.println("");
        out.println("              // Страницы");
        out.println("              document.getElementById('One').style.display = 'none';");
        out.println("              document.getElementById('Two').style.display = 'none';");
        out.println("              document.getElementById('Three').style.display = 'block';");
        
        out.println("");
        out.println("            }");
        out.println("            </script>");
        out.println("");
        out.println("            <p style='text-align: center'>"
                + "<button "
                + "onclick=\"addToCart("
                +            "'" + id + "', this, '" + bundles.getString("AddToCart") + "'"
                +           ")"
                + "\">"
                + bundles.getString("Buy")
                + "</button>");
        out.println("        </div>"); 
        out.println("");
        out.println("    </body>");
        out.println("</html>");

        out.close();

    }
}


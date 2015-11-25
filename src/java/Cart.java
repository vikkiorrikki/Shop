/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Bean.ProductBean;
import LocaleFiles.Language;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vikki
 */
public class Cart extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
                
        String orderderedProducts = (String) session.getAttribute("orderderedProducts");
        String language = request.getParameter("lang");
        if(language == null){
            language = Language.getLanguage(request.getCookies());
        }
        request.setAttribute("lang", language);
        System.err.println("lang=" + language);
        Map<String, ProductBean> beans = new HashMap<>();
        String uniqueOrdered = new String();
        String deleteBeanId = request.getParameter("delete");
        Set<String> uniques = new HashSet<>();
        if (orderderedProducts != null) {
            System.err.println("orderderedProducts=" + orderderedProducts);
            StringTokenizer tok = new StringTokenizer(orderderedProducts, " ");
            while (tok.hasMoreElements()) {
                String temp = tok.nextToken();
                try{
                    Integer.parseInt(temp);
                }catch(Exception e) {continue;}
                if(deleteBeanId != null && deleteBeanId.equals(temp)){
                    continue;
                }
                if(beans.get(temp) == null) {
                    ProductBean bean = new ProductBean(temp, language);
                    beans.put(temp, bean);
                }
                uniques.add(temp);
            }
        }
        for(String s : uniques) {
            try{
                Integer.parseInt(s);
            }catch(Exception e) {continue;}
            uniqueOrdered += s + " ";
        }
        System.out.println("uniqueOrdered=" + uniqueOrdered);
        Language lang = Language.getByCode(language);
        ResourceBundle resources = lang.getLocaleFile();
        request.setAttribute("resources", resources);
        session.setAttribute("orderderedProducts", uniqueOrdered);
        session.setAttribute("beans", beans);
        RequestDispatcher dispatcher = request.getRequestDispatcher("JSP-file/cart.jsp");
        dispatcher.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //doGet(request, response);
        HttpSession session = request.getSession(true);
        if (request.getParameter("order") != null) {
            String ord = request.getParameter("order");
            String orderedPr = (String) session.getAttribute("orderderedProducts");
            if(orderedPr == null){
                orderedPr = ord;
            } else {
                orderedPr += " " + ord;
            }
            session.setAttribute("orderderedProducts",  orderedPr );
            session.setAttribute("orderAbility", "y");
        }
    }
}
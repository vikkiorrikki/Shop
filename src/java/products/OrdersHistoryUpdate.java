/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package products;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author savinov
 */
public class OrdersHistoryUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        String orderderedProducts = (String)session.getAttribute("orderderedProducts");
        String user = request.getUserPrincipal().getName();
        String lang = request.getParameter("lang");
        System.out.println("OrdersHistoryUpdate");
        if(orderderedProducts != null) {
            StringTokenizer tok = new StringTokenizer(orderderedProducts);

            String address = request.getParameter("store");
            String goods = "";
            while (tok.hasMoreElements() && address != null) {
                String product = tok.nextToken();
                if (!product.equals("null")) {
                    String countStr = request.getParameter("c"+product);
                    Integer count = 1;
                    try{
                        count = Integer.parseInt(countStr);
                        if(count <= 0){
                            count = 1;
                        }
                    }catch(Exception e){}
                    //String address, Date dTimeStamp, String productId, int productcount, String username
                    //String productId, String address, String username, Date dTimeStamp, int productcount
                    goods += product + "=" + count+"&";
                }
                Date date = new Date();
                OrdersHelper.persist(new Orders( user, address, goods, date));
            }
            session.removeAttribute("orderderedProducts");
        }
        
        List list = OrdersHelper.getAllByUser(user);
        List<OrdersOut> out = new ArrayList<>();
        if(list != null) {
            for (Iterator iterator = list.iterator(); iterator.hasNext();) {
                Orders current = (Orders) iterator.next();
                OrdersOut o = new OrdersOut(current);
                out.add(o);
            }
        }
        session.setAttribute("history", out);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userPage?lang=" + lang);
	dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

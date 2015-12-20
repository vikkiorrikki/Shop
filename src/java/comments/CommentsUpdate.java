/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comments;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author savinov
 */
public class CommentsUpdate extends HttpServlet {

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
        String text = request.getParameter("text");
        Principal pr = request.getUserPrincipal();
        String user = "";
        if(pr != null){
            user = pr.getName();
        }
        System.out.println("User=" + user);
        if( user.equals("")){
            return ;
        }
        String lang = request.getParameter("lang");
        if(text != null && !text.isEmpty()){
            Comments com = new Comments( user, text, new Date());
            System.out.println("Comment:" + com);
            DbUpdater.persist(com);
        } else {
            System.out.println("Empty text");
        }
        System.out.println("aaaa");
        List list = DbUpdater.getAllByUser(user);
        PrintWriter out = response.getWriter();
        if(list != null) {
            for (Iterator iterator = list.iterator(); iterator.hasNext();) {
                Comments current = (Comments) iterator.next();
                StringBuilder builder = new StringBuilder();
                builder.append("").append(
                    "<div class='oneComment' >").append(
                        "<img src='IMG-file/noavatar.jpg' class='profileCommentImg' width=20 height=20 />").
                        append("<div class='profileCommentNameAndDate'><label class='profileNameComments'>").
                        append(current.getUser()).
                        append("</label>").
                        append("<div class='commentDate'><label>").
                        append(current.getTimestamp()).
                        append("</label></div></div>").
                        append("<br><label class='textComment'>").
                        append(current.getText()).
                        append("</label>").
                        append("</div>" );
                out.println(builder.toString());
            }
        }
        out.close();
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

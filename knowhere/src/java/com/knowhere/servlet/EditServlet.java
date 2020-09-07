/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.knowhere.servlet;

import com.knowhere.dao.UserDao;
import com.knowhere.entity.Message;
import com.knowhere.entity.User;
import com.knowhere.helper.ConnectionProvider;
import com.knowhere.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//            fetch data
            String userEmail = request.getParameter("user_email");
            String userAbout = request.getParameter("about");
            String userPassword = request.getParameter("user_password");
            Part part = request.getPart("profilepic");
            String imgNmae = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setAbout(userAbout);
            user.setPassword(userPassword);
            String oldFile = user.getProfile();
            user.setProfile(imgNmae);

            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            if (dao.updateUser(user)) {

                String oldPath = request.getRealPath("/") + "pics" + File.separator + oldFile;
                if (!oldFile.equals("default.png")) {
                    helper.deleteFile(oldPath);
                }
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                if (helper.saveFile(part.getInputStream(), path)) {
                    Message msg = new Message("User Profile updated sussessfully", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("User Profile updated successfully ", "success", "alert-success");
                    s.setAttribute("msg", msg);

                }

            } else {
                Message msg = new Message("User Profile not updated ", "error", "alert-danger");
                s.setAttribute("msg", msg);

            }
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
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

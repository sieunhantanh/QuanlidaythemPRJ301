/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import dao.Dao;
import dao.Dto;
import dao.Mess;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NCM
 */
public class SendMessage extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendMessage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMessage at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String mess = "";
        int r = 0;
        String message = request.getParameter("message");
        String recipientType = request.getParameter("recipient");
        String idre = request.getParameter("idre");
        String idse = request.getParameter("idse");
        Dao dao = new Dao();
        // Kiểm tra người dùng chọn gửi đến ai
        if (message == null || message.trim().isEmpty()) {
            request.setAttribute("err", "Tin nhan khong duoc trong");
            request.getRequestDispatcher("Homeaddmin.jsp").forward(request, response);
            return;
        } else {
            if ("all".equals(recipientType)) {
                idse="admin";
                try {
                    // Gửi tin nhắn đến tất cả người dùng
                    r = dao.sendMessageallUser(idse, message);
                    if (r == 0) {
                        mess = "Cannot send message";
                        request.setAttribute("mess", mess);
                        request.getRequestDispatcher("Homeaddmin.jsp").forward(request, response);
                    } else {
                        mess = "Send message successful";
                        request.setAttribute("mess", mess);
                        request.getRequestDispatcher("Homeaddmin.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(SendMessage.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if ("specific".equals(recipientType)) {
                try {
                    // Gửi tin nhắn đến người dùng cụ thể dựa vào userId
                    r = dao.sendMessageToUser(idse, message, idre);
                    if (r == 0) {
                        mess = "Cannot send message";
                        request.setAttribute("mess", mess);
                        request.getRequestDispatcher("Homeaddmin.jsp").forward(request, response);
                    } else {
                        mess = "Send message successful";
                        request.setAttribute("mess", mess);
                        request.getRequestDispatcher("Homeaddmin.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(SendMessage.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }
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

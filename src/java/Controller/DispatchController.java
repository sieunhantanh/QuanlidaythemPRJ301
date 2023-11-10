/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.Dao;
import dao.Dto;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Teacher
 */
@WebServlet(name = "DispatchController", urlPatterns = {"/DispatchController"})
public class DispatchController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if ("Delete".equals(action)) {
            String username = request.getParameter("username");
            Dao dao = new Dao();
            dao.deleteRecord(username);

            // Nếu cả hai xóa đều thành công, quay về trang quản lý tài khoản
            response.sendRedirect("Manageacc");

        } else if ("Savechange".equals(action)) {
            String username = request.getParameter("username");
            String newPassword = request.getParameter("password");
            int role = request.getParameter("role") != null ? 1 : 0;
            Dao dao = new Dao();

            try {
                dao.updateAccount(username, newPassword, role);
                response.sendRedirect("Manageacc");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("Manageacc");
            }
        } else if ("Add New Account".equals(action)) {
            int role = 0;
            String newUsername = request.getParameter("newUsername");
            String newPassword = request.getParameter("newPassword");
            boolean newRole = request.getParameter("newRole") != null;
            String newAccId = request.getParameter("newAccId");
            if (newRole == true) {
                role = 1;
            } else {
                role = 0;
            }

            Dao accountDao = new Dao();
            try {
                accountDao.createAccount(newUsername, newPassword, role, newAccId);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                // Xử lý lỗi nếu cần thiết
                response.sendRedirect("Manageacc");
                return;
            }

            // Chuyển hướng người dùng đến trang Manageacc sau khi thêm tài khoản
            response.sendRedirect("Manageacc");
        } // Tiếp tục xử lý hoặc chuyển hướng người dùng tùy theo logic của bạn
        else if ("Add New Class".equals(action)) {
            String IDclass = request.getParameter("newIDclass");
            String Nameclass = request.getParameter("newNameclass");
            String Subject = request.getParameter("newubject");
            String timestart = request.getParameter("timestart");
            String timeend = request.getParameter("timeend");
            Dao Classdao = new Dao();
            try {
                Classdao.createClass(IDclass, Nameclass, Subject, timestart, timeend);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                // Xử lý lỗi nếu cần thiết
                response.sendRedirect("Manageclass");
                return;
            }

            // Chuyển hướng người dùng đến trang Manageacc sau khi thêm tài khoản
            response.sendRedirect("Manageclass");
        }
    }

    // Tiếp tục xử lý hoặc chuyển hướng người dùng tùy theo logic của bạn
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DispatchController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DispatchController.class.getName()).log(Level.SEVERE, null, ex);
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

package Servlet;

import dao.Dao;
import dao.Dto;
import dao.Mess;
import dao.Student;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NCM
 */
public class Homeuser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Dto acc = (Dto) session.getAttribute("account");

            if (acc == null) {
                // Xử lý khi không có thông tin tài khoản trong session
                response.getWriter().println("Accessdenied");
            } else {
                String username = acc.getUsername();
                Dao dao = new Dao();
                Student student = dao.getin4(username);
                if (student != null) {

                    List<Dto> li1 = dao.layFullTaiKhoan();
                    request.setAttribute("li1", li1);
                    List<Mess> li = dao.getMessagesByRecipientId(acc.getAccid());
                    request.setAttribute("studentInfo", student);
                    request.setAttribute("li", li);
                    // Chuyển hướng request và response đến trang Homeuser.jsp
                    RequestDispatcher rd = request.getRequestDispatcher("Homeuser.jsp");
                    rd.forward(request, response);

                } else {
                    // Xử lý khi không tìm thấy thông tin sinh viên
                    response.getWriter().println("Student information not found!");
                }
            }
        } catch (Exception e) {
            // Xử lý lỗi nếu có
            e.printStackTrace();
            response.getWriter().println("Error occurred: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (SQLException ex) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Homeuser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

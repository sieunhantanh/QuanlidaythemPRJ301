/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DBHelper.DBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NCM
 */
public class Dao implements Serializable {

    public Dto checkLogin(String username, String password) throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Connect DB
            con = new DBHelper.DBContext().getConnection();
            if (con != null) {
                // 2. Create SQL String
                String sql = "SELECT username, password, role, accid FROM Acc WHERE username = ? AND password = ?";
                // 3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                // 4. Execute Query
                rs = stm.executeQuery();
                // 5. Process Result
                if (rs.next()) {
                    String user = rs.getString("username");
                    String pass = rs.getString("password");
                    int role = rs.getInt("role");
                    String accid = rs.getString("accid");
                    Dto dto = new Dto(username, password, role, accid);
                    return dto;
                }
            }
        } catch (Exception e) {
            // Xử lý lỗi, ví dụ: ghi log
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public int getRole(String username, String password) throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int role = 0;

        try {
            //1. Connect DB
            con = new DBHelper.DBContext().getConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "SELECT role FROM Acc WHERE username = ? AND password = ?";

                //3. Create PreparedStatement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);

                //4. Execute Query
                rs = stm.executeQuery();

                //5. Process Result
                if (rs.next()) {
                    // Kiểm tra giá trị null trước khi gán giá trị cho role
                    Object roleObj = rs.getObject("role");
                    if (roleObj != null) {
                        role = rs.getInt("role");
                    }
                }
            }
        } finally {
            //6. Close Resources
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return role;
    }

    public List<Dto> layFullTaiKhoan() throws Exception {
        List<Dto> accounts = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            String sql = "SELECT username, password, role,accid FROM acc";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();

            accounts = new ArrayList<>();
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role = rs.getInt("role");
                String accid = rs.getString("accid");
                Dto account = new Dto(username, password, role, accid);
                accounts.add(account);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên ở đây nếu cần
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return accounts;
    }

    public void deleteRecord(String pk) throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement deleteAccStm = null;
        PreparedStatement deleteStudentStm = null;
        PreparedStatement deletemStm = null;
        boolean success = false;

        // 1. Connect DB
        con = new DBHelper.DBContext().getConnection();
        if (con != null) {
            // 2. Set auto-commit to false to enable transaction
            con.setAutoCommit(false);
            String deletemSql = "Delete from Manage where idacc in (SElect AccID from Acc where username=?)";
            deletemStm = con.prepareStatement(deletemSql);
            deletemStm.setString(1, pk);
            int rows = deletemStm.executeUpdate();
            // 3. Create SQL String for deleting from acc table
            String deleteStudentSql = "DELETE FROM Student WHERE Accid IN (SELECT AccID FROM Acc WHERE username = ?)";
            deleteStudentStm = con.prepareStatement(deleteStudentSql);
            deleteStudentStm.setString(1, pk);
            int rowsAffectedStudent = deleteStudentStm.executeUpdate();

            String deleteAccSql = "DELETE FROM acc WHERE username = ? AND role = 0";
            deleteAccStm = con.prepareStatement(deleteAccSql);
            deleteAccStm.setString(1, pk);
            int rowsAffectedAcc = deleteAccStm.executeUpdate();

        }
    }
    //    public int takediemdanh(String[] accid) throws SQLException {
    //        int rs = 0;
    //        Connection con = null;
    //        if (accid != null) {
    //            for (String studentId : accid) {
    //                String sql = "UPDATE Attendence SET Present = 1 WHERE aidstudent = ?";
    //                PreparedStatement ps = con.prepareStatement(sql);
    //                ps.setString(1, studentId);
    //                int rows = ps.executeUpdate();
    //                rs++;
    //                ps.close();
    //            }
    //        }
    //        return rs;
    //    }

    public void createAccount(String username, String password, int role, String accid) throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            if (con != null) {
                // Tạo truy vấn SQL để chèn tài khoản mới vào cơ sở dữ liệu
                String sql = "INSERT INTO acc (username, password, role, accid) VALUES (?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setInt(3, role);
                stm.setString(4, accid);

                // Thực hiện truy vấn chèn
                stm.executeUpdate();
                String studentInsertSql = "INSERT INTO student (Accid,Idstudent) VALUES (?,?)";
                stm = con.prepareStatement(studentInsertSql);
                stm.setString(1, accid);
                stm.setString(2, accid);
                // Thực hiện truy vấn chèn vào bảng student
                stm.executeUpdate();
                String DInsertSql = "INSERT INTO Attendence (aIdstudent) VALUES (?)";
                stm = con.prepareStatement(studentInsertSql);
                stm.setString(1, accid);
                // Thực hiện truy vấn chèn vào bảng student
                stm.executeUpdate();
            }
        } finally {
            // Đóng tài nguyên (Connection, PreparedStatement) ở đây nếu cần thiết
            // ...
        }
    }

    public void createClass(String Idclass, String Nameclass, String Mon, String TimeStart, String TimeEnd) throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            if (con != null) {
                // Tạo truy vấn SQL để chèn tài khoản mới vào cơ sở dữ liệu
                String sql = "INSERT INTO Class (IDclass, Nameclass, Subject,TimeStart,TimeEnd) VALUES (?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, Idclass);
                stm.setString(2, Nameclass);
                stm.setString(3, Mon);
                stm.setString(4, TimeStart);
                stm.setString(5, TimeEnd);
                // Thực hiện truy vấn chèn
                stm.executeUpdate();
            }
        } finally {
            // Đóng tài nguyên (Connection, PreparedStatement) ở đây nếu cần thiết
            // ...
        }
    }

    public void updateAccount(String username, String password, int role) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            if (con != null) {
                // Tạo truy vấn SQL để cập nhật thông tin tài khoản
                String sql = "UPDATE acc SET password = ?, role = ? WHERE username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setInt(2, role);
                stm.setString(3, username);

                // Thực hiện truy vấn cập nhật
                stm.executeUpdate();
            } else {
                // Xử lý khi không kết nối được với cơ sở dữ liệu
                throw new Exception("Không thể kết nối với cơ sở dữ liệu");
            }
        } catch (SQLException e) {
            // Xử lý lỗi SQL
            throw new Exception("Lỗi khi cập nhật thông tin tài khoản: " + e.getMessage());
        } finally {
            // Đóng tài nguyên (Connection, PreparedStatement) ở đây nếu cần thiết
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
    }

    public List<Lophoc> getFullClass() throws Exception {
        List<Lophoc> LopList = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            String sql = "SELECT IDclass, Nameclass, Subject, TimeStart, TimeEnd FROM Class WHERE Subject <>'admin'";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            LopList = new ArrayList<>();
            while (rs.next()) {
                String IDclass = rs.getString("IDclass");
                String Nameclass = rs.getString("Nameclass");
                String Subject = rs.getString("Subject");
                String timestart = rs.getString("TimeStart");
                String timeend = rs.getString("TimeEnd");
                Lophoc lop = new Lophoc(IDclass, Nameclass, Subject, timestart, timeend);
                LopList.add(lop);
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Xử lý lỗi và ném ra ngoại lệ
            throw new Exception("Lỗi khi lấy danh sách lớp học: " + e.getMessage());
        } finally {
            // Đóng tất cả các tài nguyên ở đây nếu cần
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
        return LopList;
    }

    public List<Lophoc> getFullClasswithSubject(String namesubject) throws Exception {
        List<Lophoc> LopList = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            String sql = "SELECT IDclass, Nameclass, Subject,TimeStart,TimeEnd FROM Class Where Subject= ? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, namesubject);
            rs = stm.executeQuery();
            LopList = new ArrayList<>();
            while (rs.next()) {
                String IDclass = rs.getString("IDclass");
                String Nameclass = rs.getString("Nameclass");
                String Subject = rs.getString("Subject");
                String timestart = rs.getString("TimeStart");
                String timeend = rs.getString("TimeEnd");
                Lophoc lop = new Lophoc(IDclass, Nameclass, Subject, timestart, timeend);
                LopList.add(lop);
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Xử lý lỗi và ném ra ngoại lệ
            throw new Exception("Lỗi khi lấy danh sách lớp học: " + e.getMessage());
        } finally {
            // Đóng tất cả các tài nguyên ở đây nếu cần
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
        return LopList;
    }

    public List<Lophoc> getFullClasswithStudent(String idacc) throws Exception {
        List<Lophoc> LopList = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            String sql = "select c.* from Class c join Manage m on c.IDclass=m.idclass where m.idacc=? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, idacc);
            rs = stm.executeQuery();
            LopList = new ArrayList<>();
            while (rs.next()) {
                String IDclass = rs.getString(1);
                String Nameclass = rs.getString(2);
                String Subject = rs.getString(3);
                String timestart = rs.getString(4);
                String timeend = rs.getString(5);
                Lophoc lop = new Lophoc(IDclass, Nameclass, Subject, timestart, timeend);
                LopList.add(lop);
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Xử lý lỗi và ném ra ngoại lệ
            throw new Exception("Lỗi khi lấy danh sách lớp học: " + e.getMessage());
        } finally {
            // Đóng tất cả các tài nguyên ở đây nếu cần
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
        return LopList;
    }

    public List<Student1> getliststudent() throws Exception {
        List<Student1> StudentList = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = new DBHelper.DBContext().getConnection();
            String sql = "select * from Student";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            StudentList = new ArrayList<>();
            while (rs.next()) {
                Student1 stu1 = new Student1(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                StudentList.add(stu1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Xử lý lỗi và ném ra ngoại lệ
            throw new Exception("Lỗi khi lấy danh sách lớp học: " + e.getMessage());
        } finally {
            // Đóng tất cả các tài nguyên ở đây nếu cần
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
        return StudentList;
    }

    public List<Subject> getFullSubject() throws Exception {
        List<Subject> MonList = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            String sql = "SELECT distinct Subject FROM Class WHERE subject <> 'admin'";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            MonList = new ArrayList<>();
            while (rs.next()) {
                String Subject = rs.getString("Subject");

                Subject Mon = new Subject(Subject);
                MonList.add(Mon);
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Xử lý lỗi và ném ra ngoại lệ
            throw new Exception("Lỗi khi lấy danh sách lớp học: " + e.getMessage());
        } finally {
            // Đóng tất cả các tài nguyên ở đây nếu cần
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
        return MonList;
    }

    public Student getin4(String username) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Student student = null;

        try {
            // Kết nối cơ sở dữ liệu
            con = new DBHelper.DBContext().getConnection();
            if (con != null) {
                // Câu truy vấn SQL với INNER JOIN
                String sql = "SELECT s.Fullname, s.Firstname, s.Lastname, s.Accid, s.Phone, s.EMail, s.Address, s.Gender, s.Birthdate, s.Idstudent　FROM Student s INNER JOIN Acc a ON s.Accid = a.accid WHERE a.username = ?";

                // Tạo statement và thiết lập tham số
                stm = con.prepareStatement(sql);
                stm.setString(1, username);

                // Thực hiện câu truy vấn
                rs = stm.executeQuery();

                // Xử lý kết quả
                if (rs.next()) {
                    // Lấy dữ liệu từ ResultSet và tạo đối tượng Student
                    String fullname = rs.getString("Fullname");
                    String firstname = rs.getString("Firstname");
                    String lastname = rs.getString("Lastname");
                    String accid = rs.getString("Accid");
                    String phone = rs.getString("Phone");
                    String mail = rs.getString("EMail");
                    String address = rs.getString("Address");
                    String gender = rs.getString("Gender");
                    String birthdate = rs.getString("Birthdate");
                    String idstudent = rs.getString("Idstudent");

                    student = new Student(fullname, firstname, lastname, accid, phone, mail, address, gender, birthdate, idstudent);
                    return student;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý lỗi theo ý của bạn
        } finally {
            // Đóng các tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return null;
    }

    public List<Student> getStudentclass(String Idclass) throws Exception {
        List<Student> Studentclass = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            String sql = "SELECT s.Fullname, s.Firstname, s.Lastname, s.Accid, s.Phone, s.EMail, s.Address, s.Gender, s.Birthdate, s.Idstudent FROM Student s JOIN Manage m  ON m.idacc = s.Accid WHERE m.IDclass = ?";

            stm = con.prepareStatement(sql);
            stm.setString(1, Idclass);
            rs = stm.executeQuery();
            Studentclass = new ArrayList<>();
            while (rs.next()) {
                String fullname = rs.getString("Fullname");
                String firstname = rs.getString("Firstname");
                String lastname = rs.getString("Lastname");
                String accid = rs.getString("Accid");
                String phone = rs.getString("Phone");
                String mail = rs.getString("EMail");
                String address = rs.getString("Address");
                String gender = rs.getString("Gender");
                String birthdate = rs.getString("Birthdate");
                String idstudent = rs.getString("Idstudent");

                Student student = new Student(fullname, firstname, lastname, accid, phone, mail, address, gender, birthdate, idstudent);
                Studentclass.add(student);

            }
        } catch (SQLException | ClassNotFoundException e) {
            // Xử lý lỗi và ném ra ngoại lệ
            throw new Exception("Lỗi khi lấy danh sách lớp học: " + e.getMessage());
        } finally {
            // Đóng tất cả các tài nguyên ở đây nếu cần
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
        return Studentclass;
    }

    public void updateStudentInformation(String accid, String fullname, String firstname, String lastname, String phone, String email, String address, String gender, String birthdate) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBHelper.DBContext().getConnection();
            if (con != null) {
                // Tạo truy vấn SQL để cập nhật thông tin sinh viên
                String sql = "UPDATE student SET fullname = ?, firstname = ?, lastname = ?, phone = ?, email = ?, address = ?, gender = ?, birthdate = ? WHERE accid = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, fullname);
                stm.setString(2, firstname);
                stm.setString(3, lastname);
                stm.setString(4, phone);
                stm.setString(5, email);
                stm.setString(6, address);
                stm.setString(7, gender);
                stm.setString(8, birthdate);
                stm.setString(9, accid);

                // Thực hiện truy vấn cập nhật
                stm.executeUpdate();
            } else {
                // Xử lý khi không kết nối được với cơ sở dữ liệu
                throw new Exception("Không thể kết nối với cơ sở dữ liệu");
            }
        } catch (SQLException e) {
            // Xử lý lỗi SQL
            throw new Exception("Lỗi khi cập nhật thông tin sinh viên: " + e.getMessage());
        } finally {
            // Đóng tài nguyên (Connection, PreparedStatement) ở đây nếu cần thiết
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý lỗi khi đóng tài nguyên
                throw new Exception("Lỗi khi đóng tài nguyên: " + ex.getMessage());
            }
        }
    }

    public void enroll(String idclass, String idacc) throws Exception {
        try ( Connection con = new DBHelper.DBContext().getConnection();  PreparedStatement stm = con.prepareStatement("INSERT INTO Manage (idclass, idacc) VALUES (?, ?)")) {

            if (con != null) {
                stm.setString(1, idclass);
                stm.setString(2, idacc);
                stm.executeUpdate();
            } else {
                // Xử lý khi không kết nối được với cơ sở dữ liệu
                throw new Exception("Không thể kết nối với cơ sở dữ liệu");
            }
        } catch (SQLException e) {
            // Xử lý lỗi SQL
            throw new Exception("Lỗi khi cập nhật thông tin sinh viên: " + e.getMessage());
        }
    }

    public int sendMessageToUser(String idse, String message, String idre) throws Exception {
        int rows = 0;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = new DBContext().getConnection();

            String sql = "INSERT INTO Mess(idse,Noidung, idre) VALUES(?,?,?)";

            stm = conn.prepareStatement(sql);

            stm.setString(1, idse);
            stm.setString(2, message);
            stm.setString(3, idre);
            rows = stm.executeUpdate();

        } catch (SQLException e) {
            throw new Exception("Lỗi gửi tin nhắn đến người dùng");
        }
        stm.close();
        return rows;
    }

    public int sendMessageallUser(String idse, String message) throws Exception {
        int rows = 0;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = new DBContext().getConnection();

            String sql = "INSERT INTO Mess(idse, Noidung, idre)\n"
                    + "SELECT ?, ?, AccID FROM acc WHERE role = 0;";

            stm = conn.prepareStatement(sql);

            stm.setString(1, idse);
            stm.setString(2, message);
            rows = stm.executeUpdate();

        } catch (SQLException e) {
            throw new Exception("Lỗi gửi tin nhắn đến người dùng");
        }
        stm.close();
        return rows;
    }

    public List<Mess> getMessagesByRecipientId(String idre) throws Exception {

        List<Mess> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = new DBContext().getConnection();

            String sql = "SELECT * FROM Mess WHERE idre = ?";

            stm = conn.prepareStatement(sql);
            stm.setString(1, idre);

            rs = stm.executeQuery();

            while (rs.next()) {
                Mess m = new Mess(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));

                list.add(m);
            }

        } catch (SQLException e) {
            throw new Exception("Lỗi lấy tin nhắn");

        } finally {
            // Đóng rs, stm, conn

        }

        return list;
    }
}
// Các phương thức khác của lớp Dao


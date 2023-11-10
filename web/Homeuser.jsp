<%@ page import="dao.Student" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Dto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Student Information</title>
        <style type="text/css">
            h2 {
                text-align: center;
                font-size: 2em;
                font-weight: bold;
            }

            p {
                margin: 0 0 10px 0;
                font-size: 1em;
            }

            form {
                text-align: center;
            }

            input[type="submit"] {
                padding: 5px 10px;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            h2 {
                text-align: center;
                font-size: 2em;
                font-weight: bold;
            }

            p {
                margin: 0 0 10px 0;
                font-size: 1em;
            }

            form {
                text-align: center;
            }

            input[type="submit"] {
                padding: 5px 10px;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .left {
                float: left;
                width: 70%; /* Đặt chiều rộng của phần trái là 50% */
            }

            .right {
                float: right;
                width: 30%; /* Đặt chiều rộng của phần phải là 50% */
            }

            .right img {
                width: 85%; /* Đảm bảo rằng ảnh sẽ fit với phần tử cha */
                margin-top: 6563+px;
            }

            .footer {
                clear: both; /* Xóa float để đảm bảo footer nằm dưới cùng */
                text-align: center;
                margin-top: 20px;
            }

            .footer a, .footer input[type="submit"] {
                margin: 0 10px;
            }
            .tn{
                text-align: left;
            }
        </style>
        <script>
            function showMessage() {
                var message = document.getElementById('messagere');
                if (message.style.display === 'none') {
                    message.style.display = 'block';
                } else {
                    message.style.display = 'none';
                }
            }
            function showSendMessageForm() {
                var form = document.getElementById('sendMessageForm');
                if (form.style.display === 'none') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            }
        </script>
    </head>
    <body>
        <%
                   Dto acc = (Dto) session.getAttribute("account");

           // Kiểm tra xem session có chứa đối tượng Dto không
               String accID = acc.getAccid();
               // Sử dụng giá trị accID theo nhu cầu của bạn trong mã HTML/JSTL tại đây
        %>
        <%
        Student student = (Student) request.getAttribute("studentInfo");
        if (student != null) {
        %>
        <div class="left">
            <h2>Welcome, <%= student.getFullname() %>!</h2>
            <p>Firstname: <%= student.getFirstname() %></p>
            <p>Lastname: <%= student.getLastname() %></p>
            <p>Accid: <%= student.getAccid() %></p>
            <p>Phone: <%= student.getPhone() %></p>
            <p>Email: <%= student.getEMail() %></p>
            <p>Address: <%= student.getAddress() %></p>
            <p>Gender: <%= student.getGender() %></p>
            <p>Birthdate: <%= student.getBirthdate() %></p>
            <p>Idstudent: <%= student.getIdstudent() %></p>
        </div>
        <div class="right">
            <img src="https://icdn.dantri.com.vn/2018/10/8/trang0-1539007753349788751814.jpg" alt="Ảnh từ Internet"></div>
        <button onclick="showMessage()">Message</button> 
        <div id="messagere" style="display:none">
            <table border="3">
                <tr>
                    <th>Nguoi gui</th>
                    <th>Noi dung</th>
                </tr>
                <c:forEach var="li" items="${li}">
                    <tr>       
                        <td><c:out value="${li.idsend}" /></td>
                        <td><c:out value="${li.noidung}" /></td>

                    </tr>
                </c:forEach>
            </table>
        </div>
        <button onclick="showSendMessageForm()">Gửi tin nhắn</button>
        <div id="sendMessageForm" style="display: none">
            <form class="tn" action="sendmessage1" method="post">
                <label for="message">Nhập tin nhắn:</label>

                <input type="text" id="message" name="message"> 
                <input type="submit" value="Send" /> <br>
                <select id="userId" name="idre">
                    <option value="">IDacc</option>
                    <c:forEach var="item" items="${li1}">
                        <option value="<c:out value='${item.accid}'/>"><c:out value='${item.accid}'/></option>
                    </c:forEach>
                </select>
                <%
                              String accid = acc.getAccid();// Lấy giá trị accid từ dữ liệu đăng nhập, chẳng hạn từ database
                %>
                <input type="hidden" name="idse" value="<%= accid %>">

            </form>
            <% 
                      // Hiển thị thông báo lỗi nếu tồn tại
                      String errorMessage = (String) request.getAttribute("err");
                      if (errorMessage != null) {
            %>
            <p class="er" ><%= errorMessage %></p>
            <%
                }
            %>

            <% 
                   // Hiển thị thông báo lỗi nếu tồn tại
           errorMessage = (String) request.getAttribute("mess");
                   if (errorMessage != null) {
            %>
            <p class="er" style="color: red;"><%= errorMessage %></p>
            <%
                }
            %>

        </div>
        <div class="footer">
            <a href="Subjectlist">ListSubject</a>
            <a href="timetable?Id=<%= student.getAccid() %>">Timetable</a>
            <form action="Updatein4student.jsp" method="get">
                <input type="hidden" name="accid" value="<%= student.getAccid() %>">
                <input type="submit" value="Update Information">
            </form>
            <form action="Logout" method="post">
                <input type="submit" value="Logout">
            </form>
        </div>


        <%
        } else {
        %>
        <p>Student information not found!</p>
        <%
        }
        %>

    </body>

</html>

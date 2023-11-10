<%-- 
    Document   : Homeaddmin
    Created on : Oct 10, 2023, 11:31:27 AM
    Author     : NCM
--%>

<%@ page import="dao.Dto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Admin</title>
        <style type="text/css">
            /* CSS code goes here */
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9; /* Màu nền nhạt */
                color: #333; /* Màu chữ chính */
                margin: 0;
                padding: 0;
            }
            h1{
                text-align: center;
            }
            ul {
                display: flex;
                justify-content: space-around;
                list-style-type: none;
                margin: 0;
                padding: 0;
                background-color: #333; /* Màu nền thanh điều hướng */
                overflow: hidden;
            }

            ul li {
                float: left;
            }

            ul li a {
                display: block;
                color: white; /* Màu chữ trên thanh điều hướng */
                text-align: center;
                padding: 14px 20px;
                text-decoration: none;
            }

            ul li a:hover {
                background-color: #555; /* Màu nền khi rê chuột vào */
            }

            hr {
                margin-top: 20px;
                border: none;
                border-top: 1px solid #ccc; /* Đường kẻ ngang nhẹ */


            }
            input[type="submit"] {
                background-color: #333;

                /* Màu chữ mặc định */
                color: white;

                /* Font chữ và kích thước mặc định */
                font-family: Arial, sans-serif;
                font-size: 16px;

                /* Định dạng viền mặc định */
                border: none;
                border-radius: 5px; /* Bo góc */

                /* Hiệu ứng khi di chuột qua nút */
                transition: background-color 0.3s ease;
            }

            /* Hiệu ứng khi di chuột qua nút Logout */
            input[type="submit"].Logout:hover {
                background-color: #555; /* Màu nền khi rê chuột vào */
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
            function toggleUserIdField() {
                var userIdField = document.getElementById('userId');
                var specificRecipient = document.getElementById('specificRecipient').checked;

                if (specificRecipient) {
                    userIdField.style.display = 'block';
                } else {
                    userIdField.style.display = 'none';
                }
            }

        </script>
    </head>
    <body>
        <h1>Welcome Admin</h1>
        <ul>
            <li><a href="Manageacc">ManageAccount</a></li>
            <li><a href="Manageclass">ManageClass</a></li>
            <li><a href="Liststudentforadmin">ListStudent</a></li>
            <li><a href="Diemdanh">Take Attendence</a></li>
            <<li><a href="Logout">Logout</a></li>

        </ul>
        <button onclick="showSendMessageForm()">Gửi tin nhắn</button><br>
        <div id="sendMessageForm" style="display: none">
            <form action="sendmessage" method="post">
                <label for="message">Nhập tin nhắn:</label>

                <input type="text" id="message" name="message"> 
                <input type="submit" value="Send" /> <br>
                <input type="radio" name="recipient" value="all" onchange="toggleUserIdField()" checked> Toàn bộ người dùng

                <input type="radio" name="recipient" id="specificRecipient" value="specific" onchange="toggleUserIdField()"> Người dùng cụ thể  

                <select id="userId" name="idre" style="display:none;">
                    <option value="">IDacc</option>
                    <c:forEach var="item" items="${li}">
                        <option value="<c:out value='${item.accid}'/>"><c:out value='${item.accid}'/></option>
                    </c:forEach>
                </select>
                <%Dto acc = (Dto) session.getAttribute("account");
                     String accid = acc.getAccid();// Lấy giá trị accid từ dữ liệu đăng nhập, chẳng hạn từ database
        %>
                <input type="hidden" name="idse" value="<%= accid %>">

            </form>
        </div>
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
        <button onclick="showMessage()">Message</button> 
        <div id="messagere" style="display:none">
            <table border="3">
                <tr>
                    <th>Nguoi gui</th>
                    <th>Noi dung</th>
                </tr>
                <c:forEach var="li" items="${li2}">
                    <tr>       
                        <td><c:out value="${li.idsend}" /></td>
                        <td><c:out value="${li.noidung}" /></td>

                    </tr>
                </c:forEach>
            </table>
        </div>




    </body>
</html>

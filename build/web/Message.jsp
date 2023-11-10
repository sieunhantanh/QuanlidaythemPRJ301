<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Dto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Form Gửi Tin Nhắn</title>
        <style>

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form-container {
                background-color: #ffffff;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            h2 {
                color: #333;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 10px;
                color: #333;
            }

            .form-group input[type="text"] {
                width: calc(100% - 20px);
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-bottom: 10px;
                color: #333;
            }

            .form-group input[type="radio"] {
                margin-right: 10px;
            }

            .form-group .radio-group label {
                color: #333;
            }

            .form-group input[type="submit"] {
                background-color: #4caf50;
                color: white;
                border: none;
                padding: 12px 24px;
                font-size: 18px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .form-group input[type="submit"]:hover {
                background-color: #45a049;
            }

            .er {
                color: red;
                margin-top: 10px;
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
        <h2>Gửi Tin Nhắn</h2>



        <form action="sendmessage" method="post">
            <label for="message">Nhập tin nhắn:</label>
            <% 
                   // Hiển thị thông báo lỗi nếu tồn tại
                   String errorMessage = (String) request.getAttribute("err");
                   if (errorMessage != null) {
            %>
            <p class="er" ><%= errorMessage %></p>
            <%
                }
            %>
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
            <% 
                   // Hiển thị thông báo lỗi nếu tồn tại
           errorMessage = (String) request.getAttribute("mess");
                   if (errorMessage != null) {
            %>
            <p class="er" style="color: red;"><%= errorMessage %></p>
            <%
                }
            %>
        </form>
    </body>
</html>

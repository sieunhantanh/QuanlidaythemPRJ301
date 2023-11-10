<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>NCM Education</title>
    <style>body {
    font-family: Arial, sans-serif;
}

/* Style cho tiêu đề h1 */
.header {
    text-align: center;
    color: #007bff;
}

/* Style cho form đăng nhập */
.Dangnhap {
    width: 300px;
    margin: 0 auto;
    text-align: center;
}
.er{text-align: center;}
/* Style cho input fields */
input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0 20px 0;
    box-sizing: border-box;
}

/* Style cho nút đăng nhập */
input[type="submit"] {
    width: 100%;
    background-color: #007bff;
    color: white;
    padding: 10px;
    border: none;
    cursor: pointer;
}

/* Style cho thông báo lỗi */
.error1 {
    color: red;
    text-align: center;
    margin-top: 10px;
}</style>

</head>
<body>
    <h1 class="header">NCM Education</h1>
    <br>
    <form class="Dangnhap" action="Login" method="POST">
        Username:<input type="text" name="txtUsername" value="" /><br>
        Password:<input type="password" name="txtPassword" value="" /><br>
        <input type="submit" value="Login" name="btAction" />   
    </form>
    
    <!-- Kiểm tra nếu có thông báo lỗi, hiển thị nó -->
   <% 
        // Hiển thị thông báo lỗi nếu tồn tại
        String errorMessage = (String) request.getAttribute("error");
        if (errorMessage != null) {
    %>
            <p class="er" style="color: red;"><%= errorMessage %></p>
    <%
        }
    %>
</body>
</html>

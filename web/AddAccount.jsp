<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm Tài Khoản Mới</title>
    <style type="text/css">
        body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

form {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 300px;
}

label {
    display: block;
    margin: 10px 0 5px 0;
}

input[type="text"], input[type="password"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="checkbox"] {
    margin-bottom: 10px;
}

input[type="submit"] {
    background-color: #007bff;
    color: #ffffff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

         </style>
</head>
<body>
    <form action="DispatchController" method="post">
        <label for="newUsername">Username:</label>
        <input type="text" id="newUsername" name="newUsername" required><br>
        
        <label for="newPassword">Password:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>
        
        <label for="newRole">Role:</label>
        <input type="checkbox" id="newRole" name="newRole"><br>
        
        <label for="newAccId">Acc ID:</label>
        <input type="text" id="newAccId" name="newAccId" required><br>
        
        <input type="submit" name="action" value="Add New Account">
    </form>
</body>
</html>

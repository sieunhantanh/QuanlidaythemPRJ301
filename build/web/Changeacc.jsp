<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.Dao" %>
<%@ page import="dao.Lophoc" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Change Account</title>
    <style type="text/css">
   body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #007bff;
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
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="checkbox"] {
    margin-bottom: 15px;
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
    </style><
</head>
<body>
 <h1>Changing Account Information for User: ${param.username}</h1>
 <form action="DispatchController" method="post">
     <input type="hidden" id="username" name="username" value="${param.username}" readonly>

        <label for="password">NewPassword:</label>
        <input type="password" id="password" name="password"><br><br>
        
        <label for="role">Role:</label>
        <input type="checkbox" id="role" name="role" value="1" ${account.role == 1 ? 'checked' : ''}> Admin<br><br>  
        <input type="submit" name="action" value="Savechange">
    </form>
</body>
</html>

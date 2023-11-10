<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.Student" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Student Information</title>
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

h1 {
    text-align: center;
    color: #007bff;
    margin-bottom: 30px;
    margin-right: 100px;
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
    margin: -5px 0 5px 0;
    text-align: left;
}

input[type="text"],
input[type="email"],
input[type="date"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
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
    <h1>Update Student Information</h1>
    
    <form action="updatein4" method="post">
        <input type="hidden" id="accid" name="accid" value="${param.accid}" readonly>

        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" required><br><br>
          

        <label for="firstname">First Name:</label>
        <input type="text" id="firstname" name="firstname" required><br><br>
        
        <label for="lastname">Last Name:</label>
        <input type="text" id="lastname" name="lastname" required><br><br>
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br><br>
       <label for="gender">Gender:</label>
    <select id="gender" name="gender" required>
    <option value="male">Male</option>
    <option value="female">Female</option>
    <option value="other">Other</option>
</select><br><br>

        
        <label for="birthdate">Birthdate:</label>
        <input type="date" id="birthdate" name="birthdate" required><br><br>
        
        <input type="submit" value="Update">
    </form>
</body>
</html>

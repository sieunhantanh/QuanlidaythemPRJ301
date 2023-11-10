<%-- 
    Document   : Addclass
    Created on : Oct 23, 2023, 9:32:03 PM
    Author     : NCM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 5px;
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    }

    label, input {
        margin-bottom: 10px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>

    </head>
    <body>
       <form action="DispatchController" method="post">
        <label for="newIDclass">NewIDclass:</label>
        <input type="text" id="newIDclass" name="newIDclass" required><br>
        
        <label for="newNameclass">NewNameclass:</label>
        <input type="Nameclass" id="newNameclass" name="newNameclass" required><br>

        <label for="newubject">Subject:</label>
        <input type="text" id="newubject" name="newubject" required><br>
<label for="timestart">Time Start:</label>
<input type="text" id="timestart" name="timestart" required><br>

<label for="timeend">Time End:</label>
<input type="text" id="timeend" name="timeend" required><br>

        <input type="submit" name="action" value="Add New Class">
    </form>
    </body>
</html>

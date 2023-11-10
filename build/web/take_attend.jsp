<%-- 
    Document   : ListStudentforadmin
    Created on : Oct 30, 2023, 5:10:15 PM
    Author     : NCM
--%>
<%@ page import="java.util.List" %>
<%@ page import="dao.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #cce5ff;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #ff0000;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
        h1{
            text-align: center;
            color: blue;
            
        }
    </style>
    </head>
    <body>
        <form action="Diemdanh"  method="post">
        <h1> List Student in System</h1>
        <div class="card-toolbar ms-3">
                    <button class="btn btn-outline btn-outline-dashed btn-outline-success btn-active-light-success" type="submit">Điểm danh</button>
                </div>
        <c:catch var="catchException">
            <table border="1">
                <tr>
                    <th></th>
                    <th>IDstudent</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Fullname</th>
                    <th>Accid</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Gender</th>
                    <th>Birthdate</th>

                </tr>
                <c:forEach var="lop" items="${li123}">
                    <tr>
                        <td>
                                    <input style="padding:5px;" type="checkbox" name="studentIds" value="${lop.idstudent}" />
                                </td>
                        <td><c:out value="${lop.idstudent}" /></td>
                        <td><c:out value="${lop.fistname}" /></td>
                        <td><c:out value="${lop.lastname}" /></td>
                        <td><c:out value="${lop.fullname}" /></td>
                        <td><c:out value="${lop.accid}" /></td>
                        <td><c:out value="${lop.phone}" /></td>
                        <td><c:out value="${lop.email}" /></td>
                        <td><c:out value="${lop.address}" /></td>
                        <td><c:out value="${lop.gender}" /></td>
                        <td><c:out value="${lop.birthdate}" /></td>

                    </tr>
                </c:forEach>
            </table>
        </c:catch>
        </form>
    </body>
</html>

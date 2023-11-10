<%-- 
    Document   : ListSubject
    Created on : Oct 24, 2023, 2:49:17 PM
    Author     : NCM
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.Lophoc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        table {
            width: 50%;
            margin: 50px auto;
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
    </style>
    </head>
    <body>
      <c:catch var="catchException">
            <table border="1">
                <tr>
                    <th>ListSubject</th>
                </tr>
                <c:forEach var="lop" items="${LopList}">
                    <tr>
                        <td><a href="ListClassesServlet?nameclass=<c:out value="${lop.namesubject}" />"><c:out value="${lop.namesubject}" /></a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:catch>
    </body>
</html>

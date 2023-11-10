<%-- 
    Document   : listclasswithstudent
    Created on : Oct 30, 2023, 9:46:39 AM
    Author     : NCM
--%>
<%@ page import="java.util.List" %>
<%@ page import="dao.Lophoc" %>
<%@ page import="dao.Dto" %>
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
    </style>
    </head>
    <body>
      <h1>Time table</h1>
        <c:catch var="catchException">
            <table border="1">
                <tr>
                    <th>IDclass</th>
                    <th>Tenlop</th>
                    <th>Time Start</th>
                     <th>Time End</th>
                </tr>
                <c:forEach var="lop" items="${studentClass}">
                    <tr>
                        <td><a href="ine4class?idclass=<c:out value="${lop.idclass}" />"><c:out value="${lop.idclass}" /></a></td>
                        <td><c:out value="${lop.nameclass}" /></td>
                         <td><c:out value="${lop.timestart}" /></td>
                        <td><c:out value="${lop.timeend}" /></td>
                    </tr>
                </c:forEach>
            </table>
            
        </c:catch>

        <c:if test="${not empty catchException}">
            <!-- In ra thông báo lỗi -->
            Lỗi xảy ra: <c:out value="${catchException.message}" />

        </c:if>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.Lophoc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách lớp học</title>
        <style>
            /* CSS code goes here */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                background-color: #007bff;
                color: white;
                padding: 20px 0;
                margin: 0;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            a {
                color: #007bff;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Danh sách lớp học</h1>
        <c:catch var="catchException">
            <table border="1">
                <tr>
                    <th>IDclass</th>
                    <th>Tenlop</th>
                    <th>Mon</th>
                    <th>TimeStart</th>
                    <th>TimeEnd</th>
                </tr>
                <c:forEach var="lop" items="${LopList}">
                    <tr>
                        <td><a href="ine4class?idclass=<c:out value="${lop.idclass}" />"><c:out value="${lop.idclass}" /></a></td>
                        <td><c:out value="${lop.nameclass}" /></td>
                        <td><c:out value="${lop.subject}" /></td>
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
        <form action="Addclass.jsp">
            <button type="submit">Add new class</button>
        </form>

    </body>
</html>

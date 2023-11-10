<%@ page import="java.util.List" %>
<%@ page import="dao.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>List of Students in Class</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form action="Diemdanh" method="post">
    <table>
        <thead>
            <tr>
                <th>Fullname</th>
                <th>Accid</th>
            <th>Diemdanh</th>
                <!-- ...các cột khác... -->
            </tr>
        </thead>
        <tbody>
            <% for (Student student : (List<Student>)request.getAttribute("studentClass")) { %>
                <tr>
                    <td><%= student.getFullname() %></td>
                    <td><%= student.getAccid() %></td>
                    <td><input type="checkbox" name="attendanceList" value="<%=student.getAccid()%>"></td>
                </tr>
            <% } %>
        </tbody>
    </table>
        <input type="submit" value="DiemDanh" />
        </form>
</body>
</html>

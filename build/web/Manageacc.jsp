<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ManageAcc</title>
        <style type="text/css">
            /* CSS code goes here */
            body {
                font-family: Arial, sans-serif;
            }
            h1{text-align: center;
                
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
            }

            button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>

    <body>
        <h1> Manage Information of Account</h1>
        <table>
            <!-- Các tr??ng d? li?u hi?n th? danh sách tài kho?n -->
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
                <th>Acc ID</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="account" items="${accounts}">
                <tr>
                    <!-- Các ô hi?n th? thông tin tài kho?n -->
                    <td>${account.username}</td>
                    <td>${account.password}</td>
                    <td>
                        <c:choose>
                            <c:when test="${account.role == 1}">
                                Admin
                            </c:when>
                            <c:otherwise>
                                User
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${account.accid}</td>
                    <td>
                        <form action="DispatchController" method="post" style="display: inline;">
                            <input type="hidden" name="username" value="${account.username}">
                            <input type="submit" name="action" value="Delete">
                        </form>
                        <form action="Changeacc.jsp" method="post" style="display: inline;">
                            <input type="hidden" name="username" value="${account.username}">
                            <input type="submit" name="action" value="Change Account">
                        </form>

                    </td>
                </tr>
            </c:forEach>
        </table>


        <form action="AddAccount.jsp">
            <button type="submit">Add new account</button>
        </form>

    </body>
</html>

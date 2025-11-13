<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.User" %>

<%
    List<User> userList = (List<User>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Users Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<header>
    <h1>Users Management</h1>
    <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <div class="top-btns">
        <a href="dashboard" class="back-btn">← Back to Dashboard</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
                <th>Date of Birth</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% if(userList != null && !userList.isEmpty()) { 
                for(User u : userList) { %>
                <tr>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getFirstName() %></td>
                    <td><%= u.getLastName() %></td>
                    <td><%= u.getRole() %></td>
                    <td><%= u.getDob() %></td>
                    <td>
                        <a href="users?action=delete&email=<%= u.getEmail() %>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                    </td>
                </tr>
            <% } } else { %>
                <tr>
                    <td colspan="6" style="text-align:center;">No users available</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>

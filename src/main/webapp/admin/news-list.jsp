<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.News" %>
<%
    List<News> newsList = (List<News>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>News Management</title>
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<header>
    <h1>News Management</h1>
    <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <div class="top-btns">
        <a href="dashboard" class="back-btn">← Back to Dashboard</a>
        <a href="<%= request.getContextPath() %>/admin/news?action=new" class="add-btn">+ Add New News</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Image</th>
                <th>Created Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% if (newsList != null && !newsList.isEmpty()) {
            for (News n : newsList) { %>
            <tr>
                <td><%= n.getTitle() %></td>
                <td>
                    <img src="<%= request.getContextPath() + "/" + (n.getImageUrl() != null ? n.getImageUrl() : "images/default.jpg") %>"
                         class="table-img">
                </td>
                <td><%= n.getCreatedAt() != null ? n.getCreatedAt() : "—" %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/admin/news?action=edit&id=<%= n.getId()%>" class="btn-edit">Edit</a>
                    <a href="<%= request.getContextPath() %>/admin/news?action=delete&id=<%= n.getId() %>" class="btn-delete" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        <% } } else { %>
            <tr>
                <td colspan="4" style="text-align:center;">No news available.</td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>

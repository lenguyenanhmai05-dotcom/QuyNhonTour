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
</head>
<body>

<div class="sidebar">
    <h2>🧭 Admin Panel</h2>
    <a href="dashboard">🏠 Dashboard</a>
    <a href="tour-list.jsp">📍 Tours Management</a>
    <a href="<%= request.getContextPath() %>/admin/news" class="active">📰 News Management</a>
    <a href="users-list.jsp">👤 Users Management</a>
    <a href="orders-list.jsp">🧾 Orders Management</a>
    <a href="admin-booking.jsp">📦 Bookings Management</a>
</div>

<div class="main">
    <div class="header">
        <h1>News Management</h1>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>

    <div>
        <a href="dashboard" class="back-btn">← Back to Dashboard</a>
        <a href="<%= request.getContextPath() %>/admin/news?action=new" class="add-btn">+ Add New News</a>
    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>Title</th>
                <th>Image</th>
                <th>Created Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% if (newsList != null && !newsList.isEmpty()) { %>
                <% for (News n : newsList) { %>
                    <tr>
                        <td><%= n.getTitle() %></td>
                        <td>
                            <img src="<%= request.getContextPath() + "/" + (n.getImageUrl() != null ? n.getImageUrl() : "images/default.jpg") %>"
     width="100" height="60" style="object-fit:cover;border-radius:6px;">
                        </td>
                        <td><%= n.getCreatedAt() != null ? n.getCreatedAt() : "—" %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/admin/news?action=edit&id=<%= n.getId() %>"
                               style="background:#f1c40f;color:black;padding:6px 10px;border-radius:4px;text-decoration:none;">Edit</a>

                            <a href="<%= request.getContextPath() %>/admin/news?action=delete&id=<%= n.getId() %>"
                               style="background:#e74c3c;color:white;padding:6px 10px;border-radius:4px;text-decoration:none;"
                               onclick="return confirm('Are you sure you want to delete this news?')">Delete</a>
                        </td>
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="4" style="text-align:center;">No news available.</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>

<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.Tour" %>
<%@ page import="com.quynhontours.dao.TourDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TourDAO dao = new TourDAO();
    List<Tour> tours = dao.getAllTours();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tour Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f4f4f4;
        }
        h1 { text-align: center; }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background: #333;
            color: white;
        }
        a, button {
            text-decoration: none;
            color: white;
            padding: 6px 10px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }
        .add-btn { background: #28a745; margin-bottom: 15px; display: inline-block; }
        .edit-btn { background: #ffc107; color: black; }
        .delete-btn { background: #dc3545; }
        a:hover, button:hover { opacity: 0.85; }
        form { display: inline; }
    </style>
</head>
<body>

<h1>Tour Management</h1>

<a href="<%=request.getContextPath()%>/admin/tour-form.jsp" class="add-btn">+ Add New Tour</a>

<table>
    <thead>
    <tr>
        <th>ID</th><th>Name</th><th>Description</th><th>Location</th>
        <th>Price (VND)</th><th>Start Date</th><th>End Date</th><th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (tours != null && !tours.isEmpty()) {
            for (Tour t : tours) {
    %>
    <tr>
        <td><%= t.getId() %></td>
        <td><%= t.getName() %></td>
        <td><%= t.getDescription() %></td>
        <td><%= t.getLocation() %></td>
        <td><%= String.format("%,.0f", t.getPrice()) %></td>
        <td><%= t.getStartDate() %></td>
        <td><%= t.getEndDate() %></td>
        <td>
            <a href="<%=request.getContextPath()%>/admin/tours?action=edit&id=<%=t.getId()%>" class="edit-btn">Edit</a>
            <form action="<%=request.getContextPath()%>/admin/deleteTour" method="post">
                <input type="hidden" name="id" value="<%=t.getId()%>">
                <button type="submit" class="delete-btn" onclick="return confirm('Delete this tour?');">Delete</button>
            </form>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="8">No tours found.</td></tr>
    <% } %>
    </tbody>
</table>

</body>
</html>

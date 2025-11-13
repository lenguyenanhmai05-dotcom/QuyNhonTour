<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.Tour" %>
<%@ page import="com.quynhontours.dao.TourDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TourDAO dao = new TourDAO();
    List<Tour> tours = dao.getAllTours();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Tour Management</title>
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<header>
    <h1>Tour Management</h1>
    <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <div class="top-btns">
        <a href="dashboard" class="back-btn">← Back to Dashboard</a>
        <a href="tour-form.jsp" class="add-btn">+ Add New Tour</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Location</th>
                <th>Departure</th>
                <th>Destination</th>
                <th>Duration</th>
                <th>Start</th>
                <th>End</th>
                <th>Adult Price</th>
                <th>Child Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% if (tours != null && !tours.isEmpty()) {
            for (Tour t : tours) { %>
            <tr>
                <td><%= t.getId() %></td>
                <td><%= t.getName() %></td>
                <td><%= t.getLocation() %></td>
                <td><%= t.getDeparture() %></td>
                <td><%= t.getDestination() %></td>
                <td><%= t.getDuration() %></td>
                <td><%= t.getStartDate() %></td>
                <td><%= t.getEndDate() %></td>
                <td><%= String.format("%,.0f", t.getAdultPrice()) %>₫</td>
                <td><%= String.format("%,.0f", t.getChildPrice()) %>₫</td>
                <td>
                    <a href="<%=request.getContextPath()%>/admin/tours?action=edit&id=<%=t.getId()%>" class="btn-edit">Edit</a>
                    <form action="<%=request.getContextPath()%>/admin/deleteTour" method="post" class="form-inline">
                        <input type="hidden" name="id" value="<%=t.getId()%>">
                        <button type="submit" class="btn-delete">Delete</button>
                    </form>
                </td>
            </tr>
        <% } } else { %>
            <tr><td colspan="11" style="text-align:center;">No tours available.</td></tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>

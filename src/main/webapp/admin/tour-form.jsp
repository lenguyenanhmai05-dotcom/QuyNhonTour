<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quynhontours.model.Tour" %>

<%
    Tour tour = (Tour) request.getAttribute("tour");
    boolean editing = (tour != null);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><%= editing ? "Edit Tour" : "Add New Tour" %></title>
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f3f6fb;
        margin: 0;
        padding: 0;
        color: #2c3e50;
    }

    header {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 24px;
        background: linear-gradient(135deg, #3b82f6, #1e40af, #60a5fa);
        color: #fff;
        text-align: center;
        box-shadow: 0 3px 8px rgba(0,0,0,0.15);
    }

    header h1 {
        margin: 0;
        font-size: 30px;
        font-weight: 600;
    }

    .logout-btn {
        color: #fff;
        text-decoration: none;
        margin-top: 10px;
        font-weight: 500;
        border: 1px solid rgba(255,255,255,0.3);
        padding: 6px 14px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }

    .logout-btn:hover {
        background: rgba(255,255,255,0.2);
    }

    .form-container {
        background: #fff;
        max-width: 800px;
        margin: 50px auto;
        padding: 40px 50px;
        border-radius: 14px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    .form-container h2 {
        text-align: center;
        color: #2563eb;
        margin-bottom: 25px;
        font-size: 28px;
    }

    .form-group {
        margin-bottom: 18px;
    }

    label {
        display: block;
        font-weight: 600;
        color: #333;
        margin-bottom: 8px;
    }

    input[type="text"],
    input[type="number"],
    textarea {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        transition: border 0.2s ease;
    }

    input:focus, textarea:focus {
        border-color: #2563eb;
        outline: none;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
    }

    textarea {
        resize: vertical;
        min-height: 150px;
    }

    .btn-group {
        text-align: center;
        margin-top: 30px;
    }

    .save-btn {
        background: linear-gradient(135deg, #2563eb, #1d4ed8);
        color: #fff;
        padding: 12px 28px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .save-btn:hover {
        transform: translateY(-2px);
        background: linear-gradient(135deg, #1d4ed8, #1e40af);
    }

    .back-btn {
        display: inline-block;
        background: #e5e7eb;
        color: #333;
        padding: 12px 26px;
        text-decoration: none;
        border-radius: 8px;
        margin-left: 10px;
        transition: all 0.3s ease;
    }

    .back-btn:hover {
        background: #d1d5db;
        transform: translateY(-2px);
    }
</style>
</head>
<body>

<header>
    <h1><%= editing ? "Edit Tour" : "Add New Tour" %></h1>
    <a href="<%= request.getContextPath().trim() %>/logout" class="logout-btn">Logout</a>
</header>

<div class="form-container">
    <form action="<%= request.getContextPath().trim() %><%= editing ? "/admin/updateTour" : "/admin/addTour" %>" method="post">
        <% if (editing) { %>
            <input type="hidden" name="id" value="<%= tour.getId() %>">
        <% } %>

        <div class="form-group">
            <label>Tour Name</label>
            <input type="text" name="name" value="<%= editing ? tour.getName() : "" %>" required>
        </div>

        <div class="form-group">
            <label>Location</label>
            <input type="text" name="location" value="<%= editing ? tour.getLocation() : "" %>" required>
        </div>

        <div class="form-group">
            <label>Departure</label>
            <input type="text" name="departure" value="<%= editing ? tour.getDeparture() : "" %>">
        </div>

        <div class="form-group">
            <label>Destination</label>
            <input type="text" name="destination" value="<%= editing ? tour.getDestination() : "" %>">
        </div>

        <div class="form-group">
            <label>Duration</label>
            <input type="text" name="duration" value="<%= editing ? tour.getDuration() : "" %>">
        </div>

        <div class="form-group">
            <label>Start Date</label>
            <input type="text" name="startDate" value="<%= editing ? tour.getStartDate() : "" %>">
        </div>

        <div class="form-group">
            <label>End Date</label>
            <input type="text" name="endDate" value="<%= editing ? tour.getEndDate() : "" %>">
        </div>

        <div class="form-group">
            <label>Adult Price</label>
            <input type="number" step="0.01" name="adultPrice" value="<%= editing ? tour.getAdultPrice() : "" %>">
        </div>

        <div class="form-group">
            <label>Child Price</label>
            <input type="number" step="0.01" name="childPrice" value="<%= editing ? tour.getChildPrice() : "" %>">
        </div>

        <div class="form-group">
            <label>Image URL</label>
            <input type="text" name="image" value="<%= editing ? tour.getImage() : "" %>">
        </div>

        <div class="form-group">
            <label>Description</label>
            <textarea name="description" required><%= editing ? tour.getDescription() : "" %></textarea>
        </div>

        <div class="btn-group">
            <button type="submit" class="save-btn">💾 Save</button>
            <a href="<%= request.getContextPath().trim() %>/admin/tour-list.jsp" class="back-btn">← Back</a>
        </div>
    </form>
</div>

</body>
</html>

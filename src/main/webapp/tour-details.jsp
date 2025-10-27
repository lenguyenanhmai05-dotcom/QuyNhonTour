<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quynhontours.model.Tour" %>
<%
    Tour tour = (Tour) request.getAttribute("tour");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= tour != null ? tour.getName() : "Tour Details" %></title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fffaf6;
            margin: 40px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }
        img {
            width: 100%;
            border-radius: 12px;
            margin-bottom: 20px;
        }
        h2 { color: #d9534f; }
        p { color: #333; }
    </style>
</head>
<body>
<div class="container">
    <% if (tour != null) { %>
        <img src="<%= tour.getImage() %>" alt="<%= tour.getName() %>">
        <h2><%= tour.getName() %></h2>
        <p><b>📍 Location:</b> <%= tour.getLocation() %></p>
        <p><b>🚌 Departure:</b> <%= tour.getDeparture() %></p>
        <p><b>⏱ Duration:</b> <%= tour.getDuration() %></p>
        <p><b>💰 Price:</b> <%= String.format("%,.0f VNĐ", tour.getPrice()) %></p>
        <p><b>🗓 From:</b> <%= tour.getStartDate() %> → <%= tour.getEndDate() %></p>
        <p><b>📝 Description:</b> <%= tour.getDescription() %></p>
    <% } else { %>
        <h2>Tour not found</h2>
    <% } %>
</div>
</body>
</html>

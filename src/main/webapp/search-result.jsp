<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.Tour" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fffaf6;
            margin: 40px;
        }

        h2 {
            text-align: center;
            color: #2f2f2f;
            margin-bottom: 30px;
        }

        /* Grid layout */
        .tour-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
            justify-items: center;
        }

        /* Tour card */
        .tour-card {
            background: #fff;
            border: 1px solid #f2c8b6;
            border-radius: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            overflow: hidden;
            width: 100%;
            max-width: 360px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .tour-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 18px rgba(0,0,0,0.15);
        }

        /* Image */
        .tour-img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }

        /* Text section */
        .tour-content {
            padding: 16px 18px 20px;
        }

        .tour-content h3 {
            margin: 0 0 10px;
            color: #d9534f;
            font-size: 18px;
        }

        .tour-info {
            font-size: 15px;
            color: #444;
            margin: 4px 0;
        }

        .price {
            color: #28a745;
            font-weight: bold;
        }

        /* Buttons */
        .buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 14px;
        }

        .btn {
            padding: 8px 14px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: opacity 0.2s ease;
        }

        .btn-details {
            background-color: #007bff;
            color: white;
        }

        .btn-add {
            background-color: #f46f3a;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }

        /* Empty message */
        .no-result {
            text-align: center;
            color: #666;
            margin-top: 40px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<h2>Search Results</h2>

<div class="tour-container">
    <%
        List<Tour> tours = (List<Tour>) request.getAttribute("tours");
        if (tours != null && !tours.isEmpty()) {
            for (Tour t : tours) {
    %>
        <div class="tour-card">
            <img class="tour-img"
                 src="<%= (t.getImage() != null && !t.getImage().isEmpty())
                         ? t.getImage()
                         : "images/default.jpg" %>"
                 alt="<%= t.getName() %>">

            <div class="tour-content">
    <h3><%= t.getName() %></h3>

    <div class="tour-info">📍 <b>Location:</b> <%= t.getLocation() %></div>
    <div class="tour-info">🚌 <b>Departure:</b> <%= t.getDeparture() %></div>
    <div class="tour-info">🎯 <b>Destination:</b> <%= t.getDestination() %></div>
    <div class="tour-info">⏱ <b>Duration:</b> <%= t.getDuration() %></div>

    <div class="tour-info">💰 <b>Adult Price:</b>
        <span class="price"><%= String.format("%,.0f VND", t.getAdultPrice()) %></span>
    </div>
    <div class="tour-info">👶 <b>Child Price:</b>
        <span class="price"><%= String.format("%,.0f VND", t.getChildPrice()) %></span>
    </div>

    <div class="tour-info">📅 <b>From:</b> <%= t.getStartDate() %> → <%= t.getEndDate() %></div>

                <div class="buttons">
                    <a href="TourDetailsServlet?id=<%= t.getId() %>" class="btn btn-details">Details</a>
                    <a href="AddToCartServlet?id=<%= t.getId() %>" class="btn btn-add">Add to Cart</a>
                </div>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <p class="no-result">No tours found for your search.</p>
    <%
        }
    %>
</div>

</body>
</html>

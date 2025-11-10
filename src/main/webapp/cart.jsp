<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ page import="java.util.*, com.quynhontours.model.Tour" %>

<html>
<head>
    <title>Your Cart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(180deg, #fff7f3, #fffaf7);
            margin: 0;
            padding: 50px 0 80px;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            font-weight: 600;
            color: #222;
            margin-bottom: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        h2::before {
            content: "🛍️";
            font-size: 28px;
        }

        .cart-table {
            width: 85%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }

        th, td {
            padding: 16px;
            text-align: center;
            font-size: 15px;
            border-bottom: 1px solid #f1e3d9;
        }

        th {
            background: #fff1e5;
            color: #444;
            font-weight: 600;
            letter-spacing: 0.2px;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: #fff8f4;
        }

        img {
            width: 120px;
            height: 80px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .btn {
            padding: 10px 22px;
            border-radius: 8px;
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            font-size: 14px;
            display: inline-block;
            border: none;
            cursor: pointer;
            transition: all 0.25s ease;
            min-width: 100px;
        }

        .btn-remove {
            background: linear-gradient(135deg, #ff4b2b, #ff416c);
            box-shadow: 0 3px 10px rgba(255, 65, 108, 0.3);
        }

        .btn-book {
            background: linear-gradient(135deg, #00c853, #43a047);
            box-shadow: 0 3px 10px rgba(0, 200, 83, 0.3);
        }

        .btn:hover {
            transform: translateY(-2px);
            filter: brightness(1.08);
        }

        .total {
            width: 85%;
            margin: 25px auto;
            text-align: right;
            font-size: 18px;
            color: #2f2f2f;
            font-weight: 600;
        }

        .empty {
            text-align: center;
            font-size: 18px;
            color: #777;
            margin-top: 60px;
        }

        .nav-btns {
            text-align: center;
            margin-top: 45px;
        }

        .back-btn {
            background: linear-gradient(135deg, #ff7e5f, #ff4b2b);
            color: #fff;
            padding: 13px 30px;
            border-radius: 10px;
            font-weight: 600;
            text-decoration: none;
            font-size: 15px;
            box-shadow: 0 5px 15px rgba(255, 120, 100, 0.3);
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            transform: translateY(-2px);
            filter: brightness(1.1);
        }

        @media (max-width: 768px) {
            .cart-table {
                width: 95%;
                font-size: 14px;
            }
            .btn {
                padding: 8px 14px;
                min-width: 80px;
            }
            img {
                width: 90px;
                height: 60px;
            }
        }
    </style>
</head>

<body>

<h2>Your Cart</h2>

<%
    List<Tour> cart = (List<Tour>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p class="empty">Your cart is empty 😢</p>
<%
    } else {
        double total = 0;
%>
    <table class="cart-table">
        <tr>
            <th>Image</th>
            <th>Tour Name</th>
            <th>Location</th>
            <th>Adult Price</th>
            <th>Child Price</th>
            <th>Action</th>
        </tr>

        <%
            for (Tour tour : cart) {
                total += tour.getAdultPrice();
        %>
        <tr>
            <td><img src="<%= tour.getImage() %>" alt="<%= tour.getName() %>"></td>
            <td><%= tour.getName() %></td>
            <td><%= tour.getLocation() %></td>
            <td style="color:#00c853; font-weight:600;">
                <%= String.format("%,.0f VNĐ", tour.getAdultPrice()) %>
            </td>
            <td style="color:#ff6f00; font-weight:600;">
                <%= String.format("%,.0f VNĐ", tour.getChildPrice()) %>
            </td>
            <td>
                <div style="display:flex; justify-content:center; gap:10px;">
                    <a href="RemoveFromCartServlet?id=<%= tour.getId() %>" class="btn btn-remove">Remove</a>
                    <form action="booking.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="tourId" value="<%= tour.getId() %>">
                        <input type="hidden" name="tourName" value="<%= tour.getName() %>">
                        <input type="hidden" name="tourImage" value="<%= tour.getImage() %>">
                        <input type="hidden" name="adultPrice" value="<%= (int) tour.getAdultPrice() %>">
                        <input type="hidden" name="childPrice" value="<%= (int) tour.getChildPrice() %>">
                        <button type="submit" class="btn btn-book">Book Now</button>
                    </form>
                </div>
            </td>
        </tr>
        <% } %>
    </table>

    <div class="total">
        <b>Total (Adult price only):</b> <%= String.format("%,.0f VNĐ", total) %>
    </div>
<%
    }
%>

<!-- ✅ Only Back button -->
<%
    String lastDeparture = (String) session.getAttribute("lastDeparture");
    String lastDestination = (String) session.getAttribute("lastDestination");
    String lastDate = (String) session.getAttribute("lastDate");
    String lastDuration = (String) session.getAttribute("lastDuration");

    String backUrl = "SearchTourServlet?";
    if (lastDeparture != null) backUrl += "departure=" + lastDeparture + "&";
    if (lastDestination != null) backUrl += "destination=" + lastDestination + "&";
    if (lastDate != null) backUrl += "date=" + lastDate + "&";
    if (lastDuration != null) backUrl += "duration=" + lastDuration;
%>

<div class="nav-btns">
    <a href="<%= backUrl %>" class="back-btn">⬅ Back to Search Results</a>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>

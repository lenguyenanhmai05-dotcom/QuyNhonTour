<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.quynhontours.model.Tour" %>

<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #fffaf6;
            margin: 40px;
        }
        h2 {
            text-align: center;
            color: #2f2f2f;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
        }
        th, td {
            border-bottom: 1px solid #f2c8b6;
            padding: 14px;
            text-align: center;
            font-size: 15px;
        }
        th {
            background-color: #ffe3d6;
            color: #333;
        }
        img {
            width: 120px;
            border-radius: 12px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .btn {
            padding: 9px 18px;
            border-radius: 10px;
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            margin: 3px;
            display: inline-block;
            transition: all 0.25s ease;
        }
        .btn-remove {
            background: #dc3545;
        }
        .btn-remove:hover {
            background: #b52a38;
            transform: translateY(-2px);
        }
        .btn-book {
            background: #28a745;
        }
        .btn-book:hover {
            background: #208a3a;
            transform: translateY(-2px);
        }
        .total {
            text-align: right;
            margin: 20px auto;
            width: 80%;
            font-size: 18px;
            font-weight: 500;
            color: #2f2f2f;
        }
    </style>
</head>
<body>

<h2>🛒 Your Cart</h2>

<%
    List<Tour> cart = (List<Tour>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p style="text-align:center; font-size:18px; color:#555;">Your cart is empty 😢</p>
<%
    } else {
        double total = 0;
%>
    <table>
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
                total += tour.getAdultPrice(); // ✅ chỉ tính tạm theo giá người lớn
        %>
        <tr>
            <td><img src="<%= tour.getImage() %>" alt="<%= tour.getName() %>"></td>
            <td><%= tour.getName() %></td>
            <td><%= tour.getLocation() %></td>
            <td style="color:#28a745; font-weight:600;">
                <%= String.format("%,.0f VNĐ", tour.getAdultPrice()) %>
            </td>
            <td style="color:#ff6f00; font-weight:600;">
                <%= String.format("%,.0f VNĐ", tour.getChildPrice()) %>
            </td>
            <td>
                <a href="RemoveFromCartServlet?id=<%= tour.getId() %>" class="btn btn-remove">Remove</a>
                <form action="BookNowServlet" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= tour.getId() %>">
                    <button type="submit" class="btn btn-book">Book Now</button>
                </form>
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

<!-- ✅ Nút quay lại trang tìm kiếm trước đó -->
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

<div style="text-align:center; margin-top: 30px;">
    <a href="<%= backUrl %>" 
       style="display:inline-block; background:#f97316; color:#fff; 
              padding:12px 28px; border-radius:10px; text-decoration:none; 
              font-weight:600; margin-right:15px; transition:all 0.3s ease;">
        ⬅ Back to Search Results
    </a>

    <a href="index.jsp" 
       style="display:inline-flex; align-items:center; 
              background: linear-gradient(135deg, #4facfe, #00f2fe);
              color:#fff; padding:12px 28px; border-radius:10px; 
              text-decoration:none; font-weight:600; 
              box-shadow:0 3px 8px rgba(0,0,0,0.2);
              transition:all 0.3s ease;">
        🏠 <span style="margin-left:8px;">Home</span>
    </a>
</div>

<style>
a:hover {
    transform: translateY(-2px);
    filter: brightness(1.1);
}
</style>


</body>
</html>

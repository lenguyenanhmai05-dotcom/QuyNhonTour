<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.quynhontours.model.Booking" %>

<%
    Booking booking = (Booking) request.getAttribute("booking");
    if (booking == null) {
        String paid = request.getParameter("paid");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Result</title>
    <style>
        body { font-family: Arial; margin: 50px; background: #fafafa; }
        .card { background: #fff; padding: 25px; border-radius: 10px; box-shadow: 0 2px 8px #ccc; width: 400px; margin: auto; text-align:center; }
        .paid { color: green; font-weight: bold; }
        .pending { color: orange; font-weight: bold; }
    </style>
</head>
<body>
<div class="card">
    <% if ("true".equals(paid)) { %>
        <h2>🎉 Payment Successful!</h2>
        <p class="paid">Your booking has been paid successfully.</p>
        <p>We look forward to welcoming you on your Quy Nhon Tour!</p>
    <% } else { %>
        <h2>Booking Confirmed ✅</h2>
        <p class="pending">Your booking is pending confirmation.</p>
        <p>Our staff will contact you soon.</p>
    <% } %>
</div>
</body>
</html>

<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Details</title>
    <style>
        body { font-family: Arial; margin: 50px; background: #fafafa; }
        .card { background: #fff; padding: 25px; border-radius: 10px; box-shadow: 0 2px 8px #ccc; width: 400px; margin: auto; }
        .status { color: orange; font-weight: bold; }
    </style>
</head>
<body>
<div class="card">
    <h2>Booking Received ✅</h2>
    <p>Tour: <b><%= booking.getTourName() %></b></p>
    <p>Guests: <%= booking.getGuests() %></p>
    <p>Payment Method: <%= booking.getPaymentMethod() %></p>
    <p>Status: <span class="status"><%= booking.getPaymentStatus() %></span></p>
    <p>We will confirm your booking soon.</p>
</div>
</body>
</html>

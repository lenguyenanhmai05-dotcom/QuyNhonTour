<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quynhontours.dao.BookingDAO, com.quynhontours.model.Booking" %>
<%
    String bookingId = request.getParameter("bookingId");
    String paid = request.getParameter("paid");

    Booking booking = null;
    if (bookingId != null && !bookingId.isEmpty()) {
        BookingDAO dao = new BookingDAO();
        booking = dao.getById(bookingId); // dùng getById() đúng với BookingDAO
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Status - Quy Nhon Tour</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background: #f6f8fb; margin: 0; padding: 0; }
        .container { max-width: 480px; background: #fff; margin: 80px auto; border-radius: 12px;
                     box-shadow: 0 6px 18px rgba(0,0,0,0.1); text-align: center; padding: 40px; }
        h2 { margin-bottom: 10px; }
        .success { color: #27ae60; }
        .pending { color: #f39c12; }
        p { font-size: 16px; color: #555; margin: 6px 0; }
        .btn-view { display: inline-block; margin-top: 20px; text-decoration: none;
                    color: white; background: #3498db; padding: 10px 25px;
                    border-radius: 8px; transition: 0.3s; }
        .btn-view:hover { background: #2980b9; }
    </style>
</head>
<body>

<div class="container">
    <% if ("true".equals(paid)) { %>
        <h2 class="success">🎉 Payment Successful!</h2>
        <p>Your booking has been marked as <b>PAID</b>.</p>
        <p>We look forward to welcoming you on your <b>Quy Nhon Tour</b>!</p>
    <% } else if (booking != null) { %>
        <h2>Booking Received ✅</h2>
        <p><strong>Tour:</strong> <%= booking.getTourName() %></p>
        <p><strong>Guests:</strong> <%= booking.getGuests() %></p>
        <p><strong>Payment Method:</strong> <%= booking.getPaymentMethod() %></p>
        <p>Status:
            <% if ("PAID".equalsIgnoreCase(booking.getPaymentStatus())) { %>
                <span class="success">PAID</span>
            <% } else { %>
                <span class="pending">Pending</span>
            <% } %>
        </p>
    <% } else { %>
        <h2 style="color:red;">⚠ Booking Not Found!</h2>
        <p>Please check your booking again.</p>
    <% } %>

    <!-- Nút View My Bookings dẫn đến BookingHistoryServlet -->
    <a href="BookingHistoryServlet" class="btn-view">View My Bookings</a>
</div>

</body>
</html>

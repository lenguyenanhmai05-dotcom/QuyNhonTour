<%@ page import="com.quynhontours.dao.BookingDAO, com.quynhontours.model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String bookingId = request.getParameter("bookingId");

    Booking booking = null;
    if (bookingId != null && !bookingId.isEmpty()) {
        BookingDAO dao = new BookingDAO();
        booking = dao.findById(bookingId);
    }

    if (booking == null) {
        out.println("<h2 style='color:red;text-align:center;'>❌ Booking not found!</h2>");
        return;
    }

    double total = booking.getTotalPrice();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Online Payment</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f6f8fb;
        margin: 0; padding: 0;
    }
    .payment-box {
        background: #fff;
        max-width: 500px;
        margin: 80px auto;
        border-radius: 12px;
        padding: 40px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        text-align: center;
    }
    h2 {
        color: #2c3e50;
        margin-bottom: 20px;
    }
    .amount {
        font-size: 22px;
        color: #e74c3c;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .qr-code {
        width: 220px;
        height: 220px;
        background: #eee;
        display: inline-block;
        border-radius: 10px;
        margin-bottom: 30px;
    }
    .confirm-btn {
        background: #3498db;
        border: none;
        color: white;
        padding: 15px 40px;
        font-size: 18px;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
    }
    .confirm-btn:hover {
        background: #2980b9;
    }
</style>
</head>
<body>
<div class="payment-box">
    <h2>Confirm Online Payment</h2>
    <p><strong>Tour:</strong> <%= booking.getTourName() %></p>
    <p class="amount">Amount: <%= String.format("%,.0f", total) %> VNĐ</p>

    <!-- QR giả -->
    <img class="qr-code" src="https://api.qrserver.com/v1/create-qr-code/?data=PAY%20QUYNHONTOURS%20<%=booking.getId()%>&size=220x220" alt="QR Code">

    <form action="PaymentConfirmServlet" method="post">
        <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
        <button type="submit" class="confirm-btn">I Have Paid</button>
    </form>
</div>
</body>
</html>

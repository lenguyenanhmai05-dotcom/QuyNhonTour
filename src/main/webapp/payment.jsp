<%@ page import="com.quynhontours.dao.BookingDAO, com.quynhontours.model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Lấy bookingId từ request
    String bookingId = request.getParameter("bookingId");

    Booking booking = null;
    if (bookingId != null && !bookingId.isEmpty()) {
        BookingDAO dao = new BookingDAO();
        booking = dao.getById(bookingId); // dùng getById
    }

    if (booking == null) {
        out.println("<h2 style='color:red;text-align:center;'>❌ Booking not found!</h2>");
        return;
    }

    // Tổng tiền
    double total = booking.getTotalPrice();

    // ===== VietQR Info =====
    String bankCode = "BIDV";
    String accountNumber = "6240257274";
    String accountName = "QUY NHON TOUR";
    String addInfo = "Booking-" + booking.getId();

    String qrUrl = String.format(
        "https://img.vietqr.io/image/%s-%s-compact2.png?amount=%.0f&addInfo=%s&accountName=%s",
        bankCode,
        accountNumber,
        total,
        addInfo,
        accountName.replace(" ", "%20")
    );
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Online Payment - Quy Nhon Tour</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f6f8fb;
        margin: 0;
        padding: 0;
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
        margin-bottom: 10px;
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
        display: inline-block;
        border-radius: 10px;
        margin-bottom: 25px;
        border: 2px solid #ddd;
        padding: 8px;
        background: #fff;
    }
    .info {
        font-size: 15px;
        color: #555;
        margin-bottom: 20px;
    }
    .confirm-btn {
        background: #27ae60;
        border: none;
        color: white;
        padding: 15px 40px;
        font-size: 18px;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
    }
    .confirm-btn:hover {
        background: #219150;
    }
</style>
</head>
<body>
<div class="payment-box">
    <h2>Online Payment</h2>
    <p><strong>Tour:</strong> <%= booking.getTourName() %></p>
    <p class="amount">Amount: <%= String.format("%,.0f", total) %> VND</p>

    <p class="info">Scan the QR code below using your banking app to complete the payment:</p>

    <!-- VietQR dynamic QR -->
    <img class="qr-code" src="<%= qrUrl %>" alt="VietQR Code">

    <p><strong>Transfer message:</strong> <%= addInfo %></p>
    <p><small>Bank: <%= bankCode %> | Account: <%= accountNumber %> | Name: <%= accountName %></small></p>

    <form action="PaymentConfirmServlet" method="post">
        <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
        <button type="submit" class="confirm-btn">I Have Paid</button>
    </form>
</div>
</body>
</html>

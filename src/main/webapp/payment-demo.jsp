<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.quynhontours.model.Booking" %>
<%@ page import="com.quynhontours.dao.BookingDAO" %>
<%@ page import="java.net.URLEncoder" %>

<%
    String bookingId = request.getParameter("bookingId");
    if (bookingId == null || bookingId.isEmpty()) {
        out.println("<h3 style='color:red'>Missing bookingId</h3>");
        return;
    }

    BookingDAO dao = new BookingDAO();
    Booking booking = dao.getById(bookingId);
    if (booking == null) {
        out.println("<h3 style='color:red'>Booking not found</h3>");
        return;
    }

    // Link mà QR sẽ chứa — khi quét điện thoại sẽ mở trang này
    String ctx = request.getContextPath();
    String localIP = "192.168.1.90"; // địa chỉ IP máy chạy Tomcat
String confirmPath = request.getScheme() + "://" + localIP
        + (request.getServerPort() == 80 || request.getServerPort() == 443 ? "" : ":" + request.getServerPort())
        + ctx + "/payment-confirm.jsp?bookingId=" + URLEncoder.encode(bookingId, "UTF-8");


    String qrUrl = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=" + URLEncoder.encode(confirmPath, "UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Scan QR to Pay - Demo</title>
    <style>
        body { font-family: "Segoe UI", Arial; background: linear-gradient(180deg,#e6f7ff,#f8fcff); display:flex; align-items:center; justify-content:center; height:100vh; margin:0; }
        .card { background:white; padding:28px; border-radius:12px; box-shadow:0 10px 30px rgba(0,0,0,0.12); width:420px; text-align:center; }
        .qr { margin:18px 0; }
        .meta { color:#333; font-weight:600; }
        .hint { color:#666; font-size:13px; margin-top:10px; }
        .btn { margin-top:14px; padding:10px 18px; border-radius:8px; background:#0078AA; color:white; border:none; cursor:pointer; text-decoration:none; display:inline-block; }
    </style>
</head>
<body>
<div class="card">
    <h2>Online Payment (Demo)</h2>
    <p class="meta">Tour: <%= booking.getTourName() %> — Guests: <%= booking.getGuests() %></p>
    <p class="meta">Amount: <%= String.format("%,.0f", booking.getTotalPrice()) %> VND</p>

    <div class="qr">
        <img src="<%= qrUrl %>" alt="QR code">
    </div>

    <p class="hint">Quét mã này bằng điện thoại. Sau khi mở trang trên điện thoại, nhấn "Confirm Payment" để mô phỏng hoàn tất thanh toán.</p>

    <p style="margin-top:8px;">
        <!-- Link mở trang confirm trên cùng thiết bị (dùng để test nhanh trên máy tính) -->
        <a class="btn" href="<%= confirmPath %>" target="_blank">Open confirm page (simulate scan)</a>
    </p>
</div>
</body>
</html>

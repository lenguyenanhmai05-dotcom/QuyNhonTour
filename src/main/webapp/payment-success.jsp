<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.quynhontours.dao.BookingDAO" %>
<%@ page import="com.quynhontours.model.Booking" %>

<%
    String bookingId = request.getParameter("bookingId");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Payment Success</title>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <style>
        body{font-family:Arial, sans-serif;background:linear-gradient(180deg,#e6f9f0,#f1fff6);display:flex;align-items:center;justify-content:center;height:100vh;margin:0}
        .box{background:#fff;padding:22px;border-radius:12px;box-shadow:0 10px 26px rgba(0,0,0,0.08);text-align:center;max-width:420px}
        h2{color:#2d8a4f}
        p{color:#333}
        a{display:inline-block;margin-top:12px;padding:10px 16px;background:#0078AA;color:#fff;border-radius:8px;text-decoration:none}
    </style>
</head>
<body>
<div class="box">
    <h2>🎉 Payment Successful</h2>
    <p>Your payment has been confirmed.</p>
    <p><small>Booking ID: <b><%= bookingId %></b></small></p>
    <a href="<%= request.getContextPath() %>/">Back to home</a>
</div>
</body>
</html>

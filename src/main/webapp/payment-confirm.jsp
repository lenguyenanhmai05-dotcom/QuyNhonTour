<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.quynhontours.dao.BookingDAO" %>
<%@ page import="com.quynhontours.model.Booking" %>

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
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Confirm Payment</title>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <style>
        body{font-family:Arial, sans-serif;background:#f4f7fb;padding:20px}
        .wrap{max-width:420px;margin:20px auto;background:#fff;padding:18px;border-radius:12px;box-shadow:0 8px 20px rgba(0,0,0,0.08)}
        h3{color:#0078AA;margin:0 0 8px}
        p{margin:6px 0;color:#333}
        .amount{font-size:18px;font-weight:700;color:#1b6b9a}
        .confirm{margin-top:14px;display:flex;gap:10px}
        .btn{flex:1;padding:12px;border-radius:8px;border:none;font-weight:700;cursor:pointer}
        .btn-pay{background:#28a745;color:#fff}
        .btn-cancel{background:#e6e9ee;color:#333}
    </style>
</head>
<body>
<div class="wrap">
    <h3>Confirm Payment</h3>
    <p>Tour: <b><%= booking.getTourName() %></b></p>
    <p>Guests: <%= booking.getGuests() %></p>
    <p class="amount">Amount: <%= String.format("%,.0f", booking.getTotalPrice()) %> VND</p>

    <form action="<%= request.getContextPath() %>/payment-confirm" method="post">
        <input type="hidden" name="bookingId" value="<%= booking.getId() %>"/>
        <div class="confirm">
            <button type="submit" class="btn btn-pay">✅ Confirm Payment</button>
            <button type="button" class="btn btn-cancel" onclick="window.close();">✖ Cancel</button>
        </div>
    </form>

    <p style="font-size:12px;color:#666;margin-top:12px">This is a demo page. No real money is transferred.</p>
</div>
</body>
</html>

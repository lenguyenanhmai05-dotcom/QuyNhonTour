<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bookingId = request.getParameter("bookingId");
    String ctx = request.getContextPath();
    String callbackUrl = ctx + "/online-pay-callback?bookingId=" + bookingId;
    // link mô phỏng sẽ là callbackUrl — khi quét QR sẽ truy cập callback và cập nhật PAID
    String qrData = java.net.URLEncoder.encode(callbackUrl, "UTF-8");
    String qrUrl = "https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=" + qrData;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Online Payment - Scan QR</title>
    <style>
        body{font-family:Poppins, sans-serif; text-align:center; padding:40px;}
        .card{display:inline-block; background:#fff; padding:24px; border-radius:12px; box-shadow:0 8px 24px rgba(0,0,0,0.08);}
        .qr{margin:16px 0;}
        .btn{padding:10px 18px;border-radius:8px;background:#2563eb;color:#fff;border:none;cursor:pointer;font-weight:600;}
    </style>
</head>
<body>
    <div class="card">
        <h2>Scan to pay (Simulated)</h2>
        <p>Booking ID: <strong><%= bookingId %></strong></p>

        <div class="qr">
            <img src="<%= qrUrl %>" alt="QR Code" />
        </div>

        <p>Scan this QR with your phone scanner. For testing, click the button below to simulate successful payment (scan).</p>

        <form action="<%= request.getContextPath() %>/online-pay-callback" method="post" style="display:inline;">
            <input type="hidden" name="bookingId" value="<%= bookingId %>"/>
            <button type="submit" class="btn">Simulate scan / I paid</button>
        </form>

        <p style="margin-top:10px;color:#666;font-size:13px;">(QR links to same simulated callback URL)</p>
    </div>
</body>
</html>

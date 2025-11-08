<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.Booking" %>

<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Booking History</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f8fbff; }
        h2 { text-align:center; margin-top:30px; color:#0078AA; }
        table { border-collapse: collapse; margin: 30px auto; width: 80%; background:white; box-shadow:0 4px 15px rgba(0,0,0,0.05); }
        th, td { padding: 12px; border-bottom: 1px solid #eee; text-align: center; }
        th { background: #0078AA; color: white; }
        tr:hover { background-color: #f1f9ff; }
        .paid { color: green; font-weight: 600; }
        .pending { color: orange; font-weight: 600; }
    </style>
</head>
<body>
    <h2>Booking History</h2>
    <table>
        <tr>
            <th>Tour</th>
            <th>Name</th>
            <th>Guests</th>
            <th>Payment</th>
            <th>Status</th>
            <th>Total (VND)</th>
        </tr>
        <%
            if (bookings != null && !bookings.isEmpty()) {
                for (Booking b : bookings) {
        %>
        <tr>
            <td><%= b.getTourName() %></td>
            <td><%= b.getCustomerName() %></td>
            <td><%= b.getGuests() %></td>
            <td><%= b.getPaymentMethod() %></td>
            <td class="<%= b.getPaymentStatus().equals("PAID") ? "paid" : "pending" %>">
                <%= b.getPaymentStatus() %>
            </td>
            <td><%= String.format("%,.0f", b.getTotalPrice()) %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="6">No bookings found.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>

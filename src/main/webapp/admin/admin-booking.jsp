<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.quynhontours.model.Booking" %>
<%@ page import="com.quynhontours.dao.BookingDAO" %>
<%
    BookingDAO dao = new BookingDAO();
    List<Booking> bookings = dao.getAllBookings();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); // định dạng ngày
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Bookings Management</title>
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<header>
    <h1>Bookings Management</h1>
    <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <div class="top-btns">
        <a href="dashboard" class="back-btn">← Back to Dashboard</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>Tour</th>
                <th>Start Date</th> <!-- đổi tên cột -->
                <th>Guests</th>
                <th>Payment</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (bookings != null && !bookings.isEmpty()) {
                int i = 1;
                for (Booking b : bookings) {
                    String orderStatus = b.getOrderStatus();
                    String statusClass = "status-processing";
                    if ("COMPLETED".equalsIgnoreCase(orderStatus)) statusClass = "status-completed";
                    if ("CANCELLED".equalsIgnoreCase(orderStatus)) statusClass = "status-cancelled";
        %>
            <tr>
                <td><%= i++ %></td>
                <td><%= b.getTourName() %></td>
                <td><%= b.getStartDate() != null ? sdf.format(b.getStartDate()) : "-" %></td>
                <td>A: <%= b.getNumAdults() %> / C: <%= b.getNumChildren() %></td>
                <td><%= b.getPaymentMethod() %> / <%= b.getPaymentStatus() %></td>
                <td class="<%= statusClass %>"><%= orderStatus %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="6" style="text-align:center;">No bookings found.</td></tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>

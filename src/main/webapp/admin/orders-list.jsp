<%@ page import="com.quynhontours.dao.BookingDAO" %>
<%@ page import="com.quynhontours.model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    BookingDAO dao = new BookingDAO();
    List<Booking> orders = dao.getAllBookings();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Orders Management</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<header>
    <h1>Orders Management</h1>
    <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <div class="top-btns">
        <a href="dashboard" class="back-btn">← Back to Dashboard</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Email</th>
                <th>Tour</th>
                <th>Payment</th>
                <th>Order Status</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
        <% if (orders != null && !orders.isEmpty()) { 
            for (Booking o : orders) { %>
            <tr>
                <td><%= o.getId() %></td>
                <td><%= o.getCustomerName() %></td>
                <td><%= o.getCustomerEmail() %></td>
                <td><%= o.getTourName() %></td>
                <td><%= o.getPaymentStatus() %></td>
                <td class="<%= "COMPLETED".equalsIgnoreCase(o.getOrderStatus()) ? "status-completed" : 
                             "CANCELLED".equalsIgnoreCase(o.getOrderStatus()) ? "status-cancelled" : "status-processing" %>">
                    <%= o.getOrderStatus() %>
                </td>
                <td><%= String.format("%,.0f₫", o.getTotalPrice()) %></td>
            </tr>
        <% } } else { %>
            <tr><td colspan="7" style="text-align:center;">No orders found.</td></tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>

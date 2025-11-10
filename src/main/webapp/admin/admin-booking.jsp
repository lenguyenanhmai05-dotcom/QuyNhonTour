<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.Booking" %>
<%@ page import="com.quynhontours.dao.BookingDAO" %>

<%
    BookingDAO dao = new BookingDAO();
    List<Booking> bookings = dao.getAllBookings();
    int totalBookings = bookings != null ? bookings.size() : 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Management</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- <div class="sidebar">
    <h2>🧭 Admin Panel</h2>
    <a href="dashboard">🏠 Dashboard</a>
    <a href="tour-list.jsp">📍 Tours Management</a>
    <a href="news-list.jsp">📰 News Management</a>
    <a href="users-list.jsp">👤 Users Management</a>
    <a href="orders-list.jsp">👤 Orders Management</a>
    <a href="admin-booking.jsp" class="active">📦 Bookings Management</a>
</div> -->

<div class="main">
    <div class="header">
        <h1>Booking Management</h1>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>

    <div class="table-container">
        <div class="summary">Total bookings: <%= totalBookings %></div>
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Tour</th>
                    <th>Guests</th>
                    <th>Payment</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                if (bookings != null && !bookings.isEmpty()) {
                    int i = 1;
                    for (Booking b : bookings) {
                        String status = b.getPaymentStatus();
                        if (status == null) status = "PENDING";
                        String statusClass = "status-paid";
                        if ("PENDING".equalsIgnoreCase(status)) statusClass = "status-pending";
            %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= b.getTourName() %></td>
                    <td><%= b.getGuests() %></td>
                    <td><%= b.getPaymentMethod() %></td>
                    <td class="<%= statusClass %>"><%= status %></td>
                    <td>
                        <% if ("PENDING".equalsIgnoreCase(status)) { %>
                            <form action="<%= request.getContextPath() %>/admin-bookings" method="post" style="display:inline;">
                                <input type="hidden" name="bookingId" value="<%= b.getId() %>">
                                <input type="hidden" name="action" value="confirm">
                                <button class="btn btn-confirm" type="submit">Confirm</button>
                            </form>
                        <% } else { %>
                            <button class="btn btn-disabled" disabled>Confirmed</button>
                        <% } %>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6" style="text-align:center;">No bookings found.</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>

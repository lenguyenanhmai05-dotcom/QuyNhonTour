<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, java.text.SimpleDateFormat" %>
<%@ page import="com.quynhontours.model.Booking" %>

<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking History</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
</head>
<body>
    <header>
        <h1>Booking History</h1>
        <a href="<%=request.getContextPath()%>/logout" class="logout-btn">Logout</a>
    </header>

    <div class="container">
        <div class="top-btns">
            <a href="<%=request.getContextPath()%>/index.jsp" class="back-btn">Back to Home</a>
        </div>

        <table>
            <tr>
                <th>Tour</th>
                <th>Name</th>
                <th>Guests</th>
                <th>Start Date</th>
                <th>Payment</th>
                <th>Status</th>
                <th>Total (VND)</th>
            </tr>
            <%
                if (bookings != null && !bookings.isEmpty()) {
                    for (Booking b : bookings) {
                        String statusClass = b.getPaymentStatus().equalsIgnoreCase("PAID") ? "status-completed" : "status-processing";
            %>
            <tr>
                <td><%= b.getTourName() %></td>
                <td><%= b.getCustomerName() %></td>
                <td><%= b.getGuests() %></td>
                <td><%= b.getStartDate() != null ? sdf.format(b.getStartDate()) : "-" %></td>
                <td><%= b.getPaymentMethod() %> / <%= b.getPaymentStatus() %></td>
                <td class="<%= statusClass %>"><%= b.getOrderStatus() %></td>
                <td><%= String.format("%,.0f", b.getTotalPrice()) %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" style="text-align:center;">No bookings found.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>

<%@ page import="org.bson.Document" %>
    <%@ page import="java.util.List" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <% List<Document> orders = (List<Document>) request.getAttribute("orders");
                    %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <title>Orders Management</title>
                        <link rel="stylesheet" href="../css/admin.css">
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
                                <h1>Orders List</h1>
                                <a href="dashboard" class="back-btn">⬅ Back to Dashboard</a>
                            </div>

                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>User Email</th>
                                            <th>Tour Name</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th>Created At</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% if (orders !=null && !orders.isEmpty()) { for (Document o : orders) { %>
                                            <tr>
                                                <td>
                                                    <%= o.getObjectId("_id") %>
                                                </td>
                                                <td>
                                                    <%= o.getString("userEmail") %>
                                                </td>
                                                <td>
                                                    <%= o.getString("tourName") %>
                                                </td>
                                                <td>
                                                    <%= o.getString("status") %>
                                                </td>
                                                <td>
                                                    <%= o.getDouble("total") !=null ? String.format("%,.0f₫",
                                                        o.getDouble("total")) : "-" %>
                                                </td>
                                                <td>
                                                    <%= o.getString("createdAt") %>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="6">No orders found.</td>
                                                </tr>
                                                <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </body>

                    </html>
<%@ page import="java.util.List" %>
    <%@ page import="com.quynhontours.model.Tour" %>
        <%@ page import="com.quynhontours.dao.TourDAO" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <% TourDAO dao=new TourDAO(); List<Tour> tours = dao.getAllTours();
                    %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <title>Tours Management</title>
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
                                <h1>Tour List</h1>
                                <a href="<%= request.getContextPath() %>/logout">Logout</a>
                            </div>

                            <div>
                                <a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>
                                <a href="tour-form.jsp" class="add-btn">+ Add New Tour</a>
                            </div>

                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tour Name</th>
                                            <th>Location</th>
                                            <th>Departure</th>
                                            <th>Destination</th>
                                            <th>Duration</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Adult Price</th>
                                            <th>Child Price</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% if (tours !=null && !tours.isEmpty()) { for (Tour t : tours) { %>
                                            <tr>
                                                <td>
                                                    <%= t.getId() %>
                                                </td>
                                                <td>
                                                    <%= t.getName() %>
                                                </td>
                                                <td>
                                                    <%= t.getLocation() %>
                                                </td>
                                                <td>
                                                    <%= t.getDeparture() %>
                                                </td>
                                                <td>
                                                    <%= t.getDestination() %>
                                                </td>
                                                <td>
                                                    <%= t.getDuration() %>
                                                </td>
                                                <td>
                                                    <%= t.getStartDate() %>
                                                </td>
                                                <td>
                                                    <%= t.getEndDate() %>
                                                </td>
                                                <td>
                                                    <%= String.format("%,.0f", t.getAdultPrice()) %>₫
                                                </td>
                                                <td>
                                                    <%= String.format("%,.0f", t.getChildPrice()) %>₫
                                                </td>
                                                <td>
                                                    <a href="<%=request.getContextPath()%>/admin/tours?action=edit&id=<%=t.getId()%>"
                                                        style="background:#f1c40f;color:black;border:none;padding:6px 10px;border-radius:4px;cursor:pointer;">Edit</a>
                                                    <form action="<%=request.getContextPath()%>/admin/deleteTour"
                                                        method="post" style="display:inline;">
                                                        <input type="hidden" name="id" value="<%=t.getId()%>">
                                                        <button type="submit"
                                                            style="background:#e74c3c;color:white;border:none;padding:6px 10px;border-radius:4px;cursor:pointer;">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="11">No tours available.</td>
                                                </tr>
                                                <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </body>

                    </html>
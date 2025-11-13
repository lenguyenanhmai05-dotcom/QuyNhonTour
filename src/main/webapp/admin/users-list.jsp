<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Users Management</title>
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
                <h1>Users Management</h1>
                <a href="<%= request.getContextPath() %>/logout">Logout</a>
            </div>

            <div>
                <a href="dashboard" class="back-btn">← Back to Dashboard</a>
                <!-- <a href="news-form.jsp" class="add-btn">+ Add New Tour</a> -->
            </div>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Vai trò</th>
                            <th>Ngày tạo</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nguyễn Văn A</td>
                            <td>a.nguyen@example.com</td>
                            <td>Admin</td>
                            <td>10/10/2025</td>
                            <td>
                                <a href="user-edit.jsp?id=1"
                                    style="background:#f1c40f;color:black;border:none;padding:6px 10px;border-radius:4px;">Sửa</a>
                                <button
                                    style="background:#e74c3c;color:white;border:none;padding:6px 10px;border-radius:4px;">Xóa</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </body>

    </html>
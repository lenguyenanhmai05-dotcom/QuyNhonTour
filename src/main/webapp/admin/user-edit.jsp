<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ page import="com.quynhontours.model.User" %>
        <% String role=(String) session.getAttribute("role"); if (role==null || !"admin".equalsIgnoreCase(role)) {
            response.sendRedirect("../login.html"); return; } User user=(User) request.getAttribute("user"); %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>Sửa người dùng - QuyNhonTours</title>
                <link rel="stylesheet" href="../css/dashboard.css">
            </head>

            <body>
                <!-- <div class="sidebar">
                    <h2>QuyNhonTours</h2>
                    <a href="dashboard.jsp">🏠 Dashboard</a>
                    <a href="tour-list.jsp">🗺️ Tours</a>
                    <a href="news-list.jsp">📰 News</a>
                    <a href="user-list.jsp" class="active">👥 Users</a>
                    <a href="order-list.jsp">📦 Orders</a>
                    <a href="<%= request.getContextPath() %>/logout" class="logout">🚪 Logout</a>
                </div> -->

                <div class="content">
                    <h1>Cập nhật thông tin người dùng</h1>

                    <form action="update-user" method="post" class="form-container">
                        <input type="hidden" name="id" value="<%= user.getId() %>">

                        <label>Họ và tên:</label>
                        <input type="text" name="fullName" value="<%= user.getFullName() %>" required>

                        <label>Email:</label>
                        <input type="email" name="email" value="<%= user.getEmail() %>" required>

                        <label>Vai trò:</label>
                        <select name="role">
                            <option value="user" <%="user" .equals(user.getRole()) ? "selected" : "" %>>Người dùng
                            </option>
                            <option value="admin" <%="admin" .equals(user.getRole()) ? "selected" : "" %>>Quản trị
                            </option>
                        </select>

                        <label>Trạng thái:</label>
                        <select name="status">
                            <option value="active" <%="active" .equals(user.getStatus()) ? "selected" : "" %>>Hoạt động
                            </option>
                            <option value="banned" <%="banned" .equals(user.getStatus()) ? "selected" : "" %>>Đã khóa
                            </option>
                        </select>

                        <button type="submit" class="btn-primary">Lưu thay đổi</button>
                    </form>
                </div>
            </body>

            </html>
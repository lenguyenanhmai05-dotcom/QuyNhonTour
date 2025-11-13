<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.quynhontours.model.News" %>

        <% News news=(News) request.getAttribute("news"); boolean editing=(news !=null); %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>
                    <%= editing ? "Edit News" : "Add New News" %>
                </title>
                <link rel="stylesheet" href="../css/admin.css">
                <style>
                    .form-container {
                        background-color: #fff;
                        max-width: 700px;
                        margin: 30px auto;
                        padding: 30px 40px;
                        border-radius: 10px;
                        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
                    }

                    .form-container h2 {
                        color: #00a2a2;
                        margin-bottom: 20px;
                    }

                    .form-group {
                        margin-bottom: 18px;
                    }

                    label {
                        display: block;
                        font-weight: bold;
                        margin-bottom: 8px;
                    }

                    input[type="text"],
                    textarea {
                        width: 100%;
                        padding: 10px;
                        border: 1px solid #ccc;
                        border-radius: 6px;
                        font-size: 15px;
                    }

                    textarea {
                        resize: vertical;
                        min-height: 150px;
                    }

                    .btn-group {
                        margin-top: 25px;
                        display: flex;
                        gap: 10px;
                    }

                    .save-btn {
                        background: #00a2a2;
                        color: #fff;
                        padding: 10px 18px;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                        transition: background .2s;
                    }

                    .save-btn:hover {
                        background: #007a7a;
                    }

                    .back-btn {
                        background: #ccc;
                        color: black;
                        padding: 10px 18px;
                        text-decoration: none;
                        border-radius: 5px;
                    }

                    .back-btn:hover {
                        background: #bbb;
                    }
                </style>
            </head>

            <body>

                <!-- <div class="sidebar">
                    <h2>🧭 Admin Panel</h2>
                    <a href="dashboard.jsp">🏠 Dashboard</a>
                    <a href="tour-list.jsp">📍 Tours Management</a>
                    <a href="news-list.jsp" class="active">📰 News Management</a>
                    <a href="users-list.jsp">👤 Users Management</a>
                    <a href="orders-list.jsp">🧾 Orders Management</a>
                    <a href="admin-booking.jsp">📦 Bookings Management</a>
                </div> -->

                <div class="main">
                    <div class="header">
                        <h1>
                            <%= editing ? "Edit News" : "Add New News" %>
                        </h1>
                        <a href="<%= request.getContextPath() %>/logout">Logout</a>
                    </div>

                    <div class="form-container">
                        <form action="<%= request.getContextPath() %>/admin/news" method="post">
                            <% if (editing) { %>
                                <input type="hidden" name="id" value="<%= news.getId() %>">
                                <% } %>

                                    <div class="form-group">
                                        <label>Title</label>
                                        <input type="text" name="title" placeholder="Enter news title"
                                            value="<%= editing ? news.getTitle() : "" %>" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Image Path (e.g. images/honkho.jpg)</label>
                                        <input type="text" name="imageUrl" placeholder="images/honkho.jpg"
                                            value="<%= editing ? news.getImageUrl() : "" %>">
                                    </div>

                                    <div class="form-group">
                                        <label>Content</label>
                                        <textarea name="content" placeholder="Write news content here..."
                                            required><%= editing ? news.getContent() : "" %></textarea>
                                    </div>

                                    <div class="btn-group">
                                        <button type="submit" class="save-btn">💾 Save</button>
                                        <a href="<%= request.getContextPath() %>/admin/news" class="back-btn">← Back</a>
                                    </div>
                        </form>
                    </div>
                </div>

            </body>

            </html>
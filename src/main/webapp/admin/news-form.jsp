<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quynhontours.model.News" %>

<%
    News news = (News) request.getAttribute("news");
    boolean editing = (news != null);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= editing ? "Edit News" : "Add New News" %></title>
    <link rel="stylesheet" href="../css/admin.css">
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            margin: 0;
            padding: 0;
        }

        header {
            text-align: center;
            padding: 30px 0 10px 0;
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }

        header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 600;
        }

        .logout-btn {
            display: inline-block;
            margin-top: 10px;
            color: #fff;
            text-decoration: none;
            background: rgba(255,255,255,0.2);
            padding: 8px 14px;
            border-radius: 6px;
            transition: all 0.2s;
        }

        .logout-btn:hover {
            background: rgba(255,255,255,0.35);
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            background: #fff;
            padding: 35px 40px;
            border-radius: 14px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #1e3a8a;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            transition: all 0.2s;
        }

        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 4px rgba(37,99,235,0.3);
        }

        textarea {
            resize: vertical;
            min-height: 150px;
        }

        .btn-group {
            margin-top: 25px;
            display: flex;
            justify-content: center;
            gap: 12px;
        }

        .save-btn,
        .back-btn {
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            cursor: pointer;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.25s;
        }

        .save-btn {
            background: #2563eb;
            color: #fff;
        }

        .save-btn:hover {
            background: #1e40af;
        }

        .back-btn {
            background: #e5e7eb;
            color: #111827;
        }

        .back-btn:hover {
            background: #d1d5db;
        }
    </style>
</head>
<body>

<header>
    <h1><%= editing ? "Edit News" : "Add New News" %></h1>
    <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
</header>

<div class="container">
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
            <textarea name="content" placeholder="Write news content here..." required><%= editing ? news.getContent() : "" %></textarea>
        </div>

        <div class="btn-group">
            <button type="submit" class="save-btn">💾 Save</button>
            <a href="<%= request.getContextPath() %>/admin/news" class="back-btn">← Back</a>
        </div>
    </form>
</div>

</body>
</html>

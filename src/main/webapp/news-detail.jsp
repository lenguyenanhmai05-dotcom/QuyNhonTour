<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quynhontours.model.News" %>

<html>
<head>
    <title>News Detail - Quy Nhon Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background-color: #fafafa;
            color: #333;
        }

        header {
            background: #e9f5ff;
            color: #023e8a;
            text-align: center;
            padding: 35px 20px;
        }

        header h1 {
            margin: 0;
            font-size: 2em;
            font-weight: 600;
        }

        .container {
            width: 90%;
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
            padding: 35px 40px;
        }

        .news-title {
            font-size: 2em;
            color: #005f99;
            margin-bottom: 10px;
            line-height: 1.3;
            text-align: center;
        }

        .news-date {
            text-align: center;
            color: #777;
            font-size: 0.95em;
            margin-bottom: 25px;
        }

        .news-image {
            text-align: center;
            margin-bottom: 30px;
        }

        .news-image img {
            width: 100%;
            max-height: 450px;
            object-fit: cover;
            border-radius: 10px;
        }

        .news-content {
            font-size: 1.05em;
            color: #444;
            line-height: 1.8;
            text-align: justify;
        }

        .back-btn {
            display: inline-block;
            margin-top: 40px;
            background: #0077b6;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: #0096c7;
        }

        footer {
            background: #023e8a;
            color: white;
            text-align: center;
            padding: 25px 10px;
            margin-top: 70px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<header>
    <h1>Travel News</h1>
</header>

<div class="container">
    <%
        News news = (News) request.getAttribute("newsDetail");
        if (news != null) {
            String imagePath = (news.getImageUrl() != null && !news.getImageUrl().isEmpty())
                    ? (news.getImageUrl().startsWith("images/") ? news.getImageUrl() : "images/" + news.getImageUrl())
                    : "images/default.jpg";
    %>

    <h2 class="news-title"><%= news.getTitle() %></h2>
    <div class="news-date">🕒 <%= news.getCreatedAt() %></div>

    <div class="news-image">
        <img src="<%= imagePath %>" alt="News Image">
    </div>

    <div class="news-content">
        <%= news.getContent().replaceAll("\n", "<br>") %>
    </div>

    <div style="text-align: center;">
        <a href="travel-news" class="back-btn">⬅ Back to News</a>
    </div>

    <% } else { %>
        <p style="text-align:center; color:#777;">News not found or deleted.</p>
        <div style="text-align:center;">
            <a href="travel-news" class="back-btn">⬅ Back to News</a>
        </div>
    <% } %>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>

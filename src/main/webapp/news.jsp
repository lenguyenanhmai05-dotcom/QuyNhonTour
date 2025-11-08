<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.model.News" %>

<html>
<head>
    <title>Travel News - Quy Nhon Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background-color: #fafafa;
            color: #333;
        }

        header {
            background: #e6f2ff;
            color: #023e8a;
            text-align: center;
            padding: 35px 20px;
            border-bottom: 2px solid #cde0f5;
        }

        header h1 {
            font-size: 2.2em;
            margin: 0;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        /* --- Featured article --- */
        .featured {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            margin-bottom: 50px;
            align-items: center;
        }

        .featured img {
            flex: 1 1 500px;
            width: 100%;
            height: 360px;
            border-radius: 12px;
            object-fit: cover;
            cursor: pointer;
        }

        .featured-content {
            flex: 1 1 400px;
        }

        .featured-content h2 {
            font-size: 1.9em;
            color: #004e89;
            margin-bottom: 12px;
            cursor: pointer;
            transition: color 0.25s ease;
        }

        .featured-content h2:hover {
            color: #0077b6;
        }

        .featured-content p {
            color: #555;
            line-height: 1.7;
            font-size: 1em;
            margin-bottom: 15px;
        }

        .featured-content .news-date {
            color: #777;
            font-size: 0.9em;
        }

        /* --- News grid --- */
        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }

        .news-item {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            cursor: pointer;
        }

        .news-item:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.1);
        }

        .news-item img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }

        .news-info {
            padding: 15px 18px;
        }

        .news-info h3 {
            font-size: 1.15em;
            color: #005f99;
            margin: 0 0 10px;
            transition: color 0.2s ease;
        }

        .news-info h3:hover {
            color: #00a8e8;
        }

        .news-info p {
            font-size: 0.9em;
            color: #555;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .news-date {
            font-size: 0.85em;
            color: #888;
        }

        .no-news {
            text-align: center;
            color: #777;
            font-style: italic;
            margin-top: 60px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<header>
    <h1>Travel News - Quy Nhon Tours</h1>
</header>

<div class="container">
    <%
        List<News> newsList = (List<News>) request.getAttribute("newsList");
        if (newsList != null && !newsList.isEmpty()) {
            News featured = newsList.get(0);
            String featuredImage = (featured.getImageUrl() != null && !featured.getImageUrl().isEmpty())
                    ? (featured.getImageUrl().startsWith("images/") ? featured.getImageUrl() : "images/" + featured.getImageUrl())
                    : "images/default.jpg";
    %>

    <!-- Featured news -->
    <div class="featured">
        <img src="<%= featuredImage %>" alt="Featured News"
             onclick="location.href='news-detail?id=<%= featured.getId() %>'">
        <div class="featured-content">
            <h2 onclick="location.href='news-detail?id=<%= featured.getId() %>'"><%= featured.getTitle() %></h2>
            <p><%= featured.getContent().length() > 240 ? featured.getContent().substring(0, 240) + "..." : featured.getContent() %></p>
            <div class="news-date">📅 <%= featured.getCreatedAt() %></div>
        </div>
    </div>

    <!-- Other news -->
    <div class="news-grid">
        <%
            for (int i = 1; i < newsList.size(); i++) {
                News n = newsList.get(i);
                String imagePath = (n.getImageUrl() != null && !n.getImageUrl().isEmpty())
                        ? (n.getImageUrl().startsWith("images/") ? n.getImageUrl() : "images/" + n.getImageUrl())
                        : "images/default.jpg";
        %>
        <div class="news-item" onclick="location.href='news-detail?id=<%= n.getId() %>'">
            <img src="<%= imagePath %>" alt="News Image">
            <div class="news-info">
                <h3><%= n.getTitle() %></h3>
                <p><%= n.getContent().length() > 120 ? n.getContent().substring(0, 120) + "..." : n.getContent() %></p>
                <div class="news-date">🕒 <%= n.getCreatedAt() %></div>
            </div>
        </div>
        <% } %>
    </div>

    <% } else { %>
        <div class="no-news">
            <p>No news available right now. Please check back later!</p>
        </div>
    <% } %>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>

package com.quynhontours.controller;

import com.quynhontours.dao.NewsDAO;
import com.quynhontours.model.News;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class NewsServlet extends HttpServlet {
    private NewsDAO dao = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("/admin/news-form.jsp").forward(request, response);
                break;
            case "edit":
                String id = request.getParameter("id");
                News news = dao.getNewsById(id);
                request.setAttribute("news", news);
                request.getRequestDispatcher("/admin/news-form.jsp").forward(request, response);
                break;
            case "delete":
                dao.deleteNews(request.getParameter("id"));
                response.sendRedirect("news");
                break;
            default:
                request.setAttribute("list", dao.getAllNews());
                request.getRequestDispatcher("/admin/news-list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String imageUrl = request.getParameter("imageUrl");

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setImageUrl(imageUrl);

        if (id == null || id.isEmpty()) {
            String createdAt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            news.setCreatedAt(createdAt);
            dao.insertNews(news);
        } else {
            news.setId(new org.bson.types.ObjectId(id));
            dao.updateNews(news);
        }

        response.sendRedirect("news");
    }
}

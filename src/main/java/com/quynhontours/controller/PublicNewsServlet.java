package com.quynhontours.controller;

import com.quynhontours.dao.NewsDAO;
import com.quynhontours.model.News;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/travel-news") // user truy cập bằng /news
public class PublicNewsServlet extends HttpServlet {
    private NewsDAO dao;

    @Override
    public void init() {
        dao = new NewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy tất cả tin từ MongoDB
        List<News> newsList = dao.getAllNews();

        // Gửi dữ liệu qua JSP
        request.setAttribute("newsList", newsList);

        // Forward tới trang news.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/news.jsp");
        dispatcher.forward(request, response);
    }
}

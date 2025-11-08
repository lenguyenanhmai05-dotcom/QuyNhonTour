package com.quynhontours.controller;

import com.quynhontours.dao.NewsDAO;
import com.quynhontours.model.News;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/news-detail")
public class NewsDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            response.sendRedirect("news.jsp");
            return;
        }

        News news = newsDAO.getNewsById(id);

        if (news != null) {
            request.setAttribute("newsDetail", news);
            request.getRequestDispatcher("news-detail.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "The requested news article could not be found.");
            request.getRequestDispatcher("news.jsp").forward(request, response);
        }
    }
}

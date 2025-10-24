package com.quynhontours.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

public class TourListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TourDAO tourDAO = new TourDAO();
        List<Tour> tourList = tourDAO.getAllTours();

        request.setAttribute("tourList", tourList);
        request.getRequestDispatcher("/admin/tour-list.jsp").forward(request, response);
    }
}

package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateTourServlet extends HttpServlet {
    private TourDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new TourDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/tours");
            return;
        }

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String priceStr = request.getParameter("price");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        double price = 0;
        try {
            if (priceStr != null && !priceStr.isEmpty())
                price = Double.parseDouble(priceStr);
        } catch (NumberFormatException ignored) {}

        Tour t = new Tour(id, name, description, location, price, startDate, endDate);
        dao.updateTour(t);

        response.sendRedirect(request.getContextPath() + "/admin/tours");
    }
}

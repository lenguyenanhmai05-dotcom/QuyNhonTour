package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class AddTourServlet extends HttpServlet {
    private TourDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new TourDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String departure = request.getParameter("departure");
            String destination = request.getParameter("destination");
            String duration = request.getParameter("duration");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String priceAdultStr = request.getParameter("priceAdult");
            String priceChildStr = request.getParameter("priceChild");
            String image = request.getParameter("image");

            double priceAdult = 0;
            double priceChild = 0;

            if (priceAdultStr != null && !priceAdultStr.trim().isEmpty()) {
                priceAdult = Double.parseDouble(priceAdultStr);
            }
            if (priceChildStr != null && !priceChildStr.trim().isEmpty()) {
                priceChild = Double.parseDouble(priceChildStr);
            }

            Tour tour = new Tour(
        name, description, location, destination, departure,
        duration, startDate, endDate, priceAdult, priceChild, image
);

            boolean success = dao.addTour(tour);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/tours?msg=added");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/tours?error=add_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/tours?error=server_error");
        }
    }
}

package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class TourServlet extends HttpServlet {
    private final TourDAO dao = new TourDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        if ("edit".equals(action)) {
            String id = request.getParameter("id");
            if (id == null || id.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/tours");
                return;
            }
            Tour tour = dao.getTourById(id);
            if (tour == null) {
                response.sendRedirect(request.getContextPath() + "/admin/tours");
                return;
            }
            request.setAttribute("tour", tour);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/edit-tour.jsp");
            dispatcher.forward(request, response);
        } else { // list
            List<Tour> tours = dao.getAllTours();
            request.setAttribute("tours", tours);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/tour-list.jsp");
            dispatcher.forward(request, response);
        }
    }
}

package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


public class TourDetailsServlet extends HttpServlet {
    private TourDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new TourDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing tour ID");
            return;
        }

        Tour tour = dao.getTourById(id);
        if (tour == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Tour not found");
            return;
        }

        // ✅ Truyền dữ liệu sang trang JSP
        request.setAttribute("tour", tour);

        // ✅ Nếu tour có trang chi tiết riêng, thì mở đúng trang đó
        if (tour.getDetailsPage() != null && !tour.getDetailsPage().isEmpty()) {
            request.getRequestDispatcher("/" + tour.getDetailsPage()).forward(request, response);
        } else {
            // Nếu không có detailsPage thì dùng trang mặc định
            request.getRequestDispatcher("/tour-details.jsp").forward(request, response);
        }
    }
}

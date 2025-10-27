package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class BookNowServlet extends HttpServlet {
    private TourDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new TourDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        Tour tour = dao.getTourById(id);

        if (tour == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Tour not found");
            return;
        }

        // ✅ Truyền dữ liệu sang trang thanh toán (hoặc trang xác nhận)
        request.setAttribute("tour", tour);
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }
}

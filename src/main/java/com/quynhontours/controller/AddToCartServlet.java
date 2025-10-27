package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AddToCartServlet extends HttpServlet {
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
            response.sendRedirect("search-result.jsp");
            return;
        }

        Tour tour = dao.getTourById(id);
        if (tour == null) {
            response.sendRedirect("search-result.jsp");
            return;
        }

        // ✅ Lấy session và giỏ hàng
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<Tour> cart = (List<Tour>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        // ✅ Tránh thêm trùng
        boolean exists = false;
        for (Tour t : cart) {
            if (t.getId().equals(tour.getId())) {
                exists = true;
                break;
            }
        }

        if (!exists) {
            cart.add(tour);
        }

        // ✅ Cập nhật session
        session.setAttribute("cart", cart);

        // ✅ Chuyển sang trang giỏ hàng
        response.sendRedirect("cart.jsp");
    }
}

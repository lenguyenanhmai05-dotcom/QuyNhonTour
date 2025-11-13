package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class OnlinePayCallbackServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String bookingId = req.getParameter("bookingId");
        if (bookingId == null) bookingId = req.getParameter("bookingId"); // fallback

        if (bookingId != null && !bookingId.isEmpty()) {
            BookingDAO dao = new BookingDAO();
            dao.updatePaymentStatus(bookingId, "PAID");
        }

        // chuyển đến trang success hoặc booking details
        resp.sendRedirect(req.getContextPath() + "/booking-success.jsp?bookingId=" + bookingId);
    }

    // QR scan thường dùng GET — hỗ trợ GET để QR mở trực tiếp
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}


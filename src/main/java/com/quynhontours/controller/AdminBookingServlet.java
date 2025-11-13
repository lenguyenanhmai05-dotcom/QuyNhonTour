package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("bookingId");
        String action = request.getParameter("action");

        if ("confirm".equalsIgnoreCase(action) && bookingId != null && !bookingId.isEmpty()) {
            BookingDAO dao = new BookingDAO();
            dao.updatePaymentStatus(bookingId, "PAID");  // ✅ cập nhật trạng thái thanh toán
        }

        response.sendRedirect(request.getContextPath() + "/admin/admin-booking.jsp");
    }
}

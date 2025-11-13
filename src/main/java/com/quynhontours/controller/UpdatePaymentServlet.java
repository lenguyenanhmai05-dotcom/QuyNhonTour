package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdatePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        if (bookingId != null && !bookingId.isEmpty()) {
            BookingDAO dao = new BookingDAO();
            dao.updatePaymentStatus(bookingId, "PAID");
        }
        // Chuyển tới trang success nhỏ cho điện thoại
        response.sendRedirect(request.getContextPath() + "/payment-success.jsp?bookingId=" + bookingId);
    }

    // hỗ trợ GET (nếu cần)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

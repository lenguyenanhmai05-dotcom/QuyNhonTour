package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import com.quynhontours.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("bookingId");
        if (bookingId == null || bookingId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing bookingId");
            return;
        }

        BookingDAO dao = new BookingDAO();
        Booking booking = dao.getById(bookingId); // Dùng DAO thay vì Booking.getById

        if (booking == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Booking not found");
            return;
        }

        // Cập nhật trạng thái
        dao.updatePaymentStatus(bookingId, "PAID");

        // Load lại booking
        booking = dao.getById(bookingId);

        request.setAttribute("booking", booking);
        request.getRequestDispatcher("/booking-success.jsp").forward(request, response);
    }
}

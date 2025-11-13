package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import com.quynhontours.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class PaymentConfirmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("bookingId");
        if (bookingId == null || bookingId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing bookingId");
            return;
        }

        BookingDAO dao = new BookingDAO();
        Booking booking = dao.getById(bookingId);

        if (booking == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Booking not found");
            return;
        }

        dao.updatePaymentStatus(bookingId, "PAID");

        request.setAttribute("message", "Payment successful! Thank you for your booking.");
        request.getRequestDispatcher("payment-success.jsp").forward(request, response);

    }
}

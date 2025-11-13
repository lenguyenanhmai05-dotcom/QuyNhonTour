package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class PaymentSuccessServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");

        if (bookingId != null && !bookingId.isEmpty()) {
            BookingDAO dao = new BookingDAO();
            dao.updatePaymentStatus(bookingId, "PAID");
        }

        response.sendRedirect("booking-success.jsp?paid=true");
    }
}


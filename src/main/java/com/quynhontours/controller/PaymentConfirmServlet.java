package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class PaymentConfirmServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("bookingId");

        if (bookingId != null && !bookingId.isEmpty()) {
            BookingDAO dao = new BookingDAO();

            // Thanh toán ONLINE thành công → cập nhật paymentStatus & orderStatus
            dao.updatePaymentStatus(bookingId, "PAID");
            dao.updateOrderStatus(bookingId, "COMPLETED");
        }

        // Redirect về booking-success
        response.sendRedirect(request.getContextPath() 
                + "/booking-success.jsp?bookingId=" + bookingId + "&paid=true");
    }
}

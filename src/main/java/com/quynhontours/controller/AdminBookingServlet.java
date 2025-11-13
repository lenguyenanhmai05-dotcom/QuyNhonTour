package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import com.quynhontours.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("bookingId");
        String orderStatus = request.getParameter("orderStatus");

        if (bookingId != null && !bookingId.isEmpty() && orderStatus != null) {
            BookingDAO dao = new BookingDAO();

            // Cập nhật trạng thái order
            dao.updateOrderStatus(bookingId, orderStatus);

            // Lấy booking để kiểm tra paymentStatus
            Booking booking = dao.getById(bookingId);
            if ("COMPLETED".equalsIgnoreCase(orderStatus)
                && booking != null
                && "PENDING".equalsIgnoreCase(booking.getPaymentStatus())
                && "ONLINE".equalsIgnoreCase(booking.getPaymentMethod())) {

                // Nếu hoàn tất, tự động mark là PAID
                dao.updatePaymentStatus(bookingId, "PAID");
            }
        }

        // Quay lại trang admin-booking.jsp
        response.sendRedirect(request.getContextPath() + "/admin-booking.jsp");
    }
}

package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class OrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingId = request.getParameter("bookingId");
        String newStatus = request.getParameter("orderStatus"); // PROCESSING / COMPLETED / CANCELLED

        if (bookingId != null && newStatus != null) {
            BookingDAO dao = new BookingDAO();

            dao.updateOrderStatus(bookingId, newStatus);

            // Nếu admin chọn COMPLETED → cập nhật paymentStatus = PAID
            if ("COMPLETED".equalsIgnoreCase(newStatus)) {
                dao.updatePaymentStatus(bookingId, "PAID");
            }
        }

        // Quay lại trang admin danh sách đơn hàng
        response.sendRedirect("admin-booking.jsp");
    }
}

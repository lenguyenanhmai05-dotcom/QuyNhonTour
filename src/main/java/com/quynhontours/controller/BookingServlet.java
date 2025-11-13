package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import com.quynhontours.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tourName = request.getParameter("tourName");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String paymentMethod = request.getParameter("paymentMethod");

            int numAdults = parseIntSafe(request.getParameter("numAdults"));
            int numChildren = parseIntSafe(request.getParameter("numChildren"));
            int adultPrice = parseIntSafe(request.getParameter("adultPrice"));
            int childPrice = parseIntSafe(request.getParameter("childPrice"));

            // ✅ Tính tổng tiền thật
            double totalPrice = numAdults * adultPrice + numChildren * childPrice;

            // ✅ Tạo đối tượng Booking
            Booking booking = new Booking(
                    tourName, name, email, phone,
                    numAdults, numChildren,
                    paymentMethod, "PENDING",
                    totalPrice
            );

            // ✅ Lưu MongoDB
            BookingDAO dao = new BookingDAO();
            dao.insert(booking);

            // ✅ Lưu ID booking
            request.getSession().setAttribute("bookingId", booking.getId());

            // ✅ Điều hướng theo phương thức thanh toán
            if (paymentMethod.equalsIgnoreCase("ONLINE")) {
                response.sendRedirect("payment-demo.jsp?bookingId=" + booking.getId());
            } else {
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("booking-success.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid booking data");
        }
    }

    private int parseIntSafe(String str) {
        try { return Integer.parseInt(str); } catch (Exception e) { return 0; }
    }
}

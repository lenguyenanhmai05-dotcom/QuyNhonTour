package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import com.quynhontours.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class BookingHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 Lấy email người dùng từ session
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 🧠 Lấy danh sách booking theo email
        BookingDAO dao = new BookingDAO();
        List<Booking> bookings = dao.getBookingsByEmail(userEmail);

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("booking-history.jsp").forward(request, response);
    }
}

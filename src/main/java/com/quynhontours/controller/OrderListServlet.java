package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import com.quynhontours.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class OrderListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookingDAO dao = new BookingDAO();
        List<Booking> orders = dao.getAllBookings();

        request.setAttribute("orders", orders);
        RequestDispatcher rd = request.getRequestDispatcher("orders-list.jsp");
        rd.forward(request, response);
    }
}


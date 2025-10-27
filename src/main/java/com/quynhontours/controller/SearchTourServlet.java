package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class SearchTourServlet extends HttpServlet {
    private final TourDAO tourDAO = new TourDAO();

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String departure = request.getParameter("departure");
    String destination = request.getParameter("destination");
    String date = request.getParameter("date");
    String duration = request.getParameter("duration");

    System.out.println("[SearchTourServlet] departure=" + departure
            + " | destination=" + destination
            + " | date=" + date
            + " | duration=" + duration);

    List<Tour> tours = tourDAO.searchTours(departure, destination, date, duration);

    request.setAttribute("departure", departure);
    request.setAttribute("destination", destination);
    request.setAttribute("date", date);
    request.setAttribute("duration", duration);
    request.setAttribute("tours", tours);

    HttpSession session = request.getSession();
    session.setAttribute("lastDeparture", departure);
    session.setAttribute("lastDestination", destination);
    session.setAttribute("lastDate", date);
    session.setAttribute("lastDuration", duration);

    RequestDispatcher dispatcher = request.getRequestDispatcher("search-result.jsp");
    dispatcher.forward(request, response);
}

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // nếu form gửi POST thì redirect qua GET xử lý (giữ url sạch)
    doGet(req, resp);
}
}

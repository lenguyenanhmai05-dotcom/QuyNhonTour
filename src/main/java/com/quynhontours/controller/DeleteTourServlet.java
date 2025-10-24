package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteTourServlet extends HttpServlet {
    private TourDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new TourDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            dao.deleteTour(id);
        }
        response.sendRedirect(request.getContextPath() + "/admin/tours");
    }
}

package com.quynhontours.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Hủy session hiện tại (nếu có)
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Chuyển hướng về trang login.jsp ở thư mục gốc
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}

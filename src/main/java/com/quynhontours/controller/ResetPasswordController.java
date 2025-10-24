package com.quynhontours.controller;

import com.quynhontours.dao.UserDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ResetPasswordController extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("tempEmail"); // giữ nguyên như bạn đang dùng
        String newPassword = req.getParameter("newPassword");

        if (email == null || newPassword == null || newPassword.trim().isEmpty()) {
            resp.sendRedirect("reset-password.jsp?error=invalid");
            return;
        }

        // hash password trước khi lưu
        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
        userDAO.updatePassword(email, hashed);

        session.removeAttribute("forgotPasswordMode");
        session.removeAttribute("tempEmail");

        resp.sendRedirect("login.jsp?reset=success");
    }
}

package com.quynhontours.controller;

import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;
import com.quynhontours.service.OtpService;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class SendForgotOtpController extends HttpServlet {

    private final OtpService otpService = OtpService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        if (email == null || email.trim().isEmpty()) {
            response.sendRedirect("forgot-password.jsp?error=empty");
            return;
        }

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        if (user == null) {
            response.sendRedirect("forgot-password.jsp?error=notfound");
            return;
        }

        boolean sent = otpService.sendOtp(email);

        if (sent) {
            HttpSession session = request.getSession();
            session.setAttribute("resetEmail", email);
            response.sendRedirect("verify-reset-otp.jsp");
        } else {
            response.sendRedirect("forgot-password.jsp?error=fail");
        }
    }
}

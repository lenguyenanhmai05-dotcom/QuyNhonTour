package com.quynhontours.controller;

import com.quynhontours.service.OtpService;
import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/send-otp")
public class SendOtpController extends HttpServlet {

    private final OtpService otpService = OtpService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            response.sendRedirect("login.jsp?error=empty");
            return;
        }

        boolean sent = otpService.sendOtp(email); // ✅ dòng này giờ chạy được 100%

        if (sent) {
            HttpSession session = request.getSession();
            session.setAttribute("tempEmail", email);
            response.sendRedirect("verify-otp.jsp");
        } else {
            response.sendRedirect("login.jsp?error=fail");
        }
    }
}

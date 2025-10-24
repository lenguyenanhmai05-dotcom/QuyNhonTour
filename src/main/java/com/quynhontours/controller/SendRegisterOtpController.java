package com.quynhontours.controller;

import com.quynhontours.service.OtpService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SendRegisterOtpController extends HttpServlet {
    private final OtpService otpService = OtpService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (email == null || email.isEmpty() || !password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=invalid");
            return;
        }

        boolean sent = otpService.sendOtp(email);

        if (sent) {
            HttpSession session = request.getSession();
            // Lưu tạm thông tin đăng ký để xác thực sau OTP
            session.setAttribute("tempEmail", email);
            session.setAttribute("tempFirstName", firstName);
            session.setAttribute("tempLastName", lastName);
            session.setAttribute("tempPhone", phone);
            session.setAttribute("tempDob", dob);
            session.setAttribute("tempPassword", password);
            session.setAttribute("registerMode", true); // 🔑 để phân biệt với login OTP
            response.sendRedirect("verify-otp.jsp");
        } else {
            response.sendRedirect("register.jsp?error=fail");
        }
    }
}

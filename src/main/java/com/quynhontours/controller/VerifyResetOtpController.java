package com.quynhontours.controller;

import com.quynhontours.service.OtpService;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class VerifyResetOtpController extends HttpServlet {

    private final OtpService otpService = OtpService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String otp = request.getParameter("otp");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");

        if (email == null || otp == null || otp.trim().isEmpty()) {
            response.sendRedirect("forgot-password.jsp?error=session");
            return;
        }

        boolean valid = otpService.validateOtp(email, otp);

        if (!valid) {
            response.sendRedirect("verify-reset-otp.jsp?error=invalid");
            return;
        }

        // ✅ Nếu OTP đúng → Lưu email tạm để dùng ở bước đặt lại mật khẩu
        session.setAttribute("tempEmail", email);

        // ✅ Chuyển đến trang nhập mật khẩu mới
        response.sendRedirect("reset-password.jsp");
    }
}

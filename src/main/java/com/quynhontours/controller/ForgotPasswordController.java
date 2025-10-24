package com.quynhontours.controller;

import com.quynhontours.service.OtpService;
import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ForgotPasswordController extends HttpServlet {

    private final OtpService otpService = OtpService.getInstance();
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");

        // 🔹 Kiểm tra email có tồn tại không
        User user = userDAO.getUserByEmail(email);
        if (user == null) {
            resp.sendRedirect("forgot-password.jsp?error=notfound");
            return;
        }

        // 🔹 Gửi OTP
        boolean sent = otpService.sendOtp(email);
        if (!sent) {
            resp.sendRedirect("forgot-password.jsp?error=fail");
            return;
        }

        // 🔹 Lưu email tạm vào session để xác thực OTP
        HttpSession session = req.getSession();
        session.setAttribute("resetEmail", email); // ⚙️ đổi thành resetEmail để khớp với VerifyResetOtpController
        session.setAttribute("forgotPasswordMode", true);

        // 🔹 Chuyển sang trang xác thực OTP reset mật khẩu
        resp.sendRedirect("verify-reset-otp.jsp");
    }
}

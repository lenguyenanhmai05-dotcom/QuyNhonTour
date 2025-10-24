package com.quynhontours.controller;

import com.quynhontours.service.OtpService;
import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class VerifyOtpController extends HttpServlet {
    private final OtpService otpService = OtpService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String otp = request.getParameter("otp");
        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("tempEmail");
        String firstName = (String) session.getAttribute("tempFirstName");
        String lastName = (String) session.getAttribute("tempLastName");
        String phone = (String) session.getAttribute("tempPhone");
        String dob = (String) session.getAttribute("tempDob");
        String password = (String) session.getAttribute("tempPassword");

        if (email == null || otp == null) {
            response.sendRedirect("login.jsp?error=session");
            return;
        }

        boolean valid = otpService.validateOtp(email, otp);

        if (valid) {
            // ✅ Khi OTP đúng → Lưu user vào MongoDB
            UserDAO userDAO = new UserDAO();

            // Hash lại password trước khi lưu
            String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));

            User user = new User(firstName, lastName, email, phone, dob, hashed, "user");
            boolean inserted = userDAO.insertUser(user);

            if (inserted) {
                // Xóa OTP và dữ liệu tạm
                session.removeAttribute("tempEmail");
                session.removeAttribute("tempFirstName");
                session.removeAttribute("tempLastName");
                session.removeAttribute("tempPhone");
                session.removeAttribute("tempDob");
                session.removeAttribute("tempPassword");

                // Gắn session login luôn
                session.setAttribute("userEmail", email);
                session.setAttribute("firstName", firstName);
                session.setAttribute("role", "user");

                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("register.jsp?error=exists");
            }

        } else {
            response.sendRedirect("verify-otp.jsp?error=invalid");
        }
    }
}

package com.quynhontours.controller;

import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Đảm bảo đọc Unicode tiếng Việt
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Kiểm tra rỗng
        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect("login.html?error=empty");
            return;
        }

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        if (user != null) {
            String storedPassword = user.getPassword();

            boolean isPasswordValid;

            // Kiểm tra nếu password trong DB là hash (dài hơn 50 ký tự)
            if (storedPassword != null && storedPassword.length() > 50) {
                isPasswordValid = BCrypt.checkpw(password, storedPassword);
            } else {
                // Trường hợp password lưu dạng plain text (cũ)
                isPasswordValid = password.equals(storedPassword);
            }

            if (isPasswordValid) {
                // ✅ Đăng nhập thành công → tạo session
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", user.getEmail());
                session.setAttribute("firstName", user.getFirstName());
                session.setAttribute("role", user.getRole());

                // Điều hướng theo role
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
                return;
            }
        }

        // ❌ Sai email hoặc mật khẩu
        response.sendRedirect("login.html?error=invalid");
    }
}

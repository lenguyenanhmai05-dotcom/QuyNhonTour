package com.quynhontours.controller;

import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Đọc Unicode (hỗ trợ tiếng Việt)
        request.setCharacterEncoding("UTF-8");

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
        String phone     = request.getParameter("phone");
        String dob       = request.getParameter("dob");
        String password  = request.getParameter("password");
        String confirm   = request.getParameter("confirmPassword");

        // 🧩 Kiểm tra dữ liệu trống
        if (firstName == null || lastName == null || email == null || password == null ||
            firstName.trim().isEmpty() || lastName.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty()) {

            request.setAttribute("error", "Please fill in all required fields.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 🧩 Kiểm tra password trùng khớp
        if (!password.equals(confirm)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 🧩 Hash mật khẩu bằng BCrypt (12 rounds)
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        // 🧩 Tạo đối tượng User
        User user = new User(firstName, lastName, email, phone, dob, hashedPassword, "user");

        // 🧩 Gọi DAO để lưu MongoDB
        UserDAO userDAO = new UserDAO();

        // Kiểm tra email đã tồn tại chưa
        if (userDAO.getUserByEmail(email) != null) {
            request.setAttribute("error", "Email is already registered!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        boolean inserted = userDAO.insertUser(user);

        if (inserted) {
            // ✅ Sau khi đăng ký xong → chuyển sang login
            response.sendRedirect("login.html?registered=true");
        } else {
            // ❌ Nếu lỗi MongoDB hoặc chèn thất bại
            request.setAttribute("error", "Registration failed. Please try again later.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}

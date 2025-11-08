package com.quynhontours.controller;

import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.regex.Pattern;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Hỗ trợ tiếng Việt
        request.setCharacterEncoding("UTF-8");

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
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

        // 🧩 Kiểm tra độ mạnh mật khẩu
        // - Ít nhất 8 ký tự
        // - Có ít nhất 1 chữ cái (viết hoa hoặc thường)
        // - Có ít nhất 1 chữ số
        // - Có thể thêm yêu cầu ký tự đặc biệt nếu muốn
        String passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";

        if (!Pattern.matches(passwordRegex, password)) {
            request.setAttribute("error",
                    "Password must be at least 8 characters long and contain both letters and numbers.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 🧩 Hash mật khẩu bằng BCrypt (12 rounds)
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        // 🧩 Tạo đối tượng User
        User user = new User(firstName, lastName, email, dob, hashedPassword, "user");

        UserDAO userDAO = new UserDAO();

        // Kiểm tra email đã tồn tại chưa
        if (userDAO.getUserByEmail(email) != null) {
            request.setAttribute("error", "Email is already registered!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 🧩 Lưu user mới
        boolean inserted = userDAO.insertUser(user);

        if (inserted) {
            response.sendRedirect("login.jsp?registered=true");
        } else {
            request.setAttribute("error", "Registration failed. Please try again later.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}

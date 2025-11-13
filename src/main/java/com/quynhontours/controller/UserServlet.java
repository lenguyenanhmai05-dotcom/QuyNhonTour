package com.quynhontours.controller;

import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class UserServlet extends HttpServlet {

    private UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch(action) {
            case "new":
                request.getRequestDispatcher("/admin/user-form.jsp").forward(request, response);
                break;

            case "edit":
                String email = request.getParameter("email");
                User user = dao.getUserByEmail(email);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/admin/user-form.jsp").forward(request, response);
                break;

            case "delete":
                dao.deleteUser(request.getParameter("email"));
                response.sendRedirect("users");
                break;

            default:
                // list all users
                List<User> users = dao.getAllUsers();
                request.setAttribute("list", users);
                request.getRequestDispatcher("/admin/users-list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User user = new User(firstName, lastName, email, dob, password, role);

        if (dao.getUserByEmail(email) == null) {
            dao.insertUser(user);
        } else {
            // Update existing user (here you can implement update if needed)
            // Example: only update firstName, lastName, dob, role
            // dao.updateUser(user); // you can add this method
        }

        response.sendRedirect("users");
    }
}

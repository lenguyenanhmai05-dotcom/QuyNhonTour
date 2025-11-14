package com.quynhontours.controller;

import com.quynhontours.dao.UserDAO;
import com.quynhontours.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateUserProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");

        UserDAO dao = new UserDAO();
        boolean success = dao.updateUserProfile(email, firstName, lastName, phone);

        if (success) {
            // Update session
            session.setAttribute("firstName", firstName);
            session.setAttribute("lastName", lastName);
            request.setAttribute("message", "Profile updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update profile.");
        }

        // Forward back to profile page to show message
        request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
    }
}
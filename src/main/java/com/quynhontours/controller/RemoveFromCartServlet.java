package com.quynhontours.controller;

import com.quynhontours.model.Tour;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<Tour> cart = (List<Tour>) session.getAttribute("cart");

        if (cart != null && id != null) {
            cart.removeIf(t -> t.getId().equals(id));
            // Nếu sau khi xóa mà trống => bỏ hẳn cart khỏi session
            if (cart.isEmpty()) {
                session.removeAttribute("cart");
            } else {
                session.setAttribute("cart", cart);
            }
        }

        // Trả về lại cùng trang để JSP tự kiểm tra rỗng hay không
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}

package com.quynhontours.controller;

import com.quynhontours.dao.BookingDAO;
import com.quynhontours.model.Booking;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tourName = request.getParameter("tourName");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            int numAdults = parseIntSafe(request.getParameter("numAdults"));
            int numChildren = parseIntSafe(request.getParameter("numChildren"));
            int adultPrice = parseIntSafe(request.getParameter("adultPrice"));
            int childPrice = parseIntSafe(request.getParameter("childPrice"));

            // ✅ Tính tổng tiền
            double totalPrice = numAdults * adultPrice + numChildren * childPrice;

            // ✅ Lấy startDate từ form và parse
            String startDateStr = request.getParameter("startDate");
            Date startDate = null;
            if (startDateStr != null && !startDateStr.isEmpty()) {
                try {
                    // Form input type="date" gửi định dạng yyyy-MM-dd
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    startDate = sdf.parse(startDateStr);
                } catch (Exception e) {
                    e.printStackTrace();
                    // Nếu parse lỗi, startDate để null
                }
            }

            // ✅ Tạo đối tượng Booking (ONLINE payment)
            Booking booking = new Booking(
                    tourName, name, email, phone,
                    numAdults, numChildren,
                    "PENDING", totalPrice, startDate // thêm startDate
            );

            // ✅ Lưu vào MongoDB
            BookingDAO dao = new BookingDAO();
            dao.insert(booking);

            // ✅ Lưu ID & email vào session
            HttpSession session = request.getSession();
            session.setAttribute("bookingId", booking.getId());
            session.setAttribute("userEmail", email);

            // Chuyển sang payment page (trạng thái vẫn PENDING)
            response.sendRedirect("payment.jsp?bookingId=" + booking.getId());

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid booking data");
        }
    }

    private int parseIntSafe(String str) {
        try { return Integer.parseInt(str); } catch (Exception e) { return 0; }
    }
}

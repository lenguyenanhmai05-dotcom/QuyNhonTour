package com.quynhontours.controller;

import com.quynhontours.dao.TourDAO;
import com.quynhontours.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/addTour")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,    // 1MB
        maxFileSize = 10 * 1024 * 1024,     // 10MB
        maxRequestSize = 50 * 1024 * 1024   // 50MB
)
public class AddTourServlet extends HttpServlet {
    private TourDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new TourDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            // Lấy dữ liệu text
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String departure = request.getParameter("departure");
            String destination = request.getParameter("destination");
            String duration = request.getParameter("duration");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String priceAdultStr = request.getParameter("adultPrice");
            String priceChildStr = request.getParameter("childPrice");

            double priceAdult = 0;
            double priceChild = 0;

            if (priceAdultStr != null && !priceAdultStr.trim().isEmpty()) {
                priceAdult = Double.parseDouble(priceAdultStr);
            }
            if (priceChildStr != null && !priceChildStr.trim().isEmpty()) {
                priceChild = Double.parseDouble(priceChildStr);
            }

            // Xử lý upload ảnh
            Part filePart = request.getPart("image");
            String fileName = null;
            String imagePath = null;

            if (filePart != null && filePart.getSize() > 0) {
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                // Đường dẫn thực tế để lưu ảnh trong thư mục "images"
                String uploadDir = getServletContext().getRealPath("") + File.separator + "images";
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                // Ghi file xuống server
                filePart.write(uploadDir + File.separator + fileName);

                // Lưu đường dẫn tương đối vào DB (dùng cho hiển thị)
                imagePath = "images/" + fileName;
            } else {
                imagePath = "images/default.jpg"; // fallback nếu không có ảnh
            }

            // Tạo đối tượng Tour
            Tour tour = new Tour(
                    name, description, location, destination, departure,
                    duration, startDate, endDate, priceAdult, priceChild, imagePath
            );

            boolean success = dao.addTour(tour);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/tours?msg=added");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/tours?error=add_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/tours?error=server_error");
        }
    }
}

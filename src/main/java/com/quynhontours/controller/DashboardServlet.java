package com.quynhontours.controller;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.quynhontours.utils.MongoDBConnection;
import org.bson.Document;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        MongoDatabase db = MongoDBConnection.getDatabase();

        // --- Tổng số tours, news, users ---
        long tourCount = db.getCollection("tours").countDocuments();
        long newsCount = db.getCollection("news").countDocuments();
        long userCount = db.getCollection("users").countDocuments();

        // --- Bookings collection (cho user / thống kê booking riêng) ---
        MongoCollection<Document> bookingsColl = db.getCollection("bookings");
        long bookingCount = bookingsColl.countDocuments();

        // --- Orders collection (cho admin / thống kê order) ---
        MongoCollection<Document> ordersColl = db.getCollection("orders");
        long orderCount = ordersColl.countDocuments();

        long completed = ordersColl.countDocuments(Filters.eq("orderStatus", "COMPLETED"));
        long processing = ordersColl.countDocuments(Filters.eq("orderStatus", "PROCESSING"));
        long canceled = ordersColl.countDocuments(Filters.eq("orderStatus", "CANCELED"));

        // --- Set attributes cho JSP ---
        req.setAttribute("tourCount", tourCount);
        req.setAttribute("newsCount", newsCount);
        req.setAttribute("userCount", userCount);

        req.setAttribute("bookingCount", bookingCount); // hiển thị riêng
        req.setAttribute("orderCount", orderCount);     // hiển thị số orders cho admin

        req.setAttribute("completed", completed);
        req.setAttribute("processing", processing);
        req.setAttribute("canceled", canceled);

        // --- Chuyển tiếp sang dashboard.jsp ---
        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }
}

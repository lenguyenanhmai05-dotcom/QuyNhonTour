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

        long tourCount = db.getCollection("tours").countDocuments();
        long newsCount = db.getCollection("news").countDocuments();
        long userCount = db.getCollection("users").countDocuments();

        // ✅ bookings collection
        MongoCollection<Document> bookings = db.getCollection("bookings");
        long bookingCount = bookings.countDocuments();

        // ✅ status count
        long completed = bookings.countDocuments(Filters.eq("status", "COMPLETED"));
        long processing = bookings.countDocuments(Filters.eq("status", "PROCESSING"));
        long canceled = bookings.countDocuments(Filters.eq("status", "CANCELED"));

        // ✅ set attributes cho JSP
        req.setAttribute("tourCount", tourCount);
        req.setAttribute("newsCount", newsCount);
        req.setAttribute("userCount", userCount);
        req.setAttribute("bookingCount", bookingCount);
        req.setAttribute("completed", completed);
        req.setAttribute("processing", processing);
        req.setAttribute("canceled", canceled);

        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }
}

package com.quynhontours.controller;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.quynhontours.utils.MongoDBConnection;
import org.bson.Document;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/orders")
public class OrderListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MongoDatabase database = MongoDBConnection.getDatabase();
        MongoCollection<Document> ordersCollection = database.getCollection("orders");

        List<Document> orders = new ArrayList<>();
        try (MongoCursor<Document> cursor = ordersCollection.find().iterator()) {
            while (cursor.hasNext()) {
                orders.add(cursor.next());
            }
        }

        request.setAttribute("orders", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/orders-list.jsp");
        dispatcher.forward(request, response);
    }
}

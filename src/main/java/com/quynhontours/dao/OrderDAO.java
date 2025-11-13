package com.quynhontours.dao;

import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.quynhontours.model.Order;
import com.quynhontours.utils.MongoDBConnection;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private MongoCollection<Document> orderCollection;

    public OrderDAO() {
        MongoDatabase database = MongoDBConnection.getDatabase();
        orderCollection = database.getCollection("orders");
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        FindIterable<Document> docs = orderCollection.find();
        for (Document d : docs) {
            Order o = new Order(
                    d.getObjectId("_id").toString(),
                    d.getString("userName"),
                    d.getString("tourName"),
                    d.getString("bookingDate"),
                    d.getInteger("adults", 0),
                    d.getInteger("children", 0),
                    d.getDouble("totalPrice"),
                    d.getString("status")
            );
            list.add(o);
        }
        return list;
    }

    public void deleteOrder(String id) {
        orderCollection.deleteOne(Filters.eq("_id", new org.bson.types.ObjectId(id)));
    }
}


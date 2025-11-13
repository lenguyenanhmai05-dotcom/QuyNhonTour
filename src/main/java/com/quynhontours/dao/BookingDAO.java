package com.quynhontours.dao;

import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.Document;
import org.bson.types.ObjectId;
import java.util.*;
import com.quynhontours.model.Booking;
import com.quynhontours.utils.MongoDBConnection;

public class BookingDAO {

    private final MongoCollection<Document> bookingsColl;
    private final MongoCollection<Document> ordersColl;

    public BookingDAO() {
        MongoDatabase db = MongoDBConnection.getDatabase();
        bookingsColl = db.getCollection("bookings"); // dữ liệu người dùng
        ordersColl = db.getCollection("orders");     // dữ liệu admin dashboard
    }

    // Thêm booking mới vào cả 2 collection
    public void insert(Booking b) {
        Document doc = b.toDocument();

        bookingsColl.insertOne(doc);
        ordersColl.insertOne(doc);

        // Lưu lại ID
        b.setId(doc.getObjectId("_id").toHexString());
    }

    // Lấy tất cả booking (admin)
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        for (Document doc : ordersColl.find()) {
            list.add(Booking.fromDocument(doc));
        }
        return list;
    }

    // Lấy booking theo email (user)
    public List<Booking> getBookingsByEmail(String email) {
        List<Booking> list = new ArrayList<>();
        for (Document doc : bookingsColl.find(Filters.eq("customerEmail", email))) {
            list.add(Booking.fromDocument(doc));
        }
        return list;
    }

    // Lấy booking theo ID
    public Booking getById(String id) {
        if (id == null || !ObjectId.isValid(id)) return null;
        Document doc = bookingsColl.find(Filters.eq("_id", new ObjectId(id))).first();
        return (doc != null) ? Booking.fromDocument(doc) : null;
    }

    // Cập nhật trạng thái thanh toán (PAID / PENDING)
    public void updatePaymentStatus(String id, String newStatus) {
        if (id != null && ObjectId.isValid(id)) {
            bookingsColl.updateOne(Filters.eq("_id", new ObjectId(id)), Updates.set("paymentStatus", newStatus));
            ordersColl.updateOne(Filters.eq("_id", new ObjectId(id)), Updates.set("paymentStatus", newStatus));
        }
    }

    // Cập nhật trạng thái đơn hàng (PROCESSING / COMPLETED / CANCELLED)
    public void updateOrderStatus(String id, String newStatus) {
        if (id != null && ObjectId.isValid(id)) {
            bookingsColl.updateOne(Filters.eq("_id", new ObjectId(id)), Updates.set("orderStatus", newStatus));
            ordersColl.updateOne(Filters.eq("_id", new ObjectId(id)), Updates.set("orderStatus", newStatus));
        }
    }

    // Xóa booking
    public void deleteById(String id) {
        if (id != null && ObjectId.isValid(id)) {
            bookingsColl.deleteOne(Filters.eq("_id", new ObjectId(id)));
            ordersColl.deleteOne(Filters.eq("_id", new ObjectId(id)));
        }
    }
}

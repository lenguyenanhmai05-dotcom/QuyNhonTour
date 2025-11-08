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
    private final MongoCollection<Document> collection;

    public BookingDAO() {
        MongoDatabase db = MongoDBConnection.getDatabase();
        collection = db.getCollection("bookings");
    }

    // 🟢 Thêm booking mới
    public void insert(Booking b) {
        Document doc = b.toDocument();
        collection.insertOne(doc);
        b.setId(doc.getObjectId("_id").toHexString());
    }

    // 🟡 Lấy tất cả booking (cho admin)
    public List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();
        for (Document doc : collection.find()) {
            list.add(Booking.fromDocument(doc));
        }
        return list;
    }

    // 🟣 Lấy booking theo email (cho user)
    public List<Booking> getBookingsByEmail(String email) {
        List<Booking> list = new ArrayList<>();
        for (Document doc : collection.find(Filters.eq("customerEmail", email))) {
            list.add(Booking.fromDocument(doc));
        }
        return list;
    }

    // 🔵 Lấy booking theo ID
    public Booking getById(String id) {
        if (id == null || !ObjectId.isValid(id)) return null;
        Document doc = collection.find(Filters.eq("_id", new ObjectId(id))).first();
        return (doc != null) ? Booking.fromDocument(doc) : null;
    }

    // 🟠 Cập nhật trạng thái thanh toán
    public void updatePaymentStatus(String id, String newStatus) {
        if (id != null && ObjectId.isValid(id)) {
            collection.updateOne(
                Filters.eq("_id", new ObjectId(id)),
                Updates.set("paymentStatus", newStatus)
            );
        }
    }

    // 🔴 Xóa booking
    public void deleteById(String id) {
        if (id != null && ObjectId.isValid(id)) {
            collection.deleteOne(Filters.eq("_id", new ObjectId(id)));
        }
    }
}

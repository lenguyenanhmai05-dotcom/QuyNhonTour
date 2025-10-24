package com.quynhontours.dao;

import com.quynhontours.model.User;
import com.quynhontours.utils.MongoDBConnection;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;

public class UserDAO {
    private final MongoCollection<Document> users;

    public UserDAO() {
        MongoDatabase db = MongoDBConnection.getDatabase();
        users = db.getCollection("users");
    }

    // 🟢 Thêm user mới (nếu email chưa tồn tại)
    public boolean insertUser(User user) {
        if (getUserByEmail(user.getEmail()) != null) return false;
        Document doc = new Document("firstName", user.getFirstName())
                .append("lastName", user.getLastName())
                .append("email", user.getEmail())
                .append("phone", user.getPhone())
                .append("dob", user.getDob())
                .append("password", user.getPassword())
                .append("role", user.getRole());
        users.insertOne(doc);
        return true;
    }

    // 🟢 Lấy user theo email
    public User getUserByEmail(String email) {
        Document doc = users.find(Filters.eq("email", email)).first();
        if (doc == null) return null;
        User u = new User();
        u.setFirstName(doc.getString("firstName"));
        u.setLastName(doc.getString("lastName"));
        u.setEmail(doc.getString("email"));
        u.setPhone(doc.getString("phone"));
        u.setDob(doc.getString("dob"));
        u.setPassword(doc.getString("password"));
        u.setRole(doc.getString("role"));
        return u;
    }

    // 🟢 Kiểm tra đăng nhập (email + password)
    public boolean validateLogin(String email, String password) {
        Document doc = users.find(Filters.and(
                Filters.eq("email", email),
                Filters.eq("password", password)
        )).first();
        return doc != null;
    }

    // 🟢 Cập nhật mật khẩu (quên mật khẩu)
    public boolean updatePassword(String email, String newPassword) {
        Document found = users.find(Filters.eq("email", email)).first();
        if (found == null) return false;

        users.updateOne(Filters.eq("email", email),
                new Document("$set", new Document("password", newPassword)));
        return true;
    }
}

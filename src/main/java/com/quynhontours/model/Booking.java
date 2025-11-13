package com.quynhontours.model;

import org.bson.Document;
import java.util.Date;

public class Booking {
    private String id;
    private String tourName;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private int numAdults;
    private int numChildren;
    private int guests;
    private final String paymentMethod = "ONLINE"; // chỉ online
    private String paymentStatus; // PENDING, PAID
    private double totalPrice;
    private String orderStatus;   // PROCESSING, COMPLETED, CANCELLED
    private Date startDate;       // thống nhất với JSP: startDate

    // ===== Constructors =====
    public Booking() {}

    public Booking(String tourName, String customerName, String customerEmail, String customerPhone,
                   int numAdults, int numChildren, String paymentStatus, double totalPrice, Date startDate) {
        this.tourName = tourName;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.numAdults = numAdults;
        this.numChildren = numChildren;
        this.guests = numAdults + numChildren;
        this.paymentStatus = paymentStatus;
        this.totalPrice = totalPrice;
        this.startDate = startDate;

        // Tự động set orderStatus theo paymentStatus
        if ("PAID".equalsIgnoreCase(paymentStatus)) {
            this.orderStatus = "COMPLETED";
        } else if ("PENDING".equalsIgnoreCase(paymentStatus)) {
            this.orderStatus = "PROCESSING";
        } else {
            this.orderStatus = "CANCELLED";
        }
    }

    // ===== Getters & Setters =====
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTourName() { return tourName; }
    public void setTourName(String tourName) { this.tourName = tourName; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getCustomerEmail() { return customerEmail; }
    public void setCustomerEmail(String customerEmail) { this.customerEmail = customerEmail; }

    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }

    public int getNumAdults() { return numAdults; }
    public void setNumAdults(int numAdults) { this.numAdults = numAdults; }

    public int getNumChildren() { return numChildren; }
    public void setNumChildren(int numChildren) { this.numChildren = numChildren; }

    public int getGuests() { return guests; }
    public void setGuests(int guests) { this.guests = guests; }

    public String getPaymentMethod() { return paymentMethod; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
        // Cập nhật orderStatus theo paymentStatus
        if ("PAID".equalsIgnoreCase(paymentStatus)) {
            this.orderStatus = "COMPLETED";
        } else if ("PENDING".equalsIgnoreCase(paymentStatus)) {
            this.orderStatus = "PROCESSING";
        } else {
            this.orderStatus = "CANCELLED";
        }
    }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public String getOrderStatus() { return orderStatus; }
    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    // ===== Convert to MongoDB Document =====
    public Document toDocument() {
        return new Document("tourName", tourName)
                .append("customerName", customerName)
                .append("customerEmail", customerEmail)
                .append("customerPhone", customerPhone)
                .append("numAdults", numAdults)
                .append("numChildren", numChildren)
                .append("guests", guests)
                .append("paymentMethod", paymentMethod)
                .append("paymentStatus", paymentStatus)
                .append("totalPrice", totalPrice)
                .append("orderStatus", orderStatus)
                .append("startDate", startDate); // MongoDB dùng startDate
    }

    // ===== Convert from MongoDB Document =====
    public static Booking fromDocument(Document doc) {
        Booking b = new Booking();
        b.setId(doc.getObjectId("_id").toHexString());
        b.setTourName(doc.getString("tourName"));
        b.setCustomerName(doc.getString("customerName"));
        b.setCustomerEmail(doc.getString("customerEmail"));
        b.setCustomerPhone(doc.getString("customerPhone"));

        Number adultsNum = (Number) doc.get("numAdults");
        b.setNumAdults(adultsNum != null ? adultsNum.intValue() : 0);

        Number childrenNum = (Number) doc.get("numChildren");
        b.setNumChildren(childrenNum != null ? childrenNum.intValue() : 0);

        Number guestsNum = (Number) doc.get("guests");
        b.setGuests(guestsNum != null ? guestsNum.intValue() : (b.getNumAdults() + b.getNumChildren()));

        b.setPaymentStatus(doc.getString("paymentStatus"));

        Number totalPriceNum = (Number) doc.get("totalPrice");
        b.setTotalPrice(totalPriceNum != null ? totalPriceNum.doubleValue() : 0.0);

        String statusFromDb = doc.getString("orderStatus");
        String paymentStatus = b.getPaymentStatus();
        if (statusFromDb != null && !statusFromDb.isEmpty()) {
            b.setOrderStatus(statusFromDb);
        } else {
            if ("PAID".equalsIgnoreCase(paymentStatus)) {
                b.setOrderStatus("COMPLETED");
            } else if ("PENDING".equalsIgnoreCase(paymentStatus)) {
                b.setOrderStatus("PROCESSING");
            } else {
                b.setOrderStatus("CANCELLED");
            }
        }

        // ===== Lấy startDate từ MongoDB =====
        b.setStartDate(doc.getDate("startDate"));

        return b;
    }
}

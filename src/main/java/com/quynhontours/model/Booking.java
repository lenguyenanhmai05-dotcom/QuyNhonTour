package com.quynhontours.model;

import org.bson.Document;

public class Booking {
    private String id;
    private String tourName;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private int numAdults;
    private int numChildren;
    private int guests;
    private String paymentMethod;
    private String paymentStatus;
    private double totalPrice;

    public Booking() {}

    public Booking(String tourName, String name, String email, String phone,
                   int numAdults, int numChildren, String paymentMethod,
                   String paymentStatus, double totalPrice) {
        this.tourName = tourName;
        this.customerName = name;
        this.customerEmail = email;
        this.customerPhone = phone;
        this.numAdults = numAdults;
        this.numChildren = numChildren;
        this.guests = numAdults + numChildren;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.totalPrice = totalPrice;
    }

    // 🧩 Getter – Setter
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
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    // 🧠 Convert sang Document để lưu MongoDB
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
                .append("totalPrice", totalPrice);
    }

    public static Booking fromDocument(Document doc) {
        Booking b = new Booking();
        b.setId(doc.getObjectId("_id").toHexString());
        b.setTourName(doc.getString("tourName"));
        b.setCustomerName(doc.getString("customerName"));
        b.setCustomerEmail(doc.getString("customerEmail"));
        b.setCustomerPhone(doc.getString("customerPhone"));
        b.setNumAdults(doc.getInteger("numAdults", 0));
        b.setNumChildren(doc.getInteger("numChildren", 0));
        b.setGuests(doc.getInteger("guests", 0));
        b.setPaymentMethod(doc.getString("paymentMethod"));
        b.setPaymentStatus(doc.getString("paymentStatus"));
        b.setTotalPrice(doc.getDouble("totalPrice"));
        return b;
    }
}

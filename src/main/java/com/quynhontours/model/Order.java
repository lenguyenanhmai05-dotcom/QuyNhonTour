package com.quynhontours.model;

public class Order {
    private String id;
    private String userName;
    private String tourName;
    private String bookingDate;
    private int adults;
    private int children;
    private double totalPrice;
    private String status;

    public Order() {}

    public Order(String id, String userName, String tourName, String bookingDate,
                 int adults, int children, double totalPrice, String status) {
        this.id = id;
        this.userName = userName;
        this.tourName = tourName;
        this.bookingDate = bookingDate;
        this.adults = adults;
        this.children = children;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    public String getTourName() { return tourName; }
    public void setTourName(String tourName) { this.tourName = tourName; }
    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }
    public int getAdults() { return adults; }
    public void setAdults(int adults) { this.adults = adults; }
    public int getChildren() { return children; }
    public void setChildren(int children) { this.children = children; }
    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}


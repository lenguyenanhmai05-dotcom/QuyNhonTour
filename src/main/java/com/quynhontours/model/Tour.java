package com.quynhontours.model;

public class Tour {
    private String id;
    private String name;
    private String description;
    private String location;
    private double price;
    private String startDate;
    private String endDate;

    public Tour() {}

    public Tour(String id, String name, String description, String location, double price, String startDate, String endDate) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.location = location;
        this.price = price;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Tour(String name, String description, String location, double price, String startDate, String endDate) {
        this(null, name, description, location, price, startDate, endDate);
    }

    // getters / setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }
}

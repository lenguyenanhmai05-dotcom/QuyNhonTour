package com.quynhontours.model;

public class Tour {
    private String id;
    private String name;
    private String description;
    private String location;
    private String destination;
    private String departure;
    private String duration;
    private String startDate;
    private String endDate;
    private double adultPrice;   // ✅ giá người lớn
    private double childPrice;   // ✅ giá trẻ em
    private String image;
    private String detailsPage;

    public Tour() {}

    // ✅ Constructor thêm mới (chưa có id)
    public Tour(String name, String description, String location, String destination,
                String departure, String duration,
                String startDate, String endDate,
                double adultPrice, double childPrice, String image) {
        this.name = name;
        this.description = description;
        this.location = location;
        this.destination = destination;
        this.departure = departure;
        this.duration = duration;
        this.startDate = startDate;
        this.endDate = endDate;
        this.adultPrice = adultPrice;
        this.childPrice = childPrice;
        this.image = image;
    }

    // ✅ Constructor có id
    public Tour(String id, String name, String description, String location, String destination,
                String departure, String duration,
                String startDate, String endDate,
                double adultPrice, double childPrice, String image) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.location = location;
        this.destination = destination;
        this.departure = departure;
        this.duration = duration;
        this.startDate = startDate;
        this.endDate = endDate;
        this.adultPrice = adultPrice;
        this.childPrice = childPrice;
        this.image = image;
    }

    // ✅ Constructor đầy đủ (có detailsPage)
    public Tour(String id, String name, String description, String location, String destination,
                String departure, String duration,
                String startDate, String endDate,
                double adultPrice, double childPrice, String image, String detailsPage) {
        this(id, name, description, location, destination, departure, duration,
             startDate, endDate, adultPrice, childPrice, image);
        this.detailsPage = detailsPage;
    }

    // ✅ Getters & Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getDeparture() { return departure; }
    public void setDeparture(String departure) { this.departure = departure; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }

    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }

    public double getAdultPrice() { return adultPrice; }
    public void setAdultPrice(double adultPrice) { this.adultPrice = adultPrice; }

    public double getChildPrice() { return childPrice; }
    public void setChildPrice(double childPrice) { this.childPrice = childPrice; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public String getDetailsPage() { return detailsPage; }
    public void setDetailsPage(String detailsPage) { this.detailsPage = detailsPage; }
}

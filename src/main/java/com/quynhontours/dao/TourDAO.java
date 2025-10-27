package com.quynhontours.dao;

import com.quynhontours.model.Tour;
import com.quynhontours.utils.MongoDBConnection;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class TourDAO {

    private final MongoCollection<Document> tours;

    public TourDAO() {
        MongoDatabase db = MongoDBConnection.getDatabase();
        this.tours = db.getCollection("tours");
    }

    // Lấy tất cả tour
    public List<Tour> getAllTours() {
        List<Tour> list = new ArrayList<>();
        FindIterable<Document> docs = tours.find();
        for (Document doc : docs) {
            list.add(documentToTour(doc));
        }
        return list;
    }

    // Lấy tour theo ID
    public Tour getTourById(String id) {
        if (id == null || id.trim().isEmpty()) return null;
        try {
            Document doc = tours.find(Filters.eq("_id", new ObjectId(id))).first();
            return (doc != null) ? documentToTour(doc) : null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Thêm tour mới
    public boolean addTour(Tour tour) {
        try {
            Document doc = new Document("name", tour.getName())
                    .append("description", tour.getDescription())
                    .append("location", tour.getLocation())
                    .append("destination", tour.getDestination())
                    .append("departure", tour.getDeparture())
                    .append("duration", tour.getDuration())
                    .append("startDate", tour.getStartDate())
                    .append("endDate", tour.getEndDate())
                    .append("adultPrice", tour.getAdultPrice())
                    .append("childPrice", tour.getChildPrice())
                    .append("image", tour.getImage())
                    .append("detailsPage", tour.getDetailsPage());
            tours.insertOne(doc);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Cập nhật tour
    public boolean updateTour(Tour tour) {
        if (tour.getId() == null || tour.getId().trim().isEmpty()) return false;
        try {
            Document updated = new Document("$set", new Document("name", tour.getName())
                    .append("description", tour.getDescription())
                    .append("location", tour.getLocation())
                    .append("destination", tour.getDestination())
                    .append("departure", tour.getDeparture())
                    .append("duration", tour.getDuration())
                    .append("startDate", tour.getStartDate())
                    .append("endDate", tour.getEndDate())
                    .append("adultPrice", tour.getAdultPrice())
                    .append("childPrice", tour.getChildPrice())
                    .append("image", tour.getImage())
                    .append("detailsPage", tour.getDetailsPage()));

            tours.updateOne(Filters.eq("_id", new ObjectId(tour.getId())), updated);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Xóa tour
    public boolean deleteTour(String id) {
        if (id == null || id.trim().isEmpty()) return false;
        try {
            tours.deleteOne(Filters.eq("_id", new ObjectId(id)));
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Convert Document → Tour
    private Tour documentToTour(Document doc) {
        Tour t = new Tour();
        try {
            if (doc.containsKey("_id") && doc.get("_id") instanceof ObjectId)
                t.setId(doc.getObjectId("_id").toHexString());
            else
                t.setId(doc.getString("_id"));

            t.setName(doc.getString("name"));
            t.setDescription(doc.getString("description"));
            t.setLocation(doc.getString("location"));
            t.setDestination(doc.getString("destination"));
            t.setDeparture(doc.getString("departure"));
            t.setDuration(doc.getString("duration"));
            t.setStartDate(doc.getString("startDate"));
            t.setEndDate(doc.getString("endDate"));

            Object adultObj = doc.get("adultPrice");
            t.setAdultPrice(adultObj instanceof Number ? ((Number) adultObj).doubleValue() : 0);

            Object childObj = doc.get("childPrice");
            t.setChildPrice(childObj instanceof Number ? ((Number) childObj).doubleValue() : 0);

            t.setImage(doc.getString("image"));
            t.setDetailsPage(doc.getString("detailsPage"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    // Tìm kiếm tour (fuzzy, không phân biệt hoa thường, bỏ dấu, tất cả trường)
public List<Tour> searchTours(String departure, String destination, String date, String duration) {
    List<Tour> results = new ArrayList<>();
    List<Bson> filters = new ArrayList<>();

    // Helper: prepare safe regex (escape and trim)
    java.util.function.Function<String, String> safe = (s) -> {
        if (s == null) return null;
        String t = s.trim();
        if (t.isEmpty()) return null;
        // escape regex metachars
        return ".*" + Pattern.quote(t) + ".*";
    };

    String depPat = safe.apply(departure);
    String destPat = safe.apply(destination);
    String durPat = safe.apply(duration);
    String dateTrim = (date != null && !date.trim().isEmpty()) ? date.trim() : null;

    // departure + destination (2 chiều)
    if (depPat != null && destPat != null) {
        filters.add(Filters.or(
                Filters.and(
                        Filters.regex("departure", depPat, "i"),
                        Filters.regex("destination", destPat, "i")
                ),
                Filters.and(
                        Filters.regex("departure", destPat, "i"),
                        Filters.regex("destination", depPat, "i")
                )
        ));
    } else {
        if (depPat != null) filters.add(Filters.regex("departure", depPat, "i"));
        if (destPat != null) filters.add(Filters.regex("destination", destPat, "i"));
    }

    // date: IMPORTANT - make sure incoming date format matches stored format
    if (dateTrim != null) {
        // If your UI sends dd/MM/yyyy but DB stores yyyy-MM-dd, convert here:
        String dateToSearch = dateTrim;
        // simple convert if contains '/': dd/MM/yyyy -> yyyy-MM-dd
        if (dateTrim.contains("/")) {
            try {
                String[] parts = dateTrim.split("/");
                if (parts.length == 3) {
                    dateToSearch = parts[2] + "-" + String.format("%02d", Integer.parseInt(parts[1])) + "-" + String.format("%02d", Integer.parseInt(parts[0]));
                }
            } catch (Exception ex) {
                // keep original if parse fails
            }
        }
        String datePat = ".*" + Pattern.quote(dateToSearch) + ".*";
        filters.add(Filters.or(
                Filters.regex("startDate", datePat, "i"),
                Filters.regex("endDate", datePat, "i")
        ));
    }

    // duration
    if (durPat != null) {
        filters.add(Filters.regex("duration", durPat, "i"));
    }

    Bson query = filters.isEmpty() ? new Document() : Filters.and(filters);

    try {
        System.out.println("[searchTours] query filters count = " + filters.size());
        FindIterable<Document> docs = tours.find(query);
        for (Document doc : docs) results.add(documentToTour(doc));
    } catch (Exception e) {
        e.printStackTrace();
    }
    return results;
}

}

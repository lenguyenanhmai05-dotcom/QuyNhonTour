package com.quynhontours.dao;

import com.quynhontours.model.Tour;
import com.quynhontours.utils.MongoDBConnection;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

public class TourDAO {
    private final MongoCollection<Document> tours;

    public TourDAO() {
        MongoDatabase db = MongoDBConnection.getDatabase();
        this.tours = db.getCollection("tours");
    }

    // Get all
    public List<Tour> getAllTours() {
        List<Tour> list = new ArrayList<>();
        FindIterable<Document> docs = tours.find();
        for (Document doc : docs) {
            list.add(documentToTour(doc));
        }
        return list;
    }

    // Get by id
    public Tour getTourById(String id) {
        if (id == null || id.trim().isEmpty()) return null;
        try {
            Document doc = tours.find(Filters.eq("_id", new ObjectId(id))).first();
            return doc == null ? null : documentToTour(doc);
        } catch (IllegalArgumentException e) {
            // invalid ObjectId string
            System.out.println("Invalid ObjectId: " + id);
            return null;
        }
    }

    // Add
    public boolean addTour(Tour tour) {
        try {
            Document doc = new Document("name", tour.getName())
                    .append("description", tour.getDescription())
                    .append("location", tour.getLocation())
                    .append("price", tour.getPrice())
                    .append("startDate", tour.getStartDate())
                    .append("endDate", tour.getEndDate());
            tours.insertOne(doc);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update
    public boolean updateTour(Tour tour) {
        if (tour.getId() == null || tour.getId().trim().isEmpty()) return false;
        try {
            Document updated = new Document("$set", new Document("name", tour.getName())
                    .append("description", tour.getDescription())
                    .append("location", tour.getLocation())
                    .append("price", tour.getPrice())
                    .append("startDate", tour.getStartDate())
                    .append("endDate", tour.getEndDate()));
            tours.updateOne(Filters.eq("_id", new ObjectId(tour.getId())), updated);
            return true;
        } catch (IllegalArgumentException e) {
            System.out.println("Invalid ObjectId when updating: " + tour.getId());
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete
    public boolean deleteTour(String id) {
        if (id == null || id.trim().isEmpty()) return false;
        try {
            tours.deleteOne(Filters.eq("_id", new ObjectId(id)));
            return true;
        } catch (IllegalArgumentException e) {
            System.out.println("Invalid ObjectId when deleting: " + id);
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Helper: Document -> Tour
    private Tour documentToTour(Document doc) {
        Tour t = new Tour();
        if (doc.containsKey("_id") && doc.get("_id") instanceof ObjectId) {
            t.setId(doc.getObjectId("_id").toHexString());
        } else {
            t.setId(doc.get("_id") != null ? doc.get("_id").toString() : null);
        }
        t.setName(doc.getString("name"));
        t.setDescription(doc.getString("description"));
        t.setLocation(doc.getString("location"));

        Object priceObj = doc.get("price");
        double price = 0;
        if (priceObj instanceof Number) {
            price = ((Number) priceObj).doubleValue();
        } else if (priceObj instanceof String) {
            try { price = Double.parseDouble((String) priceObj); } catch (NumberFormatException ignored) { price = 0; }
        }
        t.setPrice(price);

        t.setStartDate(doc.getString("startDate"));
        t.setEndDate(doc.getString("endDate"));
        return t;
    }
}

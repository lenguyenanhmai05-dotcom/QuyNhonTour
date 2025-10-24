package com.quynhontours.utils;

import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

public class TestMongoDBConnection {
    public static void main(String[] args) {
        try {
            // Get the database from your existing MongoDBConnection helper
            MongoDatabase database = MongoDBConnection.getDatabase();

            System.out.println("MongoDB connection successful.");
            System.out.println("Database name: " + database.getName());

            // Check "users" collection
            MongoCollection<Document> collection = database.getCollection("users");
            System.out.println("Collection 'users' is available.");

            // Insert a test document
            Document testDoc = new Document("testField", "Hello MongoDB!");
            collection.insertOne(testDoc);
            System.out.println("Inserted test document.");

            // Remove the test document to keep the DB clean
            collection.deleteOne(new Document("testField", "Hello MongoDB!"));
            System.out.println("Removed test document.");

            System.out.println("Test completed successfully.");
        } catch (Exception e) {
            System.err.println("MongoDB connection error: " + e.toString());
            e.printStackTrace();
        }
    }
}

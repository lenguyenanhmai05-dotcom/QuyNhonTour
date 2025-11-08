package com.quynhontours.dao;

import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.quynhontours.model.News;
import org.bson.Document;
import org.bson.types.ObjectId;
import java.util.*;

public class NewsDAO {
    private MongoCollection<Document> collection;

    public NewsDAO() {
        MongoClient client = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase db = client.getDatabase("quynhontoursdb");
        collection = db.getCollection("news");
    }

    public List<News> getAllNews() {
        List<News> list = new ArrayList<>();
        for (Document doc : collection.find()) {
            list.add(documentToNews(doc));
        }
        return list;
    }

    public void insertNews(News news) {
        Document doc = new Document("title", news.getTitle())
                .append("content", news.getContent())
                .append("imageUrl", news.getImageUrl())
                .append("createdAt", news.getCreatedAt());
        collection.insertOne(doc);
    }

    public void updateNews(News news) {
        Document update = new Document("$set", new Document("title", news.getTitle())
                .append("content", news.getContent())
                .append("imageUrl", news.getImageUrl()));
        collection.updateOne(Filters.eq("_id", news.getId()), update);
    }

    public void deleteNews(String id) {
        collection.deleteOne(Filters.eq("_id", new ObjectId(id)));
    }

    public News getNewsById(String id) {
        Document doc = collection.find(Filters.eq("_id", new ObjectId(id))).first();
        return doc != null ? documentToNews(doc) : null;
    }

    private News documentToNews(Document doc) {
        return new News(
                doc.getObjectId("_id"),
                doc.getString("title"),
                doc.getString("content"),
                doc.getString("imageUrl"),
                doc.getString("createdAt")
        );
    }
}

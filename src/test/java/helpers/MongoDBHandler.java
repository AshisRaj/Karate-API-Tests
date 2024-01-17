package helpers;

import java.util.Map;

import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import net.minidev.json.JSONArray;
 
public class MongoDBHandler {

    public static JSONArray insertDocuments(Map<String, Object> jsonDoc, String document) {
        MongoClient mongoClient = MongoClients.create("mongodb://" + jsonDoc.get("host") + ":" + jsonDoc.get("port"));
        MongoDatabase mongoDatabase = mongoClient.getDatabase(jsonDoc.get("database").toString());
        MongoCollection<Document> collection = mongoDatabase.getCollection(jsonDoc.get("collection").toString()); 

        //Create document for query 
        Document query = Document.parse(document);
				
		//Insert document into collection 
		collection.insertOne(query); 

        JSONArray jsonArray = getDocuments(jsonDoc, document);
        return jsonArray;
    }

    public static JSONArray getDocuments(Map<String, Object> jsonDoc, String query) {
        FindIterable<Document> result = getDocumentsAsIterable(jsonDoc, query);
        JSONArray jsonArray = getJsonFromIterableDocument(result);
        return jsonArray;
    }

    public static FindIterable<Document> getDocumentsAsIterable(Map<String, Object> jsonDoc, String query) {
        MongoClient mongoClient = MongoClients.create("mongodb://" + jsonDoc.get("host") + ":" + jsonDoc.get("port"));
        MongoDatabase mongoDatabase = mongoClient.getDatabase(jsonDoc.get("database").toString());
        MongoCollection<Document> collection = mongoDatabase.getCollection(jsonDoc.get("collection").toString()); 
        FindIterable<Document> result = collection.find(Document.parse(query));
        return result;
    }
    
    public static JSONArray getJsonFromIterableDocument(FindIterable<Document> result) {
        JSONArray jsonArray = new JSONArray();

        for (Document document : result)
            jsonArray.add(document);
        return jsonArray;
    }
}
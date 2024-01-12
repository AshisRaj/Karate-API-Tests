package helpers;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnectionPool {

    // Define a singleton instance of MongoClient
    private static MongoClient mongoClient;

    // Define a singleton instance of MongoDatabase
    private static MongoDatabase database;

    // Define the maximum number of available connections
    private static final int MAX_CONNECTIONS = 10;

    // Define a variable to keep track of the number of available connections
    private static int currentConnections = 0;

    // Define a method to initialize the MongoClient and database
    public static void initialize() {

        // Check if the MongoClient instance is already initialized
        if (mongoClient == null) {

            // Create a new MongoClient with the given URI
            mongoClient = MongoClients.create("mongodb://localhost:27017");
            
            // Get the database from the client instance
            database = mongoClient.getDatabase("my_database");
        }
    }

    // Define a method to get a connection from the pool
    public synchronized static MongoDatabase getConnection() {

        // Check if the maximum number of connections has been reached
        if (currentConnections < MAX_CONNECTIONS) {

            // Increment the number of current connections
            currentConnections++;

            // Return the database
            return database;

        } else {

            // If the maximum number of connections is reached, wait until a connection is available
            while (currentConnections >= MAX_CONNECTIONS) {

                try {

                    // Sleep for 1 second
                    Thread.sleep(1000);

                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            // Once a connection is available, increment the number of current connections
            currentConnections++;

            // Return the database
            return database;
        }
    }

    // Define a method to release a connection back to the pool
    public synchronized static void releaseConnection() {

        // Decrement the number of current connections
        currentConnections--;
    }

    // Define a method to close the MongoClient instance
    public static void close() {
        mongoClient.close();
    }
}

// In your test class, initialize the MongoDBConnectionPool before using it
// MongoDBConnectionPool.initialize();

// Get a database connection from the pool
// MongoDatabase database = MongoDBConnectionPool.getConnection();

// Use the database connection for your test operations
// ...

// Release the connection back to the pool
// MongoDBConnectionPool.releaseConnection();

// Close the MongoClient instance after all tests have been run
// MongoDBConnectionPool.close();

package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.bson.Document;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

public class MySQLDbHandler {

    public static int addNewJobWithName(String connectionString, String jobName) {
        int jobAdded = 0;
        Document jsonDoc = Document.parse(connectionString);
        try(Connection connect = DriverManager.getConnection("jdbc:mysql://" + jsonDoc.get("host") + ":" + jsonDoc.get("port") + "/" + jsonDoc.get("database"), jsonDoc.get("user").toString(), jsonDoc.get("password").toString())) {
            jobAdded = connect.createStatement()
                .executeUpdate("INSERT INTO jobs(job_desc, min_level, max_level) VALUES ('"+jobName+"', '80', '120')");
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return jobAdded;
    }

    public static JSONArray getMinAndMaxLevelsForJob(String connectionString, String jobName) {
        Document jsonDoc = Document.parse(connectionString);
        JSONArray jsonArray = null;

        try(Connection connect = DriverManager.getConnection("jdbc:mysql://" + jsonDoc.get("host") + ":" + jsonDoc.get("port") + "/" + jsonDoc.get("database"), jsonDoc.get("user").toString(), jsonDoc.get("password").toString())) {
            ResultSet resultSet = connect.createStatement()
                .executeQuery("SELECT * FROM jobs where job_desc = '"+jobName+"'");
            jsonArray = getJsonFromIterableResultSet(resultSet);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return jsonArray;
    }

    public static JSONArray getJsonFromIterableResultSet(ResultSet resultSet) throws SQLException {
        JSONArray jsonArray = new JSONArray();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();
        
        while (resultSet.next()) {
            JSONObject jsonObject = new JSONObject();
            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnName(i);
                Object value = resultSet.getObject(i);
                jsonObject.put(columnName, value);
            }
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}

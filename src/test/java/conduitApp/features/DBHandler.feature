@ignore
Feature: DB

Background: Before Hook
    * def mysqlDbHandler = Java.type('helpers.MySQLDbHandler')
    * def mongoDbHandler = Java.type('helpers.MongoDBHandler')
    * def ObjectMapper = Java.type('com.fasterxml.jackson.databind.ObjectMapper')

Scenario: MySQL: Insert Table
    * def mapper = new ObjectMapper();    
    * def connectionString = mapper.writeValueAsString(envConfig.mysqlDBConfig);
    * def jobAdded = mysqlDbHandler.addNewJobWithName(connectionString, 'UI Designer')
    * match jobAdded == 1

Scenario: MySQL: Select Table
    * def mapper = new ObjectMapper();    
    * def connectionString = mapper.writeValueAsString(envConfig.mysqlDBConfig);
    * def job = mysqlDbHandler.getMinAndMaxLevelsForJob(connectionString, 'UI Designer')
    * match job == "#array"

Scenario: MongoDb: insert Document
    * def mapper = new ObjectMapper();
    * def connectionString = mapper.writeValueAsString(envConfig.mongoDBConfig);
    * def job = mongoDbHandler.insertDocuments(connectionString, "{'job': 'Test Automation Architect', 'min_level': 70, 'max_level': 90}")
    * match job == "#array"

Scenario: MongoDb: Get Document
    * def mapper = new ObjectMapper();
    * def connectionString = mapper.writeValueAsString(envConfig.mongoDBConfig);
    * def job = mongoDbHandler.getDocuments(connectionString, "{'job': 'Test Automation Architect'}")
    * match job == "#array"

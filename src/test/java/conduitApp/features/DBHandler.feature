@ignore
Feature: DB

Background: Before Hook
    * def mysqlDbHandler = Java.type('helpers.MySQLDbHandler')
    * def mongoDbHandler = Java.type('helpers.MongoDBHandler')
    * def config = { username: 'root', password: 'root123', url: "jdbc:mysql://localhost:3306/test", driverClassName: "com.mysql.cj.jdbc.Driver" }
    * def DbUtils = Java.type('helpers.DbUtils')
    * def db = new DbUtils(config)

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

Scenario: DbUtils: Read Rows
# since the DbUtils returns a Java List (of Map-s), it becomes normal JSON here!
# which means that you can use the full power of Karate's 'match' syntax
* def jobs = db.readRows('SELECT * FROM JOBS')
* match each jobs == { id: '#number', job_desc: '#string', min_level: "#string", max_level: "#string", "create_time": "#null" }
* id=8
* def job = db.readRow('SELECT * FROM JOBS J WHERE J.ID=' + id)
* match job.job_desc == 'UI Designer'

* def test = db.readValue('SELECT ID FROM JOBS J WHERE J.ID=' + id)
* match test == 8

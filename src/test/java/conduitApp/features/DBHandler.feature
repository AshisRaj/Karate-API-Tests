# @ignore
Feature: DB

Background: Before Hook
    * def mysqlDbHandler = Java.type('helpers.MySQLDbHandler')
    * def mongoDbHandler = Java.type('helpers.MongoDBHandler')
    * def config = karate.merge(envConfig.mysqlDBConfig, { url: "jdbc:mysql://localhost:3306/test", driverClassName: "com.mysql.cj.jdbc.Driver" }) 
    * def DbUtils = Java.type('helpers.DbUtils')
    * def db = new DbUtils(config)

Scenario: MySQL: Insert Table
    * def jobAdded = mysqlDbHandler.addNewJobWithName(envConfig.mysqlDBConfig, 'UI Designer')
    * match jobAdded == 1

Scenario: MySQL: Select Table
    * def job = mysqlDbHandler.getMinAndMaxLevelsForJob(envConfig.mysqlDBConfig, 'UI Designer')
    * match job == "#array"
Scenario: MongoDb: insert Document    
    * def job = mongoDbHandler.insertDocuments(envConfig.mongoDBConfig, "{'job': 'Test Automation Architect', 'min_level': 70, 'max_level': 90}")
    * match job == "#array"

Scenario: MongoDb: Get Document
    * def job = mongoDbHandler.getDocuments(envConfig.mongoDBConfig, "{'job': 'Test Automation Architect'}")
    * match job == "#array"

@try
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

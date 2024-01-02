function fn() {
    var env = karate.env; // get system property 'karate.env'
      
    var config = {
        env: env
    }

    config.baseUrl = 'https://api.realworld.io'

    config.userCreds =  { "username": "karate2@araj", "email": "karate2@araj.com", "password": "karate456" }
    var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken

    karate.configure('headers', {Authorization: 'Token ' + accessToken})
    
    config.mysqlDBConfig = {
       'host': 'localhost', 'port': '3306',
       'database': 'test', 'user': 'root',
       'password': 'root123'
    }
    config.mongoDBConfig = {
       'host': 'localhost', 'port': '27017',
       'database': 'admin', 'collection': 'job',
       'user': 'root', 'password': 'root123'
    }
    
    var testDataGenerator = Java.type('helpers.DataGenerator')
    config.testDataGenerator =  testDataGenerator

    karate.configure('logPrettyResponse', true)
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000)

    return config;
}
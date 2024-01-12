function fn() {

    karate.configure('logPrettyResponse', true)
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000)

    var env = karate.env || 'qa'; // get system property 'karate.env', else default to 'qa'
    karate.log('karate.env system property was: ', env);

    var envConfig = read(`classpath:config/karate-config-${env}.json`);
    var envData = read(`classpath:config/${env}.data.json`);
    
    var config = {
        env: env,
        envConfig: envConfig,
        envData: envData
    }

    var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
    karate.configure('headers', {Authorization: 'Token ' + accessToken})
    
    var testDataGenerator = Java.type('helpers.DataGenerator')
    config.testDataGenerator =  testDataGenerator
 
    return config;
}
Feature: Auth Token

Scenario: Define URL
  Given url envConfig.baseUrl
  Given path 'api/users/login'
  And request {"user": { "email": "#(envData.superUser.email)", "password": "#(envData.superUser.password)" }}
  When method post
  Then status 200
  And match response.user contains {'token': '#string'}
  * def authToken = response.user.token
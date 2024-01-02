Feature: Auth Token

Scenario: Define URL
  Given url baseUrl
  Given path 'api/users/login'
  And request {"user": { "email": "#(userCreds.email)", "password": "#(userCreds.password)" }}
  When method post
  Then status 200
  And match response.user contains {'token': '#string'}
  * def authToken = response.user.token
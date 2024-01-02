@smoke
Feature: Sign In

Background: Before Hook
  Given url baseUrl

Scenario: Login
  Given path 'api/users/login'
  And request {"user": { "email": "karate@araj.com", "password": "karate123" }}
  When method post
  Then status 200
  And match response.user contains {'token': '#string'}
  * def token = response.user.token

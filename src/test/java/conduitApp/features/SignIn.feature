@smoke
Feature: Sign In

Background: Before Hook
  Given url envConfig.baseUrl

Scenario: Login
  Given path 'api/users/login'
  And request {"user": { "email": "karate102@araj.com", "password": "karate102" }}
  When method post
  Then status 200
  And match response.user contains {'token': '#string'}
  * def token = response.user.token

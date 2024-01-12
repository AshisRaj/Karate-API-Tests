
Feature: Sign Up

Background: Before Hook
    * def randomEmail = testDataGenerator.getRandomEmail()
    * def randomUsername = testDataGenerator.getRandomUsername()
    Given url envConfig.baseUrl

@smoke
Scenario: Register
    Given path 'api/users'
    And request 
    """
        {
            "user":{
                "email":"#(randomEmail)",
                "password":"karate789",
                "username":"#(randomUsername)"
            }
        }
    """
    When method post
    Then status 201
    And match response ==
    """
        {
            "user":{
                "id": "#number",
                "email":"#string",
                "username":"#string",
                "bio": null,
                "image":"#string",
                "token":"#string"
            }
        }
    """
@parallel=false
@regression
Scenario Outline: Validate Register error messages
    Given path 'api/users'
    And request 
    """
        {
            "user":{
                "email": "<email>",
                "password": "<password>",
                "username": "<username>"
            }
        }
    """
    When method post
    Then status 422
    And match response == <errorMessage>  
    Examples:
    | email              | password  | username            | errorMessage |
    | #(randomEmail)     | karate789 | karate102@araj      | {"errors": {"username": ["has already been taken"]}}
    | karate102@araj.com | karate789 | #(randomUsername)   | {"errors": {"email": ["has already been taken"]}}
    |                    | karate789 | #(randomUsername)   | {"errors": {"email": ["can't be blank"]}}    
    | #(randomEmail)     |           | #(randomUsername)   | {"errors": {"password": ["can't be blank"]}}
    | #(randomEmail)     | karate789 |                     | {"errors": {"username": ["can't be blank"]}}

Feature: Profile

Background: Before Hook
    Given url baseUrl
    
Scenario: Get Profile
    Given path 'api/profiles', userCreds.username
    When method get
    Then status 200
    And match response == 
        """            
        {
            "profile": {
                "username": "#(userCreds.username)",
                "bio": null,
                "image": "https://api.realworld.io/images/smiley-cyrus.jpeg",
                "following": false
            }
        }
        """
Scenario Outline: Edit Profile
    Given path 'api/user'
    And request {"user":{"image":"<image>","username":"<username>","bio":"<bio>","email":"<email>","password":"<password>"}}
    When method put
    Then status <status>
    And match response == <message>
    Examples:
    | read('classpath:data/profile.json') |


Scenario Outline: Edit Profile - 500 Error
    Given path 'api/user'
    And request {"user":{"image":"<image>","username":"<username>","bio":"<bio>","email":"<email>","password":"<password>"}}
    When method put
    Then status <status>
    And match response contains "<message>"
    Examples:
    | read('classpath:data/profile.csv') |


Feature: Homepage

Background: Before Hook
    Given url envConfig.baseUrl

Scenario: Get all Popular Tags
    Given path 'api/tags'
    When method get
    Then status 200
    # And match response.tags contains ['enim', 'eos']
    And match response.tags == '#array'
    And match each response.tags == '#string'

@skipme
Scenario:  Get 10 Articles
    * def timeValidator = read('classpath:helpers/TimeValidator.js')

    Given path 'api/articles' 
    And params { limit: 10, offset: 0 }
    When method get
    Then status 200
    And match response == {"articles": "#[10]", articlesCount: "#number"}
    And match each response.articles ==
    """
        {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": "#boolean",
            "favoritesCount": "#number",
            "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": "#boolean"
            }
        }
    """

Scenario: Conditional logic
    Given path 'api/articles' 
    And params { limit: 10, offset: 0 }
    When method get
    Then status 200
    And match response == {"articles": "#[10]", articlesCount: "#number"}
    # Get the favorites count and slug ID for the first arice, save it to variables
    * def favoritesCount = response.articles[0].favoritesCount
    * def article = response.articles[0]

    * def result = favoritesCount == 0 ? karate.call('classpath:helpers/AddLikes.feature', article).likesCount : favoritesCount

    Given path 'api/articles' 
    And params { limit: 10, offset: 0 }
    When method get
    Then status 200
    And match response.articles[0].favoritesCount == result

# Scenario: Retry Call
#     * configure retry = {count: 10, interval: 5000}
#     Given path 'api/articles' 
#     And params { limit: 10, offset: 0 }
#     And retry until response.articles[0].favoritesCount == 1
#     When method get
#     Then status 200

# Scenario: Sleep Call
#     * def sleep = function(pause) { java.lang.Thread.sleep(pause) }
#     Given path 'api/articles' 
#     And params { limit: 10, offset: 0 }
#     And retry until response.articles[0].favoritesCount == 1
#     When method get
#     * eval sleep(5000)
#     Then status 200

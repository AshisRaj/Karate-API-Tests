Feature: Likes

Background: Before Hook
    Given url envConfig.baseUrl

Scenario: Add Likes
    Given path 'api/articles', slug, 'favorite'
    And request {}
    When method post
    Then status 200
    * def likesCount = response.article.favoritesCount
    
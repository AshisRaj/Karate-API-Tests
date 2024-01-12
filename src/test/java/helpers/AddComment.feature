Feature: Comment

Background: Before Hook
    Given url envConfig.baseUrl

Scenario: Add Comment
    * def commentRequestBody = read('classpath:data/comment.json')
    * set commentRequestBody.comment.body = testDataGenerator.getRandomComment().body
    Given path 'api/articles', slug, 'comments'
    And request commentRequestBody
    When method post
    Then status 200
    
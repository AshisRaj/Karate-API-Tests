

Feature: Comment

Background: Before Hook
    * def timeValidator = read('classpath:helpers/TimeValidator.js')
    * def commentRequestBody = read('classpath:data/comment.json')
    * set commentRequestBody.comment.body = testDataGenerator.getRandomComment().body
    Given url baseUrl

Scenario: Comment Articles
    # Step 1: Get articles of the global feed
    Given path 'api/articles' 
    And params { limit: 10, offset: 0 }
    When method get
    Then status 200
    And match response == {"articles": "#array", articlesCount: "#number"}
    # Step 2: Get the favorites count and slug ID for the first article, save it to variables
    * def favoritesCount = response.articles[0].favoritesCount
    * def firstArticle = response.articles[0]
    # Step 3: Make a GET call to 'comments' end-point to get all comments
    Given path 'api/articles', firstArticle.slug, 'comments'
    When method get
    Then status 200
    * def comments = response.comments
    * if(comments == null || comments.length == 0) karate.call('classpath:helpers/AddComment.feature', firstArticle)
    Given path 'api/articles', firstArticle.slug, 'comments'
    When method get
    Then status 200
    # Step 4: Verify response schema
    And match each response.comments ==
    """
    {
        "id": "#number",
        "createdAt": "#? timeValidator(_)",
        "updatedAt": "#? timeValidator(_)",
        "body": "#string",
        "author": {
            "username": "#string",
            "bio": null,
            "image": "#string",
            "following": "#boolean"
        }
    }
    """    
    # Step 5: Get the count of the comments array lentgh and save to variable
    * def prevCommentsCount = response.comments.length
    # Step 6: Make a POST request to publish a new comment
    Given path 'api/articles', firstArticle.slug, 'comments'
    * def commentRequestBody = read('classpath:data/comment.json')
    * set commentRequestBody.comment.body = testDataGenerator.getRandomComment().body
    And request commentRequestBody
    When method post
    Then status 200
    # Step 7: Verify response schema that should contain posted comment text
    And match response ==
    """
        {
            "comment": {
                "id": "#number",
                "createdAt": "#? timeValidator(_)",
                "updatedAt": "#? timeValidator(_)",
                "body": "#(commentRequestBody.comment.body)",
                "author": {
                    "username": "#string",
                    "bio": null,
                    "image": "#string",
                    "following": "#boolean"
                }
            }
        }
    """ 
    * def commentId = response.comment.id
    # Step 8: Get the list of all comments for this article one more time
    Given path 'api/articles', firstArticle.slug, 'comments'
    And params { limit: 10, offset: 0 }
    When method get
    Then status 200
    # Step 9: Get the count of the comments array lentgh and save to variable
    * def currentCommentsCount = response.comments.length
    # Step 10: Verify number of comments increased by 1 (similar like we did with favorite counts)
    And match currentCommentsCount == prevCommentsCount + 1
    # Step 11: Make a DELETE request to delete comment
    Given path 'api/articles', firstArticle.slug, 'comments', commentId
    When method delete
    Then status 200
    # Step 12: Get all comments again and verify number of comments decreased by 1
    Given path 'api/articles', firstArticle.slug, 'comments'
    When method get
    Then status 200
    # Step 13: Get the count of the comments array lentgh and save to variable
    * def currentCommentsCount = response.comments.length
    And match currentCommentsCount == prevCommentsCount

Scenario: Can't Post Comment to Articles
    # Step 1: Get articles of the global feed
    Given path 'api/articles' 
    And params { limit: 10, offset: 0 }
    When method get
    Then status 200
    And match response == {"articles": "#[10]", articlesCount: "#number"}
    # Step 2: Get the favorites count and slug ID for the first article, save it to variables
    * def favoritesCount = response.articles[0].favoritesCount
    * def slug = response.articles[0].slug
    # Step 3: Make a POST request to publish a new comment
    Given path 'api/articles', slug, 'comment'
    * def commentRequestBody = read('classpath:data/comment.json')
    * set commentRequestBody.comment.body = testDataGenerator.getRandomComment().body
    And request commentRequestBody
    When method post
    Then status 404
    And match response contains 'Error'
    And match response contains 'Cannot POST'

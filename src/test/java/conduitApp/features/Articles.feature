
@parallel=false
Feature: Articles

Background: Before Hook
    Given url envConfig.baseUrl
    * def articleRequestBody = read('classpath:data/article.json')
    * def randomArticle = testDataGenerator.getRandomArticleValues()
    * set articleRequestBody.article.title = randomArticle.title
    * set articleRequestBody.article.description = randomArticle.description
    * set articleRequestBody.article.body = randomArticle.body

@debug
Scenario: Create Article
    Given path 'api/articles'
    And request articleRequestBody
    When method post
    Then status 201
    And match response.article.title == articleRequestBody.article.title

Scenario: Create and Delete Article
    Given path 'api/articles'
    And request articleRequestBody
    When method post
    Then status 201
    And match response.article.title == articleRequestBody.article.title
    * def articleId = response.article.slug

    Given path 'api/articles', articleId
    When method delete
    Then status 204

    Given path 'api/articles', articleId
    When method get
    Then status 404
    And match response == {"errors": {"article": ["not found"]}}

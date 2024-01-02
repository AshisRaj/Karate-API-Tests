
Feature: Articles

Background: Before Hook
    Given url baseUrl
    * def articleRequestBody = read('classpath:data/article.json')
    * set articleRequestBody.article.title = testDataGenerator.getRandomArticleValues().title
    * set articleRequestBody.article.description = testDataGenerator.getRandomArticleValues().description
    * set articleRequestBody.article.body = testDataGenerator.getRandomArticleValues().body

Scenario: Create and Delete Article
    Given path 'api/articles'
    And request articleRequestBody
    When method post
    Then status 201
    * def articleId = response.article.slug

    * karate.pause(5000)
    
    Given path 'api/articles', articleId
    When method delete
    Then status 204

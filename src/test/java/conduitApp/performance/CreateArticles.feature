
Feature: Articles

Background: Before Hook
    Given url envConfig.baseUrl
    * def articleRequestBody = read('classpath:data/article.json')
    * def randomArticle = testDataGenerator.getRandomArticleValues()
    * set articleRequestBody.article.title = randomArticle.title
    * set articleRequestBody.article.description = randomArticle.description
    * set articleRequestBody.article.body = randomArticle.body

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

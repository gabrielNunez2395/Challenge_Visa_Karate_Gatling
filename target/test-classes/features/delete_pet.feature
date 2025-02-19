Feature: Remove a pet

  Background:
    * url 'http://localhost:8080/api/v3'

  Scenario: Remove an existing pet
    Given path 'pet', 1
    When method delete
    Then status 200
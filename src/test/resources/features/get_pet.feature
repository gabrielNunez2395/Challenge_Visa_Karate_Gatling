Feature: Obtain a pet by ID

  Background:
    * url 'http://localhost:8080/api/v3'
    * configure retry = { count: 3, interval: 3000 }
    * configure logPrettyResponse = true
    * def expectedSchema =
    """
    {
      id: '#number',
      name: '#string',
      status: '#string',
      category: '##object',
      tags: '#array'
    }
    """

  @performance
  Scenario: Consult an existing pet
    Given path 'pet', 2
    When method get
    Then status 200
    And match response.id == 2
    And assert responseTime < 2000

  @performance
  Scenario Outline: Consult multiple pets
    Given path 'pet', <petId>
    When method get
    Then status 200
    And match response.id == <petId>

    Examples:
      | petId |
      | 2     |
      | 3     |
      | 4     |

  @negative @performance
  Scenario: Consult a non-existing pet
    Given path 'pet', 999999
    When method get
    Then status 404
Feature: Update a pet's data

  Background:
    * url 'http://localhost:8080/api/v3'

  Scenario: Update the mascot with new data
    Given path 'pet'
    And request
    """
    {
      "id": 4,
      "name": "Firulais Damian",
      "status": "sold"
    }
    """
    When method put
    Then status 200
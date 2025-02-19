Feature: Create a mascot in the store

  Background:
    * url 'http://localhost:8080/api/v3'

  Scenario: Create a mascot with valid data
    Given path 'pet'
    And request
    """
    {
      "id": 4,
      "name": "Copo",
      "status": "available"
    }
    """
    When method post
    Then status 200
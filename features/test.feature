Feature: Test Endpoint

  Scenario: List tweets in JSON
    When I send and accept JSON
    And I send a GET request to "/"
    Then the response status should be "200"
    And the JSON response should be:
      """
      {"test":"test"}
      """

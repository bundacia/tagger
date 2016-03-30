Feature: Tagging

  Background:
    Given I send and accept JSON

  Scenario: Creating an Entry
    When I send a POST request to "/entities" with the following:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["A", "B", "C"] }
      """
    Then the response status should be "201"
    And the JSON response should be:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["A", "B", "C"] }
      """

  Scenario: Attempt to Create an Entry incomplete data
    When I send a POST request to "/entities" with the following:
      """
      { "entity_id": "123", "tags": ["A", "B", "C"] }
      """
    Then the response status should be "400"
    And the JSON response should be:
      """
      { "error": "entity_type is required" }
      """

  Scenario: Retrieve an Entry
    Given I send a POST request to "/entities" with the following:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["A", "B", "C"] }
      """
    When I send a GET request to "/entities/article/123"
    Then the response status should be "200"
    And the JSON response should be:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["A", "B", "C"] }
      """

  Scenario: Overwrite an Entry
    Given I send a POST request to "/entities" with the following:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["A", "B", "C"] }
      """
    Then I send a POST request to "/entities" with the following:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["new", "tags"] }
      """
    When I send a GET request to "/entities/article/123"
    Then the response status should be "200"
    And the JSON response should be:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["new", "tags"] }
      """

  Scenario: Delete an Entry
    Given I send a POST request to "/entities" with the following:
      """
      { "entity_type": "article", "entity_id": "123", "tags": ["A", "B", "C"] }
      """
    When I send a DELETE request to "/entities/article/123"
    Then the response status should be "204"
    When I send a GET request to "/entities/article/123"
    Then the response status should be "404"

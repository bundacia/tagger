Feature: Tagging

  Background:
    Given I send and accept JSON

  Scenario: Creating an Entry
    When I send a POST request to "/tags" with the following:
      """
      {
        "entity_type": "article",
        "entity_id": "1234",
        "tags": ["large", "pink", "blue"]
      }
      """
    Then the response status should be "201"

  Scenario: Retrieve an Entry
    Given I send a POST request to "/tags" with the following:
      """
      {
        "entity_type": "article",
        "entity_id": "1234",
        "tags": ["large", "pink", "blue"]
      }
      """
    When I send a GET request to "/tags/article/1234"
    Then the response status should be "200"
    And the JSON response should be:
      """
      {
        "entity_type": "article",
        "entity_id": "1234",
        "tags": ["large", "pink", "blue"]
      }
      """

  Scenario: Overwrite an Entry
    Given I send a POST request to "/tags" with the following:
      """
      {
        "entity_type": "article",
        "entity_id": "1234",
        "tags": ["large", "pink", "blue"]
      }
      """
    Then I send a POST request to "/tags" with the following:
      """
      {
        "entity_type": "article",
        "entity_id": "1234",
        "tags": ["new", "tags"]
      }
      """
    When I send a GET request to "/tags/article/1234"
    Then the response status should be "200"
    And the JSON response should be:
      """
      {
        "entity_type": "article",
        "entity_id": "1234",
        "tags": ["new", "tags"]
      }
      """

  Scenario: Delete an Entry
    Given I send a POST request to "/tags" with the following:
      """
      {
        "entity_type": "article",
        "entity_id": "1234",
        "tags": ["large", "pink", "blue"]
      }
      """
    When I send a DELETE request to "/tags/article/1234"
    Then the response status should be "204"

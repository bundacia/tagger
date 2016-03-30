Feature: Stats

  Background:
    Given I send and accept JSON

  Scenario: Getting Summary Stats
    Given I send a POST request to "/tags" with the following:
      """
      { "entity_type": "foo", "entity_id": "1", "tags": ["A", "B", "C"] }
      """
    And I send a POST request to "/tags" with the following:
      """
      { "entity_type": "foo", "entity_id": "2", "tags": ["A", "B"] }
      """
    And I send a POST request to "/tags" with the following:
      """
      { "entity_type": "foo", "entity_id": "3", "tags": ["A"] }
      """
    When I send a GET request to "/stats"
    Then the response status should be "200"
    And the JSON response should be:
      """
      {
        "tag_counts": [
          {tag: "A", count: 3},
          {tag: "B", count: 2},
          {tag: "C", count: 1}
        ]
      }
      """

  Scenario: Getting Stats About A Specific Entity
    Given I send a POST request to "/tags" with the following:
      """
      { "entity_type": "foo", "entity_id": "1", "tags": ["A", "B", "C"] }
      """
    When I send a GET request to "/stats/article/1234"
    Then the response status should be "200"
    And the JSON response should be:
      """
      { "tag_count": 3 }
      """

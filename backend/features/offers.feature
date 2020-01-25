Feature: in this feature file, offers sceniaros is covered 

  Scenario: Get all offers without pagination.
    When user request to get all offers
    Then successful json response returned to the user

  Scenario: Get all offers with pagination.
    When user request to get paginated offers in page "2"
    Then successful json response returned to the user
    And response returned to the user with page "2"
    And response returned to the user with "25" records

  Scenario: Get filter offers with departement.
    When user request to get filtered offers in departement "Mikel Mayer"
    Then successful json response returned to the user
    And response returned to the user with page "1"
    And response returned to the user with "1" records

  Scenario: Get filter offers with promotion_active.
    When user request to get filtered offers in promotion_active "true"
    Then successful json response returned to the user
    And response returned to the user with page "1"
    And response returned to the user with "25" records

  Scenario: Get filter offers with promotion_active.
    When user request to get filtered offers in promotion_active "notaboolean"
    Then failure json response returned to the user
    And response returned to the user with error "Promotion status should be boolean"
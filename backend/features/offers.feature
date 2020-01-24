Feature: in this feature file, offers sceniaros is covered 

  Scenario: Get all offers without pagination.
    When user request to get all offers
    Then successful json response returned to the user
Feature: in this feature file, create trip sceniaros is covered 


  Scenario: Create trip with empty axis.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    When user request to create new trip with "" axis_id and planned_starttime "1579445627"
    Then failure json response returned to the user
    And response returned to the user with error "axis_id should be provided"

  Scenario: Create trip with invalid axis.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    When user request to create new trip with "058315b0-3046-4e5d-8913-069bd9612fa9" axis_id and planned_starttime "1579445627"
    Then failure json response returned to the user
    And response returned to the user with error "Axis must exist"

  Scenario: Create trip with empty planned_starttime.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    When user request to create new trip with "058315b0-3046-4e5d-8913-069bd9612fa9" axis_id and planned_starttime ""
    Then failure json response returned to the user
    And response returned to the user with error "Trip should have planned_starttime"

  Scenario: Create trip with valid axis
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    And route with id "d41ef494-768d-412f-8984-a688006a73da" is created
    And axis with id "058315b0-3046-4e5d-8913-069bd9612fa9" is created
    When user request to create new trip with "058315b0-3046-4e5d-8913-069bd9612fa9" axis_id and planned_starttime "1579445627"
    Then successful json response returned to the user
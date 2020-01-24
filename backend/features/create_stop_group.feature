Feature: in this feature file, create stop group sceniaros is covered 


  Scenario: Create stop group with empty ar_name.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    When user request to create new stop group with english name "Tahrir" and arabic name ""
    Then failure json response returned to the user
    And response returned to the user with error "ar_name should be provided"

  Scenario: Create stop group with empty ar_name.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    When user request to create new stop group with english name "" and arabic name "تحرير"
    Then failure json response returned to the user
    And response returned to the user with error "en_name should be provided"

  Scenario: Create stop group with empty data.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    When user request to create new stop group with english name "" and arabic name ""
    Then failure json response returned to the user
    And response returned to the user with error "en_name should be provided"
    And response returned to the user with error "ar_name should be provided"

  Scenario: Create stop group duplicate en_name.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    And stop group with english name "Tahrir" and arabic name "تحرير1" is created
    When user request to create new stop group with english name "Tahrir" and arabic name "تحرير"
    Then failure json response returned to the user
    And response returned to the user with error "En name has already been taken"
  
  Scenario: Create stop group duplicate ar_name.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    And stop group with english name "Tahrir1" and arabic name "تحرير" is created
    When user request to create new stop group with english name "Tahrir" and arabic name "تحرير"
    Then failure json response returned to the user
    And response returned to the user with error "Ar name has already been taken"

    Scenario: Create stop group duplicate en_name and ar_name.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    And stop group with english name "Tahrir" and arabic name "تحرير" is created
    When user request to create new stop group with english name "Tahrir" and arabic name "تحرير"
    Then failure json response returned to the user
    And response returned to the user with error "En name has already been taken"
    And response returned to the user with error "Ar name has already been taken"

  Scenario: Create stop group with valid data.
    Given user with name "Ahmed" and password "1234" is created
    And user with name "Ahmed" and password "1234" is logged in successfully
    When user request to create new stop group with english name "Tahrir" and arabic name "تحرير"
    Then successful json response returned to the user
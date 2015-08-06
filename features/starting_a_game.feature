Feature: Starting the game
  As a person who wants to play battleships
  So that I know who I am
  I want to be able to register for a game

  Scenario: Registering a user
    Given I am on the homepage
    And I enter my details
    And I position my ships
    When I press "start"
    Then I should see "Hello, Stephen"

    Given I am on the homepage
    And I enter my details
    And I position my ships
    When I press "start"
    Then I should see "Go on then Stephen"

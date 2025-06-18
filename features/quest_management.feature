Feature: Quest Management
  As a user
  I want to create, complete, and delete quests
  So that I can track my progress effectively

  Background:
    Given I am on the quest list page

  Scenario: Create a new quest
    When I click on the new quest button
    And I fill in the quest title with "Finish Ruby Project"
    And I click the create button
    Then I should see a quest titled "Finish Ruby Project"

  # Scenario: Toggle quest status
  #   Given the quest "Learn Turbo" exists
  #   When I toggle the quest "Learn Turbo"
  #   Then the quest "Learn Turbo" should be marked as completed

  Scenario: Delete a quest
    Given the quest "Clean up specs" exists
    When I delete the quest "Clean up specs"
    Then I should not see the quest titled "Clean up specs"

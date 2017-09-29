Feature: Buyer profile

Scenario: buyer can see his profile
  Given a valid logged in buyer user
  When I click on Profile button
  Then I should see "Budget"

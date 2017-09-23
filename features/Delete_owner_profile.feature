Feature: Owner profile delete

Scenario: user can delete own profile
  Given a valid buyer user
  When I go to the login page
  And I login as "buyer@buyer.com","12345678"
  And I click on Delete Button
  Then I should see "Please log in"
  When I login as "buyer@buyer.com","12345678"
  Then I should see "Invalid email/password combination"

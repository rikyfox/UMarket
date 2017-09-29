Feature: Login as buyer

Scenario: login buyer with valid credentials
  Given a valid buyer user
  When I go to the login page
  And I login as "buyer@buyer.com","12345678"
  Then I should see buyer successful login message

Feature: Login as vendor

Scenario: login vendor with valid credentials
  Given a valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  And I should see vendor successful login message

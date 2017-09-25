Feature: Edit vendor description

Scenario: vendor user can edit his description
  Given a valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  When I edit my profile with "MyDescription"
  Then I should see "MyDescription"

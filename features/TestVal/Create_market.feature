Feature: Create market

Scenario: vendor user creates a new market
  Given a valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  When I click on Create market
  And I create a market as "market1","sport","italia","roma" on the create market page
  And I should see market successful create message

Feature: Delete market

Scenario: vendor user delete an own  market
  Given a valid vendor user
  Given a valid market
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
    When I visit market page
  And I click on Destroy Market
  Then I should see Market deleted
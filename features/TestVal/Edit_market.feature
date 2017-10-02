Feature: Edit market

Scenario: vendor user edit an own market
  Given a valid vendor user
    Given a valid market
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  When I visit market page
  And I go to the edit market page
  And I edit the name as "NegozioEditato"
  Then I should see Market Edited

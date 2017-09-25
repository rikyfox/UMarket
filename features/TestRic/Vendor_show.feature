Feature: Visit showcase of vendor

Scenario: vendor user can see another vendor showcase
  Given a valid vendor user
  And another valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  And I click on link "Vendors"
  When I click on the name of selected user
  Then I should see selected user's posts
  And I should see selected user's description

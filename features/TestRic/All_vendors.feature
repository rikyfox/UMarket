Feature: See All vendors

Scenario: vendor user can see all vendor users
  Given some valid users
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  And I click on link "Vendors"
  When I click on the name of a vendor
  Then I should see selected user's posts
  And I should see selected user's description

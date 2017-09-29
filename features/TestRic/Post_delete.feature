Feature: Visit showcase of vendor

Scenario: vendor user can see another vendor showcase
  Given a valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  And I click on logo "U-MK MAKE YOUR BUSINESS"
  When I click on link delete
  Then I should see "Micropost deleted"


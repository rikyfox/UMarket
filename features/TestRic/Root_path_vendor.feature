Feature: Root vendor

Scenario: Root for vendor
  Given a valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  Then I click on logo "U-MK MAKE YOUR BUSINESS"
  And I should see "TestVendor"
  And I should see "Post"

Feature: Root buyer

Scenario: Root for buyer
  Given a valid buyer user
  When I go to the login page
  And I login as "buyer@buyer.com","12345678"
  Then I click on logo "U-MK MAKE YOUR BUSINESS"
  And I should see "Welcome to U-Market"


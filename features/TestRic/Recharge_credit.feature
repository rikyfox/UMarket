Feature: Buyer reacharge credit

Scenario: buyer user can recharge his credit
  Given a buyer user
  When I go to the login page
  And I login as "buyer@buyer.com","12345678"
  And I should see "100 coins"
  When I click on button "Recharge credit"
  Then I should see "150 coins"

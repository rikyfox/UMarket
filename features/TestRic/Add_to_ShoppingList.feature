Feature: Add article to cart

Scenario: buyer user can see a purchase in his shopping list
  Given a valid vendor user
  Given a market
  Given an article
  Given a valid buyer user
  When I go to the login page
  And I login as "buyer@buyer.com","12345678"
  When I go to the root page
  When I search for name as "Article"
  Then I click on link "Visit"
  And I click on link "ADD to SCart"
  When I click on link "Shopping Cart"
  Then I click on link "BUY"
  When I click on link "Shopping List"
  Then I should see "Article"


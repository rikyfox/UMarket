Feature: Add article to cart

Scenario: buyer user can add an article to cart
  Given a valid vendor user
  Given a market
  Given an article
  Given a valid buyer user
  When I go to the login page
  And I login as "buyer@buyer.com","12345678"
  When I go to the root page
  When I search for name as "Article"
  Then I click on link "Visit"
  Then I should see "Reviews"
  And I click on link "ADD to SCart"
  When I click on link "Shopping Cart"
  Then I should see "Article"


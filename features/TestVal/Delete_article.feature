Feature: Delete article

Scenario: vendor user delete an own article on market page
  Given a valid vendor user
  Given a valid market
  Given a valid article
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  When I visit market page
  And I click on Delete
  Then I should see Article deleted
Feature: Create article

Scenario: vendor user creates a new article on a market page
  Given a valid vendor user
    Given a valid market
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  When I visit market page
  And I click on Create article
  And I create an article as "articolo1","14","true","oggetto da vendere" on the create article page

  Then I should see article successful create message on market page

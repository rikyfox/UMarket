Feature: Edit article

Scenario: vendor user edit an own article on market page
  Given a valid vendor user
    Given a valid market
	Given a valid article
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  When I visit market page
  And I go to the edit article page
  And I edit the name of article as "ArticoloEditato"
  Then I should see Article Edited

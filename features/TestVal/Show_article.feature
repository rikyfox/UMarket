Feature: Show article

Scenario: user view article page 
	Given some valid vendor users
	Given some valid markets
	Given some valid articles
	When I go to the root page
	And I search for name as "articolodi11"
  Then I should see search page2
	When I visit a specific article
	Then I should see price and reviews
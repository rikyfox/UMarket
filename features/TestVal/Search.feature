Feature: Search

Scenario: user search articles and markets
	Given some valid vendor users
	Given some valid markets
	Given some valid articles
	When I go to the root page
	And I search for name as "2"
  Then I should see search page

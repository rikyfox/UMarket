Feature: Follow

Scenario: user vendor follows another vendor
	Given some valid vendor users
	Given some valid markets
	Given some valid articles
	When I go to the login page
	And I login as "vendor1@vendor1.com","12345678"
	And I visit another vendor
	And I click on Follow button
	And I click on Vendors link
	Then I should see TestVendor2 following
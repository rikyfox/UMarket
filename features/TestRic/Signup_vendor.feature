Feature: Signup as vendor

Scenario: User signs up as vendor
When I click on button sign up on the homepage
Then I sign up as "Ciao","aaa@aaa.com","12345678","12345678","vendor" on the sign up page
Then I should see "Welcome to UMarket!"
And I should see description submit button

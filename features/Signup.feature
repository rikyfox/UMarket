Feature: Signup

Scenario: User signs up
When I go to the homepage
And I click on button sign up
Then I'm on sign up page
And I sign up as "Ciao","aaa@aaa.com","12345678","12345678","buyer"
Then I should see delete button

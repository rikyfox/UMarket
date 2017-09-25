Feature: Setting profile

Scenario: user can change his profile
  Given a logged in user
  When I click on Settings button
  Then I update my profile
  And I should see "Profile updated"
  When I go to the login page
  Then I login as "update@update.com","12345678"
  Then I should see "login successful"

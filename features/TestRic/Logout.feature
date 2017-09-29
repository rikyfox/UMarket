Feature: Logout

Scenario: user logout
  Given a logged in user
  When I click on Account button
  And I click on Log out button
  Then I should see logout message

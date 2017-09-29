Feature: Delete user by admin

Scenario: admin can delete user's profile
  Given a valid buyer user
  And the admin user
  When I go to the login page
  And I login as "admin@admin.com","12345678"
  And given all users
  Then I click on link "delete"
  Then I should see delete user message
  When I go to the login page
  And I login as "buyer@buyer.com","12345678"
  Then I should see "Invalid email/password combination"

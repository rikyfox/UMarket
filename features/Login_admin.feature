Feature: Login as admin

Scenario: login admin with valid credentials
  Given the admin user
  When I go to the login page
  And I login as "admin@admin.com","12345678"
  And I should see admin successful login message

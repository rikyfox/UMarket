Feature: Show personal sent messages

Scenario: vendor user can see his sent messages
  Given a valid vendor user
  And another valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  Then I click on link "Vendors"
  When I click on link "Send message"
  Then I compile the form to send a message
  When I click on link "Sent"
  Then I should see "TestVendor"
  And I should see "Subject: Ciao"
  And I should see "Hello"

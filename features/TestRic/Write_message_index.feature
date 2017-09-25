Feature: Send message from users' index

Scenario: vendor user can send a message from bacheca
  Given a valid vendor user
  And another valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  Then I click on link "Vendors"
  When I click on link "Send message"
  Then I compile the form to send a message
  And I should see "Your message was successfully sent!"
  When I go to the login page
  Then I login as "vendor2@vendor2.com","12345678"
  And I click on link "Messages"
  When I click on link "Inbox"
  Then I should see "TestVendor"
  And I should see "Subject: Ciao"
  And I should see "Hello"

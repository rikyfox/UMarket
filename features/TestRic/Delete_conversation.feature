Feature: trashing message

Scenario: vendor user can crawl a conversation
  Given a valid vendor user
  And another valid vendor user
  When I go to the login page
  And I login as "vendor@vendor.com","12345678"
  Then I click on link "Vendors"
  When I click on link "Send message"
  Then I compile the form to send a message
  When I click on link "Sent"
  Then I click on link "View"
  When I click on link "Move to trash"
  And I click on link "Trash"
  Then I click on link "View"
  When I click on link "Delete"
  Then I should see "Your conversation was deleted!"

When(/^given all users$/) do
  expect(User.count).to equal(2)
end


When(/^I click on link "([^"]*)"$/) do |arg1|
  click_link(arg1)
end


Then(/^I should see delete user message$/) do
    expect(User.count).to equal(1)
    expect(page).to have_content("User TestBuyer deleted")
end

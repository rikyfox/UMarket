When(/^I click on Delete Button$/) do
  expect(User.count).to equal(1)
  click_link("Delete me from U-MK")
end

Then(/^I should see Please log in message$/) do
    expect(page).to have_content("Please log in")
    expect(User.count).to equal(0)
end

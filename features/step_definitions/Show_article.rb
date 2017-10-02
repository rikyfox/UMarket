Then(/^I should see search page2$/) do
  expect(page).to have_content("articolodi11")
end

When(/^I visit a specific article$/) do
	click_link("Visit")
end

Then(/^I should see price and reviews$/) do
  expect(page).to have_content("Reviews:")
  expect(page).to have_content("Price:")
end
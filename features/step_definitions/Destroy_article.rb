When(/^I click on Delete$/) do
	click_link("Delete")
end

Then(/^I should see Article deleted$/) do
	assert_current_path(user_market_path(User.last,Market.last))
  expect(page).to have_content("Article deleted")
end
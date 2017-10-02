Given(/^a valid market$/) do
  @market=User.last.markets.create!({:name=>"negozio",:tipo=>"sport",:nation=>"italia",:city=>"roma"})
end

When(/^I visit market page$/) do
	visit user_market_path(User.last, Market.last)
end

When(/^I go to the edit market page$/) do
	click_link("Edit market")
	assert_current_path(edit_user_market_path(User.last, Market.last))
end

When(/^I edit the name as "([^"]*)"$/) do   |arg1|
	page.fill_in 'market_name',:with =>arg1
	click_button("Save changes")
end

Then(/^I should see Market Edited$/) do
	assert_current_path(user_market_path(User.last, Market.last))
  expect(page).to have_content("Market updated")
end
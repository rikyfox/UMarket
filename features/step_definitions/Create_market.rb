When(/^I click on Create market$/) do
  click_link("Create market")
end

And(/^I create a market as "([^"]*)","([^"]*)","([^"]*)","([^"]*)" on the create market page$/) do |arg1, arg2, arg3, arg4|
	assert_current_path(new_user_market_path(User.last))
	page.fill_in 'market_name',:with =>arg1
	page.choose('market_tipo_'+arg2)
	page.fill_in 'market_nation',:with =>arg3
	page.fill_in 'market_city',:with =>arg4
	click_button("Create Market")
	assert_current_path(user_market_path(User.last, Market.last))
end

And(/^I should see market successful create message$/) do
  expect(page).to have_content("Market created!")
end

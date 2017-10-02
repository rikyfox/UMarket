When(/^I click on Create article$/) do
  click_link("Create article")
end

When(/^I create an article as "([^"]*)","([^"]*)","([^"]*)","([^"]*)" on the create article page$/) do |arg1, arg2, arg3, arg4|
	assert_current_path(new_user_market_article_path(User.last,Market.last))
	page.fill_in 'article_name',:with =>arg1
	page.fill_in 'article_prezzo',:with =>arg2
	page.choose('article_status_'+arg3)
	page.fill_in 'article_description',:with =>arg4
	click_button("Create Article")
	assert_current_path(user_market_path(User.last, Market.last))
end

Then(/^I should see article successful create message on market page$/) do
  expect(page).to have_content("Article created!")
end
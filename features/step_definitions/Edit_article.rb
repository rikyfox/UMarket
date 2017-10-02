Given(/^a valid article$/) do
  @article=Market.last.articles.create!({:name=>"articolo",:prezzo=>"14",:status=>"true",:description=>"oggetto da vendere"})
end

When(/^I go to the edit article page$/) do
	click_link("Edit")
	assert_current_path(edit_user_market_article_path(User.last, Market.last, Article.last))
end

When(/^I edit the name of article as "([^"]*)"$/) do   |arg1|
	page.fill_in 'article_name',:with =>arg1
	click_button("Save changes")
end

Then(/^I should see Article Edited$/) do
	assert_current_path(user_market_path(User.last, Market.last))
  expect(page).to have_content("Article updated")
end
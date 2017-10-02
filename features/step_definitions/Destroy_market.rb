When(/^I click on Destroy Market$/) do
	click_link("Destroy market")
end

Then(/^I should see Market deleted$/) do
	assert_current_path(user_path(User.last))
  expect(page).to have_content("Market deleted")
end
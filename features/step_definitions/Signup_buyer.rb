When(/^I click on button sign up on the homepage$/) do
  visit root_path
  click_link("Sign up")
end

Then(/^I sign up as "([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)" on the sign up page$/) do |arg1, arg2, arg3, arg4, arg5|
	assert_current_path(signup_path)
	page.fill_in 'Name',:with =>arg1
	page.fill_in 'Email',:with =>arg2
	page.fill_in 'user_password',:with =>arg3
	page.fill_in 'Password confirmation',:with =>arg4
	page.choose('user_role_'+arg5)
	click_button("Create User")
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  assert_current_path(user_path(User.last))
  expect(page).to have_content(arg1)
end

Then(/^I should see my budget$/) do
  expect(page).to have_content("Budget")
end

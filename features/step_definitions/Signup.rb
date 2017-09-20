When(/^I click on button sign up$/) do
  click_link("Sign up")
end

Then(/^I'm on sign up page$/) do
  assert_current_path(signup_path)
end

Then(/^I sign up as "([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  page.fill_in 'Name',:with =>arg1
  page.fill_in 'Email',:with =>arg2
  page.fill_in 'user_password',:with =>arg3
  page.fill_in 'Password confirmation',:with =>arg4
  page.choose('user_role_'+arg5)
  click_button("Create User")
end

Then(/^I should see delete button$/) do
	assert_current_path(user_path(User.last))
end

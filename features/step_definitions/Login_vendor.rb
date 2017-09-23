Given(/^a valid vendor user$/) do
  @user = User.create!({
			 :name => "TestVendor",
             :email => "vendor@vendor.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "vendor"
           })
end

When(/^I go to the login page$/) do
  visit login_path
end

When(/^I login as "([^"]*)","([^"]*)"$/) do |arg1, arg2|
	page.fill_in 'Email',:with =>arg1
	page.fill_in 'Password',:with =>arg2
	click_button("Log in")
end

Then(/^I should see vendor successful login message$/) do
  assert_current_path(user_path(@user))
  expect(page).to have_content("Vendor login successful")
end




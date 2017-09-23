Given(/^a logged in user$/) do
  @user = User.create!({
			 :name => "TestUser",
             :email => "user@user.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "admin"
           })
   
   visit login_path
   page.fill_in 'Email',:with =>"user@user.com"
   page.fill_in 'Password',:with =>"12345678"
   click_button("Log in")
   
end

When(/^I click on Account button$/) do
  assert_current_path(user_path(@user))
  click_link("Account")
end

When(/^I click on Log out button$/) do
  click_link("Log out")
end

Then(/^I should see logout message$/) do
	assert_current_path(root_path)
	expect(page).to have_content("Logout successful")
end

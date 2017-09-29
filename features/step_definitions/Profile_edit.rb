When(/^I click on Settings button$/) do
   visit login_path
   click_link("Account")
   click_link("Settings")
   
end

Then(/^I update my profile$/) do
  assert_current_path(edit_user_path(@user))
  page.fill_in 'Email',:with =>"update@update.com"
  click_button("Save changes")
end

  
  

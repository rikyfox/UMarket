Given(/^the admin user$/) do
    @userAdm = User.create!({
			 :name => "TestAdmin",
             :email => "admin@admin.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "admin"
           })
end

When(/^I should see admin successful login message$/) do
  assert_current_path(user_path(@userAdm))
  expect(page).to have_content("Admin login successful")
end

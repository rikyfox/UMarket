
Given(/^another valid vendor user$/) do
    @user2 = User.create!({
			 :name => "TestVendor2",
             :email => "vendor2@vendor2.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "vendor",
             :description => "His description"
           })

    @user2.microposts.create(content: "Lorem ipsum")
end

Then(/^I click on the name of selected user$/) do
  click_link(@user2.name)
end

Then (/^I should see selected user's posts$/) do
    assert_current_path(user_path(@user2))
    expect(page).to have_content("Lorem ipsum")
end

Then(/^I should see selected user's description$/) do
  expect(page).to have_content("His description")
end


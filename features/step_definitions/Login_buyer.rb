Given(/^a valid buyer user$/) do
  @user = User.create!({
			 :name => "TestBuyer",
             :email => "buyer@buyer.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "buyer"
           })
end

When(/^I should see buyer successful login message$/) do
  assert_current_path(user_path(@user))
  expect(page).to have_content("Buyer login successful")
end

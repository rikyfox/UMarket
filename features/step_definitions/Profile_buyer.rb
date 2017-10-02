Given(/^a valid logged in buyer user$/) do
  sc = ShoppingCart.create
  sl = ShoppingList.create
  @user = User.create!({
			 :name => "TestBuyer",
             :email => "buyer@buyer.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "buyer",
             :shopping_cart_id => sc.id,
             :shopping_list_id => sl.id
           })

  visit login_path
  page.fill_in 'Email',:with =>"buyer@buyer.com"
  page.fill_in 'Password',:with =>"12345678"
  click_button("Log in")
end

When(/^I click on Profile button$/) do
  assert_current_path(user_path(@user))
  click_link("Account")
  click_link("Profile")
end

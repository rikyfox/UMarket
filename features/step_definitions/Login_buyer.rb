Given(/^a valid buyer user$/) do
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
end

When(/^I should see buyer successful login message$/) do
  assert_current_path(user_path(@user))
  expect(page).to have_content("Buyer login successful")
end

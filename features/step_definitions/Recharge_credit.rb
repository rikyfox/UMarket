Given(/^a buyer user$/) do
  sc = ShoppingCart.create
  sl = ShoppingList.create
  @user = User.create!({
			 :name => "TestBuyer",
             :email => "buyer@buyer.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "buyer",
             :budget => 100,
             :shopping_cart_id => sc.id,
             :shopping_list_id => sl.id,
           })
end

When(/^I click on button "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

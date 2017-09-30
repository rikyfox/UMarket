Given(/^some valid users$/) do

      @user = User.create!({
			 :name => "TestVendor",
             :email => "vendor@vendor.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "vendor"
           })


      @user1 = User.create!({
			 :name => "TestBuyer",
             :email => "buyer2@buyer.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "buyer"
           })

      @user2 = User.create!({
			 :name => "TestVendor1",
             :email => "vendor1@vendor1.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "vendor",
             :description => "His description"
           })

      @user2.microposts.create(content: "Lorem ipsum")

       @user3 = User.create!({
			 :name => "TestVendor2",
             :email => "vendor2@vendor2.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "vendor",
           })

end

When(/^I click on the name of a vendor$/) do
  expect(page).to have_content(@user3.name)
  expect(page).not_to have_content(@user1.name)
  click_link(@user2.name)
end

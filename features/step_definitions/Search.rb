Given(/^some valid vendor users$/) do

      @user1 = User.create!({
			 :name => "TestVendor1",
             :email => "vendor1@vendor1.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "vendor",
             :description => "His description"
           })

       @user2 = User.create!({
			 :name => "TestVendor2",
             :email => "vendor2@vendor2.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :role => "vendor",
           })

end

Given(/^some valid markets$/) do

      @market1 = @user1.markets.create!({:name=>"negoziodi1",:tipo=>"sport",:nation=>"italia",:city=>"roma"})

      @market2 = @user2.markets.create!({:name=>"negoziodi2",:tipo=>"sport",:nation=>"francia",:city=>"parigi"})

end

Given(/^some valid articles$/) do

      @article11 = @market1.articles.create!({:name=>"articolodi11",:prezzo=>"14",:status=>"true",:description=>"oggetto da vendere di 1"})

      @article12 = @market1.articles.create!({:name=>"articolodi12",:prezzo=>"14",:status=>"false",:description=>"oggetto da vendere di 1"})
	  
      @article21 = @market2.articles.create!({:name=>"articolodi21",:prezzo=>"14",:status=>"true",:description=>"oggetto da vendere di 2"})
      
	  @article22 = @market2.articles.create!({:name=>"articolodi22",:prezzo=>"14",:status=>"true",:description=>"oggetto da vendere di 2"})

end


When(/^I go to the root page$/) do
	visit root_path
	assert_current_path(root_path)
end

When(/^I search for name as "([^"]*)"$/) do |arg1|
	page.fill_in 'q',:with =>arg1
	click_button("Search")
end

Then(/^I should see search page$/) do
  expect(page).to have_content("articolodi12")
  expect(page).to have_content("articolodi21")
  expect(page).to have_content("articolodi22")
  expect(page).to have_content("negoziodi2")
end


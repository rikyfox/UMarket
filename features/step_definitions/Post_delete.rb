When(/^I click on logo "([^"]*)"$/) do |arg1|
  @user.microposts.create(content: "Lorem ipsum")
  page.find("#logo").click
end

When(/^I click on link delete$/) do
  expect(@user.microposts.count).to equal(1) # passes if a.equal?(b)
  click_link("delete")
  expect(@user.microposts.count).to equal(0)
end

When(/^I edit my profile with "([^"]*)"$/) do |arg1|
  page.fill_in 'user[description]',:with =>arg1
  click_button("Edit description")
end

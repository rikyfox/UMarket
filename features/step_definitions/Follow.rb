When(/^I visit another vendor$/) do
	visit user_path(User.last)
end

When(/^I click on Follow button$/) do
	click_button("Follow")
end

When(/^I click on Vendors link$/) do
	click_link("Vendors")
end

Then(/^I should see TestVendor2 following$/) do
  expect(page).to have_content("TestVendor2")
end

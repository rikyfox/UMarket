Then(/^I should see description submit button$/) do
  expect(page).to have_selector("input[type=submit][value='Edit description']")
end


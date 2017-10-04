Then("I create my comment as {string}") do |string|
  page.fill_in 'review[content]',:with =>string
  click_button("Post_review")
end


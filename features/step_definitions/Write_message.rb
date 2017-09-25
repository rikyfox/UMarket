Then(/^I compile the form to send a message$/) do
    find('#conversation_recipients').find(:xpath, 'option[1]').select_option
	page.fill_in 'Subject',:with =>"Ciao"
	page.fill_in 'conversation[body]',:with =>"Hello"
	click_button("Send Message")
end
